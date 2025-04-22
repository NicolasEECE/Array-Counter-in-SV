# Array-Counter-in-SV
This repository consists of a System Verilog script that implements an array counter as well as a testbench for verification.

- The array counter consists of 8 counters that function independently from one anoyher. Each counter has 5 bits.
- The user can increase or decrease the selected counter through the 3-bit address "incr_addr" and "decr_addr" respectively.
- The activation of increasing or decreasing in a clock cycle happens with the activation of the signals "incr" and "decr" respectively.
- If the user requests an increase and a decrease in the same sycle, but the addresses "incr_addr" and "decr_addr" are the same, then the selected counter retains its value.
