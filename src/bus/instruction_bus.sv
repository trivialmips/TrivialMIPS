`include "common_defs.svh"

module instruction_bus(
    Bus_if.slave  cpu,
    Bus_if.master ram,
    Bus_if.master bootrom
);

    // instructions are read-only, and do not need masks
    assign bootrom.address = cpu.address[2 +: `BOOTROM_ADDRESS_WIDTH];
    assign bootrom.read = 1'b1;
    assign bootrom.mask = `BYTE_MASK_FULL;

    assign ram.address = cpu.address[2 +: `RAM_ADDRESS_WIDTH];
    assign ram.mask = `BYTE_MASK_FULL;

    always_comb begin
        ram.read      = `ZERO_BIT;
        ram.write     = `ZERO_BIT;
        cpu.data_rd   = `ZERO_WORD;
        cpu.data_rd_2 = `ZERO_WORD;
        cpu.stall     = `ZERO_BIT;

        unique casez (cpu.address[`ADDRESS_WIDTH - 1 -: `LONGEST_ADDRESS_PREFIX_WIDTH])
            `CONCAT_PREFIX(RAM): begin
                // instruction from ram
                ram.read      = cpu.read;
                ram.write     = cpu.write;
                cpu.data_rd   = ram.data_rd;
                cpu.data_rd_2 = ram.data_rd_2;
                cpu.stall     = ram.stall;
            end

           `CONCAT_PREFIX(BOOTROM): begin
                // instruction from bootrom
                cpu.data_rd   = bootrom.data_rd;
                cpu.data_rd_2 = bootrom.data_rd_2;
            end
        endcase

    end

endmodule