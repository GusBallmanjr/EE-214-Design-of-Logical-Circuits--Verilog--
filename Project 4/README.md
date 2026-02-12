# Project 4 - Combinational Building Blocks
EE 214 Design of Logical Circuits

## Overview
This project explores several foundational combinational logic components, including multiplexors, decoders, encoders, and shifters. Each circuit is designed in Verilog, simulated for correctness, and in most cases implemented on the ZYNQ‑based Blackboard using slide switches, pushbuttons, and LEDs.

## 1. 8:1 1‑Bit Multiplexor
An 8‑to‑1 single‑bit multiplexor is simulated and implemented on hardware.  
+ Three pushbuttons act as select inputs  
+ Eight slide switches serve as data inputs  
+ One green LED displays the selected output  
The circuit is verified on the Blackboard to ensure correct selection behavior.

## 2. 4:1 3‑Bit Bus Multiplexor
A 4‑to‑1 multiplexor that routes 3‑bit data buses is implemented on the Blackboard.  
+ Twelve slide switches provide four 3‑bit input groups  
+ Two pushbuttons select which input group is routed  
+ Three LEDs display the selected 3‑bit output  

## 3. 8:1 8‑Bit Bus Multiplexor (Simulation Only)
An 8‑to‑1 multiplexor that selects among eight 8‑bit inputs is simulated.  
+ Each input is assigned a unique 8‑bit value  
+ Simulation verifies that the select lines correctly determine the output  
This circuit is not implemented on hardware.

## 4. 2:4 Decoder with Pushbutton Enable
A decoder circuit is designed to illuminate one of four LEDs based on a selected channel.  
+ Two slide switches select which LED channel is enabled  
+ Four pushbuttons act as activation inputs  
+ Each decoder output is ANDed with a corresponding pushbutton  
Only the selected channel’s LED responds to its pushbutton.

## 5. 4:2 Priority Encoder (Simulation Only)
A Verilog description of a 4‑to‑2 priority encoder is created along with a complete testbench.  
+ All input patterns are simulated  
+ The encoder outputs the binary code of the highest‑priority asserted input  
This circuit is not implemented on hardware.

## 6. 8‑Bit Shifter and Rotator
A configurable 8‑bit shifter is designed, simulated, and implemented on the Blackboard.  
+ Eight slide switches provide the input value  
+ Four switches select shift amount, direction, and shift vs. rotate  
+ A pushbutton provides the fill bit for shifting  
+ Eight LEDs display the shifted or rotated output  
The circuit supports left/right shifts and rotates by 0–3 positions.

## Summary
This project reinforces core concepts in combinational logic design, including multiplexing, decoding, encoding, and shifting. Through simulation and hardware implementation, it builds practical experience with Verilog, FPGA workflows, and digital circuit behavior.
