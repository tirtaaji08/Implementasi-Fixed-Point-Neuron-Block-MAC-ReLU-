# Implementasi-Fixed-Point-Neuron-Block-MAC-ReLU-
Dalam chip AI, efisiensi energi didapat dari penggunaan Fixed-Point daripada Floating Point dan operasi paling dasar di dalamnya adalah Multiply-Accumulate (MAC) yang diikuti oleh fungsi aktivasi seperti ReLU

##  Project Overview

This project implements a Sobel edge detection algorithm using synthesizable Verilog HDL.  
The design follows a streaming architecture, making it suitable for FPGA-based real-time image processing.

The system:
- Accepts grayscale image data in raster scan format
- Applies 3×3 Sobel convolution
- Computes gradient magnitude using |Gx| + |Gy|
- Outputs an 8-bit edge-detected image

---

##  Output Simulasi di Vivado
### Iterasi 1
data input = 2.0 -> 16'h0200

weight = 1.5 -> 16'h0180

out multiplication = 3.0 -> 16'h0300

Accumulator : 0.0 + 3.0 = 3.0-> 16'h0300

<img width="756" height="275" alt="Image" src="https://github.com/user-attachments/assets/19dab66a-a074-4033-9bac-69beb05e3b7c" />

### Iterasi 2
data input = 1.0 -> 16'h0100

weight = 1.0 -> 16'h0100

out multiplication = 1.0 -> 16'h0100

Accumulator : 3.0 + 1.0 = 4.0-> 16'h0400

<img width="755" height="347" alt="Image" src="https://github.com/user-attachments/assets/bcd62d7a-bc2a-4c14-8826-3da89251117d" />

### Iterasi 3
data input = 2.0 -> 16'h0200

weight = -1.0 -> 16'hFF00

out multiplication = -2.0 -> 16'FE00

Accumulator : 0-> 16'h0000

<img width="753" height="247" alt="Image" src="https://github.com/user-attachments/assets/6f9d5377-ef78-42a1-899f-275f68795810" />

---

##  File Structure

```
Fixed_Point_Multi.v         -> Perkalian fixed point Q8.8
neuron_block.v         -> penjumlahan output perkalian fixed point dan logika ReLu
tb_neuron_block.v      -> Simulation testbench
tb_fixed_point_multi.v      -> Simulation testbench
report_timing.rpt
report_power.rpt
report_area.rpt
report_qor.rpt
```

---

##  Hardware Readiness

✔ Fully synthesizable  
✔ FPGA-friendly (BRAM-based line buffers)  
✔ Streaming architecture  
✔ Real-time capable  

##  Tools Used

- Verilog HDL
- Xilinx Vivado

---

##  Applications

- Embedded vision systems
- Robotics
- Object detection preprocessing
- Industrial inspection
- Real-time image enhancement

---

##  Author

