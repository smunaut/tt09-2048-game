/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

module draw_numbers (
    input wire [3:0] index,
    input wire [5:0] x,
    input wire [5:0] y,
    output reg pixel
);

  wire [7:0] rom_out;
  wire active;

  rom_2600 rom_I (
    .addr ({index, y[4:0], x[5:3]}),
    .q    (rom_out)
  );

  assign active = ^y[5:4];
  assign pixel = rom_out[x[2:0]] & active;

endmodule
