# AMBA AHB-to-APB Bridge in Verilog

A synthesizable AHB-to-APB bridge designed from scratch in Verilog and verified
in AMD Vivado. Built as a portfolio project targeting RTL/frontend VLSI
internships. The bridge converts AHB-Lite master transactions into APB
peripheral transactions per the ARM AMBA specification.

## Architecture

AHB Master → AHB Slave Interface → APB FSM Controller → APB Interface → APB Peripheral

The bridge implements a complete AHB-to-APB datapath: an AHB Slave Interface
captures address/control/write-data from the AHB master, an APB FSM Controller
sequences the IDLE → SETUP → ACCESS states, and an APB Interface drives the
resulting PSEL/PENABLE/PWRITE/PADDR/PWDATA signals and samples PRDATA/PREADY.

## Modules

| Module               | File                     | Description                                          |
|-----------------------|--------------------------|-------------------------------------------------------|
| AHB Master            | AHB_Master.v             | Generates AHB-Lite read/write transactions            |
| AHB Slave Interface   | AHB_Slave_Interface.v    | Captures AHB address, control, and write-data signals |
| APB Controller (FSM)  | APB_Controller.v         | IDLE → SETUP → ACCESS state machine per APB protocol  |
| APB Interface         | APB_Interface.v          | Drives PSEL/PENABLE/PWRITE/PADDR/PWDATA, samples PRDATA/PREADY |
| Bridge Top            | bridge_top.v             | Full integration of all modules                       |

## Simulation Results

All modules verified via behavioral simulation in Vivado.

### AHB-to-APB Write Transaction
*(waveform screenshot here)*

### AHB-to-APB Read Transaction
*(waveform screenshot here)*

## Tools Used

- **HDL:** Verilog
- **Simulation & Synthesis:** AMD Vivado

## How to Simulate

1. Open `AHB2APB.xpr` in Vivado
2. Add the testbench as the simulation top module
3. Run Behavioral Simulation
4. Add signals to the waveform viewer and inspect AHB-to-APB conversion
5. Run Synthesis to generate the synthesized netlist

## Key Concepts Demonstrated

- RTL design and simulation workflow
- AMBA AHB-Lite and APB protocol conversion
- FSM-based bus bridge design
- Single-cycle AHB transaction to two-cycle APB transaction (SETUP/ACCESS) mapping
- Signal-level protocol compliance verification

## Author

[github.com/Isshu-s](https://github.com/Isshu-s)
