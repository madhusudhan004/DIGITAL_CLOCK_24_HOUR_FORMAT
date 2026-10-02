remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog {../rtl/digital_clock_24.v ../rtl/bcdto7segdec.v ../rtl/top_digital_clock_24.v}

elaborate top_digital_clock_24

link

check_design 

current_design top_digital_clock_24

compile_ultra -no_autoungroup

create_clock -name clock -period 20 [get_ports clock]

set_input_delay 0.1 -clock clock [remove_from_collection [all_inputs] [get_ports clock]]

set_output_delay 0.1 -clock clock [all_outputs]

write_file -f verilog -hier -output digital_clock_24_netlist.v

redirect -file digital_clock_24_area.rpt { report_area } 

redirect -file digital_clock_24_power.rpt { report_power }

redirect -file digital_clock_24_timing.rpt { report_timing }
