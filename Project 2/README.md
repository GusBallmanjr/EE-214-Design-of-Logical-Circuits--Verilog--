# Project 2 — Combinational Logic Circuits
EE 214 Design of Logical Circuits

## Overview
This project implements several combinational logic circuits in Verilog using slide switches, pushbuttons, and LEDs on the ZYNQ‑based Blackboard. The work includes analyzing existing circuits, recreating their behavior using SOP and POS logic, and designing new circuits based on specified input conditions.

All designs are implemented in Vivado, synthesized, constrained to the correct device pins, and verified on hardware.

## Features

### 1. SOP Logic Implementation
A Verilog module is created to reproduce the behavior of three provided circuits.  
+ Eight slide switches (sw[7:0]) serve as inputs  
+ Three LEDs (led[2:0]) serve as outputs  
+ Each LED is driven by a Sum‑of‑Products (SOP) expression derived from truth‑table analysis  
+ A constraints file maps switches and LEDs to the correct ZYNQ pins  

### 2. POS Logic Implementation
The SOP equations are commented out and replaced with equivalent Product‑of‑Sums (POS) expressions.  
Both SOP and POS versions remain in the source file for comparison.

### 3. Circuit 4 Recreation
A fourth downloaded circuit uses switches SW3–SW6 as inputs and drives LD3.  
+ The circuit is probed and analyzed  
+ A truth table or K‑Map is created  
+ A new Verilog module is written to match the circuit’s behavior exactly  
+ The design is synthesized and verified on the Blackboard

### 4. Custom Pushbutton‑Driven Circuit
A new circuit is designed using four pushbuttons as inputs and six LEDs as outputs.  
Each LED illuminates based on specific input conditions:
+ One input asserted  
+ Any two inputs asserted  
+ Any three inputs asserted  
+ All four inputs asserted  
+ Odd number of inputs asserted  
+ Even number of inputs asserted  
