`timescale 1ns/1ps
// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
 
    inout vssd1,	// User area 1 digital ground
  
`endif

  input clk,
    input [7:0] rd_addr,
    output [31:0] rd_data,
    
    input [7:0] wr_addr,
    input [31:0] wr_data,
    
    input C0,//naming of these doesnt really matter
    input C1,// C0,C1 select write port width
    input C2,// C2,C3 select read port width
    input C3,
    input C4,//C4 selects the alwaysWriteEnable
    input C5 //C5 selects register bypass
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

   BlockRAM_1KB Inst_BlockRAM_0 (
`ifdef USE_POWER_PINS
        .VPWR(vccd1),
        .VGND(vssd1),
`endif
        .clk(clk),
        .rd_addr(rd_addr),
        .rd_data(rd_data),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .C0(C0),
        .C1(C1),
        .C2(C2),
        .C3(C3),
        .C4(C4),
        .C5(C5)
    );

endmodule	// user_project_wrapper

`default_nettype wire
