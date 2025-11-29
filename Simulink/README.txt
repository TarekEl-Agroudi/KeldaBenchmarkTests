========================================================================
             MPD CHOKE PRESSURE CONTROL BENCHMARK SUITE
========================================================================

Author:   Tarek El-Agroudi
Date:     06-11-2025
Contact:  tareke@stud.ntnu.no / tarek@kelda.no

------------------------------------------------------------------------
1. OVERVIEW
------------------------------------------------------------------------
This benchmark suite provides a standardized simulation environment for 
testing Choke Pressure Control algorithms in Managed Pressure Drilling 
(MPD). It utilizes high-fidelity FMU (Functional Mock-up Unit) models 
to simulate realistic wellbore physics, including acoustic waves and 
nonlinear choke characteristics.

The suite includes 7 standardized test scenarios covering routine 
operations and stability verification.

------------------------------------------------------------------------
2. SYSTEM REQUIREMENTS
------------------------------------------------------------------------
-- Software --
* MATLAB & Simulink: Version R2020b or newer.
  (R2020b+ is required for native FMU Import support without add-ons).
* Operating System: Windows.
  (Future versions will support Linux and macOS).

-- Toolboxes --
* Simulink (Required).
* Control System Toolbox (Recommended for controller tuning/design).

------------------------------------------------------------------------
3. DIRECTORY STRUCTURE
------------------------------------------------------------------------
Ensure your folder structure looks exactly like this. The script relies 
on relative paths to find models and controllers.

[Root Folder]
 |
 +-- RunBenchmarkTests.m            <-- Main execution script
 +-- BenchmarkTestHarness.slx       <-- Simulation environment
 +-- README.txt
 |
 +-- controllers/                   <-- SAVE YOUR CONTROLLERS HERE
 |    +-- ExternalController.slx    (Use as template)
 |    +-- MyChokePressureController.slx
 |
 +-- fmu/                           <-- DO NOT MODIFY
 |    +-- BM01_Land.fmu
 |    +-- BM02_DeepwaterMPD.fmu
 |    +-- BM03_DeepwaterCML.fmu
 |    +-- SelectedFMU.fmu           (Auto-generated during runtime)
 |
 +-- Utils/                         <-- UTILITIES
 |    +-- linearChirp.m
 |    +-- assignAllVariables.m
 |
 +-- reports/                       <-- Output folder (Auto-generated)

------------------------------------------------------------------------
4. HOW TO RUN
------------------------------------------------------------------------

STEP 1: PREPARE YOUR CONTROLLER
   Create a Simulink model (.slx) containing your control logic. 
   Save this file inside the "controllers" folder.
   
   RECOMMENDATION: Use the provided "ExternalController.slx" as a 
   starting point or template to ensure correct port interfaces.

   NOTE: Your controller must be compatible with Model Reference 
   settings (i.e., it should not have conflicting solver settings).

STEP 2: START THE SCRIPT
   Open MATLAB, navigate to the root folder, and type:
   >> RunBenchmarkTests

STEP 3: SELECT SCENARIOS
   A dialog box will appear. Select one or multiple tests:
   - T1: Pressure Steps (Tracking performance)
   - T2: Downlinking (Setpoint changes)
   - T3: Flow Ramps (Disturbance rejection)
   - T4: Connection (Full connection procedure simulation)
   - T5: Shut-off + Ramp-up (Trapped pressure handling)
   - T6: Stability Margins (Nominal flow)
   - T7: Stability Margins (Low flow/Connection)

STEP 4: SELECT WELL & CONTROLLER
   Select the specific well model (Land, Deepwater, or CML).
   Select your controller file from the list.

STEP 5: REPORTING
   Choose whether to generate a PDF report (Dark or Light theme).
   If selected, the report will automatically open upon completion.

------------------------------------------------------------------------
5. OUTPUTS
------------------------------------------------------------------------
After execution, results are saved in the "reports" folder:
Path: ./reports/Benchmark_[WellName]_[ControllerName]/

Files generated:
1. Results.mat          -> Contains raw data structs and SimOutput objects.
2. BenchmarkReport.pdf  -> Visual summary of performance.
3. [Plot Files]         -> Individual plots for tests performed.

------------------------------------------------------------------------
6. TROUBLESHOOTING
------------------------------------------------------------------------

ISSUE: "No controller models found..."
SOLUTION: Ensure you have saved a .slx file inside the "controllers" 
directory. The script does not look in the root folder.

ISSUE: "Failed to link controller model"
SOLUTION: The script attempts to place your model into the harness using 
Model Reference. Ensure your model inputs/outputs match the harness 
requirements and that the file is not corrupted.

ISSUE: FMU / Simulation Crash
SOLUTION: Ensure you are using MATLAB R2020b or newer. If you are on 
an older version, FMU Import is not natively supported without the 
"Simulink Compiler" or "FMI Kit" add-ons. 

========================================================================