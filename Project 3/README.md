# Project 3 — Combinational Circuits
EE 214 Design on Logical Circuits

## Overview
This project contains four digital logic designs implemented in Verilog and tested on the ZYNQ‑based Blackboard. Each design is derived from truth‑table or K‑Map analysis and demonstrates core concepts in combinational logic, minimization, and hardware verification.

The circuits use slide switches and pushbuttons as inputs and LEDs as outputs to model real‑world logic behaviors.

## Projects

### 1. Five‑Switch Toggle Light
A circuit is designed to model a room with five independent light switches controlling a single light.  
+ Any switch toggles the state of the light (ON → OFF or OFF → ON).  
+ A truth table captures all 32 input combinations.  
+ The resulting logic is implemented in Verilog and demonstrated using five switches and one LED.

### 2. Majority‑of‑Five Circuit
A majority detector asserts its output when **three or more** of the five inputs are high.  
+ A minimized Boolean expression is derived using K‑Maps.  
+ The circuit is implemented in Verilog and simulated thoroughly.  
+ Hardware verification is performed on the Blackboard.

### 3. Temperature Range Indicator
A digital thermometer output (0–255) is emulated using eight slide switches.  
+ The circuit outputs HIGH when the temperature is **greater than 62.5°F and less than 72.5°F**.  
+ A truth‑table/K‑Map reduction identifies the required logic.  
+ A Verilog module and testbench simulate the behavior.  
+ One LED indicates whether the temperature is within the target range.

### 4. Dashboard Indicator Logic
Two automotive indicator signals are implemented:  
+ **Service Indicator (SI)**  
+ **Check Engine (CE)**  

Both outputs are driven by five sensor inputs: coolant low, temperature high, oil low, exhaust fault, and oil temperature high.  
+ Minimal logic expressions are derived from the given conditions.  
+ A Verilog module drives two LEDs (Red for SI, Blue for CE).  
+ The design is implemented and verified on hardware.
