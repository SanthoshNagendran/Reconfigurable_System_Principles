/*
 * DO NOT EDIT THIS FILE, your changes will be overwritten
 * This is an automatically generated file.
 * It was generated with uasm, the microassembler, on
 * Wed Nov 27 15:21:25 2019
 */

/*
 * The assembly file generated a total data width of 45 bits for 
 * 9 fields. The maximum address encountered was 0x7ff, needing 
 * 11 bits
 */

module MICROCODE_ROM (ADDR_in,ROM_out);
   input  [10:0] ADDR_in;
   output [44:0] ROM_out;

   reg    [44:0] ROM_out_r;

   assign ROM_out = ROM_out_r;
   always @(ADDR_in)
     begin
        case(ADDR_in)
          /* START: */
          11'h0: ROM_out_r = 45'b001_000_000_0000_0000_0_0000_0000000000000000_0000100;
          11'h1: ROM_out_r = 45'b000_000_000_0000_0000_0_0000_0000000000000000_0000001;
          11'h2: ROM_out_r = 45'b000_000_010_0000_0000_0_0000_0000000000000000_0000001;
          11'h3: ROM_out_r = 45'b000_000_000_0000_0000_0_0000_0000000000000000_0000000;
          11'h4: ROM_out_r = 45'b000_000_000_0000_0000_0_0000_0000000000000000_0000000;
          11'h5: ROM_out_r = 45'b010_000_000_0000_0000_0_0000_0000000000000000_0000100;
          11'h6: ROM_out_r = 45'b001_000_000_0001_0000_0_0001_0000000000010101_0000010;
          11'h7: ROM_out_r = 45'b000_000_001_0000_0000_0_0000_0000000000000000_0000000;
          11'h8: ROM_out_r = 45'b000_000_010_0000_0000_0_0000_0000000000000000_0000000;
          11'h9: ROM_out_r = 45'b000_000_100_0000_0000_0_0000_0000000000000000_0000000;
          11'ha: ROM_out_r = 45'b001_010_011_0100_0000_0_0000_0000000000000000_0000000;
          11'hb: ROM_out_r = 45'b000_000_000_0000_0000_0_0011_0000000000001101_0000000;
          11'hc: ROM_out_r = 45'b000_010_110_0000_0000_0_0010_0000000000010010_0000000;
          /* SKIP: */
          11'hd: ROM_out_r = 45'b000_000_000_0000_0000_0_0100_0000000000010001_0000000;
          11'he: ROM_out_r = 45'b000_000_000_0000_0000_0_0110_0000000000010100_0000000;
          11'hf: ROM_out_r = 45'b000_000_000_0000_0000_0_1000_0000000000010101_0000000;
          11'h10: ROM_out_r = 45'b000_000_000_0000_0000_0_0001_0000000000010010_0000000;
          /* END: */
          11'h11: ROM_out_r = 45'b100_001_100_0011_0000_0_0001_0000000000010110_0000000;
          /* L1: */
          11'h12: ROM_out_r = 45'b000_000_000_0000_0000_0_0000_0000000000010100_0000000;
          11'h13: ROM_out_r = 45'b100_000_100_0001_0000_0_0001_0000000000010101_0000000;
          /* L2: */
          11'h14: ROM_out_r = 45'b100_010_100_0011_0000_0_0001_0000000000010001_0000000;
          /* DONE: */
          11'h15: ROM_out_r = 45'b100_000_000_0000_0000_0_0001_0000000000010100_0000000;
          /* LOOP: */
          11'h16: ROM_out_r = 45'b000_000_111_0000_0000_1_0001_0000000000000000_0000000;
          11'h7ff: ROM_out_r = 45'b000_000_000_0000_0000_0_0000_0000000000000000_0000000;
          default: ROM_out_r = 45'b0;
       endcase
     end
endmodule
