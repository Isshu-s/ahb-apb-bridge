Yep, that works fine. Click **Add a README**, then paste this in:

```markdown
# AMBA AHB-to-APB Bridge Design and Verification using Verilog & Vivado

Designed and verified a synthesizable AMBA AHB-to-APB bridge using Verilog HDL in AMD Vivado. The bridge converts AHB read/write transactions into APB transactions using an AHB Slave Interface, APB FSM Controller, and APB Interface. Developed a Verilog testbench to generate single read/write transactions, verified the AHB-to-APB data/address/control signal conversion through behavioral simulation and waveforms, and successfully completed RTL synthesis in Vivado.

## Features

- **AHB Slave Interface** — receives AHB-Lite master transactions (address, control, write data)
- **APB FSM Controller** — sequences IDLE → SETUP → ACCESS states per the AMBA APB protocol
- **APB Interface** — drives PSEL, PENABLE, PWRITE, PADDR, PWDATA and samples PRDATA/PREADY
- Supports single AHB read and write transactions, converted to corresponding APB transactions
- Verilog testbench generating directed read/write stimulus
- Verified via behavioral simulation with waveform inspection
- RTL synthesized successfully in Vivado

## Tools & Technologies

- **HDL:** Verilog
- **Simulation & Synthesis:** AMD Vivado

## Repository Structure

```
.
├── AHB2APB.xpr
├── AHB_Master.v
├── AHB_Slave_Interface.v
├── APB_Controller.v
├── APB_Interface.v
├── bridge_top.v
└── README.md
```

## Getting Started

1. Clone the repository
   ```bash
   git clone https://github.com/Isshu-s/ahb-apb-bridge.git
   ```
2. Open `AHB2APB.xpr` in Vivado
3. Run behavioral simulation to view AHB-to-APB signal conversion on waveforms
4. Run synthesis to generate the synthesized netlist

## Status

RTL design complete, testbench verified via simulation, and synthesis completed in Vivado.
```
