#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import thinpad_cloud_sdk.thinpad as thinpad
import sys
import time
import logging
import signal
import traceback
from pathlib import Path

t = thinpad.ThinpadCloud()

def set_switch():
    print('Set switches to boot from flash')
    t.set_all_switchs(dip_sw=[0]*32)
    t.set_dip_sw(0, 1)


def reset_board():
    t.set_reset_btn(1)
    time.sleep(0.01)
    t.set_reset_btn(0)
    time.sleep(0.3)


def upload_and_run_test(test):
    print('Found test ELF file: ' + str(test))
    print('Uploading test to flash')
    t.write_memory(thinpad.MEM_FLASH, test.read_bytes(), offset=0)
    print('Uploading bitstream')
    t.upload_design(sys.argv[3])
    reset_board()


def run_func_test(test):
    # upload_and_run_test(test)
    print('Start running functional test.')

def run_perf_test(test):
    print('\n\n')
    print('Start running performance test')
    upload_and_run_test(test)
    print('UART result in 5 seconds:')
    result = bytes(t.read_uart(1 << 20, timeout=5)).decode('utf-8')
    print(result)
    print('\n\n')


def main():
    print("--- SDK Version:", thinpad.__version__, '---')
    logging.basicConfig(level=logging.INFO)

    if len(sys.argv) < 4:
        print('Usage:', sys.argv[0], '<username> <password> <thinpad_top.bit>')
        sys.exit(1)

    def signal_handler(sig, frame):
        print('You pressed Ctrl+C!')
        t.close()
        sys.exit(0)

    signal.signal(signal.SIGINT, signal_handler)

    # find software dir
    software_dir = Path(__file__).resolve().parents[2] / 'software'

    try:
        print("--- Login ---")
        t.login(sys.argv[1], sys.argv[2])
        t.allocate_board(thinpad.BOARD_REV2)
        t.open_uart_port(thinpad.UART_EXT, baud=115200)

        set_switch()

        func_test_file = software_dir / 'func_test' / 'main.elf'

        run_func_test(func_test_file.resolve())

        perf_test_dir = software_dir / 'perf_test' / 'obj'

        perf_test_lists = [x / 'main.elf' for x in perf_test_dir.iterdir() if x.is_dir()]

        for test in perf_test_lists:
            run_perf_test(test.resolve())

    except:
        traceback.print_exc()

    print('-- Disconnect --')
    t.close()

if __name__ == '__main__':
    main()