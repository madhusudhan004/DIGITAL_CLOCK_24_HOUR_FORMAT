### Project Description

This project presents the complete RTL design, functional verification, and synthesis analysis of a 24-hour digital clock using Verilog HDL, following an end-to-end ASIC VLSI design flow. The clock is designed around a 256 Hz input clock, with a clock counter generating a one-second timing interval.
The RTL implements independent **BCD counters for seconds, minutes, and hours, supporting normal counting, 59 → 00seconds and minutes rollover, and the 23:59:59 → 00:00:00 24-hour rollover. An asynchronous active-low reset is implemented to initialize the clock, along with loadable time inputs for setting the starting HH:MM:SS value. 
The design also includes defensive validation of invalid BCD time values, automatically correcting values outside the valid seconds 00–59, minutes 00–59, and hours 00–23 ranges.

A dedicated BCD-to-7-segment decoder is integrated for displaying each clock digit using active-low segment outputs. A structured Verilog testbench is developed with directed test cases covering normal operation, digit transitions, rollover conditions, boundary cases, reset behavior, and invalid time inputs. 
Functional verification is performed using QuestaSim, followed by functional/code coverage analysis and coverage reporting to evaluate the completeness of the verification environment.

The verified RTL is synthesized using Synopsys Design Compiler through TCL scripting, enabling analysis of the synthesized design's area, power, and timing characteristics. Overall, the project demonstrates an end-to-end digital ASIC workflow:

RTL Logic → Verilog RTL → Testbench → QuestaSim Simulation → Functional Coverage → Coverage Report → TCL Synthesis Flow → Synopsys Design Compiler → Area / Power / Timing Analysis

This project provides practical exposure to RTL design, Verilog HDL, testbench development, simulation, functional verification, coverage-driven verification, synthesis, and PPA analysis.
