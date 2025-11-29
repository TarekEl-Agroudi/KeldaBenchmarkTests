# A Benchmark Suite for Choke Pressure Control in Managed Pressure Drilling

**Authors:** Tarek El-Agroudi, Ole-Magnus Brastein, Glenn-Ole Kaasa, Lars Imsland

This repository contains the benchmark test platform associated with the article: **"A Benchmark Suite for Choke Pressure Control in Managed Pressure Drilling"**.

The suite is designed to test Choke Pressure Control algorithms using high-fidelity FMU models, covering routine operations, disturbances, and stability verification.

## Abstract

Managed Pressure Drilling (MPD) represents a challenging class of industrial control problems characterized by distributed dynamics, hydraulic resonances, and input nonlinearities. To facilitate standardized control development for such systems, this paper presents a standardized benchmark suite for MPD choke pressure control, designed to bridge the gap between academic theory and industrial application. The suite includes a high-fidelity simulator comprising three test wells, representing Land/Shallow-water MPD, Deepwater MPD, and Controlled Mud Level (CML) operations, validated against field data. We define a representative set of seven benchmark scenarios covering nominal operations, connection procedures, pump faults, and robust stability verification, alongside a Key Performance Indicator (KPI) framework. To ensure broad accessibility beyond the MATLAB ecosystem, the simulator is provided both as a native MATLAB/Simulink package and as a standalone executable with a generic UDP interface. A gain-scheduled I-P controller is included to serve as a performance baseline. The proposed framework supports simulation speeds up to 50-180 x real-time on standard hardware, enabling efficient, reproducible, and standardized evaluation of advanced MPD choke pressure control strategies.

## Repository Structure

This project is divided into two distinct frameworks depending on your development environment:

### 1. [SimulinkFramework](./SimulinkFramework)
**For MATLAB/Simulink Users.**
* **Best for:** Researchers developing controllers natively in Simulink.
* **Features:** Native Simulink harness, automated reporting, and pre-configured controller templates.
* **Requires:** MATLAB R2020b+.

### 2. [ExternalControllerFramework](./ExternalControllerFramework)
**For Matlab, Python, C++, C#, Java, or PLC Users.**
* **Best for:** Testing algorithms written in any language, or Hardware-in-the-Loop (HIL) testing.
* **Features:** Standalone Windows Executable that communicates via UDP. Includes a "Lock-step" protocol for deterministic simulation regardless of language speed.
* **Requires:** Windows 10/11 for the simulator; Any language for the controller.

---
**Contact:** Tarek El-Agroudi, tareke@stud.ntnu.no / tarek@kelda.no
