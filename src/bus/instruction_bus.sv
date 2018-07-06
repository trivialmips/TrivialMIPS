`include "common_defs.svh"

module instruction_bus(
    Bus_if.slave  cpu,
    Bus_if.master ram,
    Bus_if.master bootrom
);

    // instructions are read-only, and do not need masks
    assign bootrom.address = cpu.address[`BOOTROM_ADDRESS_WIDTH - 1:0];
    assign ram.address = cpu.address[`RAM_ADDRESS_WIDTH - 1:0];

    always_comb begin
        ram.read      = `ZERO_BIT;
        ram.write     = `ZERO_BIT;
        cpu.data_rd   = `ZERO_WORD;
        cpu.data_rd_2 = `ZERO_WORD;
        cpu.stall     = `ZERO_BIT;

        // TODO: implement simultaneous read (64 bits) on ibus
        if (`MATCH_PREFIX(cpu.address, `RAM_ADDRESS_PREFIX)) begin
            // instruction from ram
            ram.read      = cpu.read;
            ram.write     = cpu.write;
            cpu.data_rd   = ram.data_rd;
            cpu.data_rd_2 = ram.data_rd_2;
            cpu.stall     = ram.stall;
        end else if (`MATCH_PREFIX(cpu.address, `BOOTROM_ADDRESS_PREFIX)) begin
            // instruction from bootrom
            cpu.data_rd   = bootrom.data_rd;
            cpu.data_rd_2 = bootrom.data_rd_2;
        end
    end

endmodule