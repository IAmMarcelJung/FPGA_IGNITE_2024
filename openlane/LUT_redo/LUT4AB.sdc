create_clock [get_ports $::env(CLOCK_PORT)]  -name $::env(CLOCK_PORT)  -period $::env(CLOCK_PERIOD)
#set input_delay_value [expr $::env(CLOCK_PERIOD) * $::env(IO_PCT)]
#set output_delay_value [expr $::env(CLOCK_PERIOD) * $::env(IO_PCT)]
#puts "\[INFO\]: Setting output delay to: $output_delay_value"
#puts "\[INFO\]: Setting input delay to: $input_delay_value"


set clk_indx [lsearch [all_inputs] [get_port $::env(CLOCK_PORT)]]
#set rst_indx [lsearch [all_inputs] [get_port resetn]]
set all_inputs_wo_clk [lreplace [all_inputs] $clk_indx $clk_indx]
#set all_inputs_wo_clk_rst [lreplace $all_inputs_wo_clk $rst_indx $rst_indx]
set all_inputs_wo_clk_rst $all_inputs_wo_clk


# correct resetn
#set_input_delay $input_delay_value  -clock [get_clocks $::env(CLOCK_PORT)] $all_inputs_wo_clk_rst
set_input_delay 1.0  -clock [get_clocks $::env(CLOCK_PORT)] $all_inputs_wo_clk_rst
#set_input_delay 0.0 -clock [get_clocks $::env(CLOCK_PORT)] {resetn}
#set_output_delay $output_delay_value  -clock [get_clocks $::env(CLOCK_PORT)] [all_outputs]
set_output_delay 2.0  -clock [get_clocks $::env(CLOCK_PORT)] [all_outputs]

# TODO set this as parameter
set_driving_cell -lib_cell $::env(SYNTH_DRIVING_CELL) -pin $::env(SYNTH_DRIVING_CELL_PIN) [all_inputs]
set cap_load [expr $::env(SYNTH_CAP_LOAD) / 1000.0]
puts "\[INFO\]: Setting load to: $cap_load"
set_load  $cap_load [all_outputs]

## above setting copied from script/base.sdc
## set for timing loop
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J2MID_ABa_BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J2MID_CDa_BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J2MID_EFa_BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J2MID_GHa_BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J2MID_ABb_BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J2MID_CDb_BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J2MID_EFb_BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J2MID_GHb_BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J2END_AB_BEG*/X] 
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J2END_CD_BEG*/X] 
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J2END_EF_BEG*/X] 
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J2END_GH_BEG*/X] 
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux161_buf_JN2BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux161_buf_JE2BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux161_buf_JS2BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux161_buf_JW2BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J_l_AB_BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J_l_CD_BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J_l_EF_BEG*/X]
set_disable_timing [get_pins Inst_LUT4AB_switch_matrix/inst_cus_mux41_buf_J_l_GH_BEG*/X]

