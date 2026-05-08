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


### Gx Kernel
```
-1  0  1
-2  0  2
-1  0  1
```

### Gy Kernel
```
 1  2  1
 0  0  0
-1 -2 -1
```

Instead of computing:

sqrt(Gx² + Gy²)

The hardware implementation uses:

|Gx| + |Gy|

This avoids square-root hardware and reduces complexity.

---

##  Architecture

The design uses:

- 3 Line Buffers
- 3×3 Sliding Window Generator
- Signed Gradient Computation
- Clipping Logic (0–255)
- Streaming Pipeline Structure

### Data Flow

1. Pixel input (1 pixel per clock)
2. Line buffer storage
3. 3×3 window formation
4. Gx and Gy computation
5. Magnitude calculation
6. Output pixel generation

Border pixels are set to zero.

---

##  File Structure

```
sobel_stream.v         -> Sobel streaming core
tb_sobel_stream.v      -> Simulation testbench
test_gray_256.hex      -> Input grayscale image
out_sobel.hex          -> Output edge-detected image
hex_to_image.py        -> Converts HEX to PNG image
```

---

##  Simulation (Vivado)

1. Add sobel_stream.v as Design Source
2. Add tb_sobel_stream.v as Simulation Source
3. Add test_gray_256.hex to sim_1
4. Run Behavioral Simulation
5. Generated output file: out_sobel.hex
6. Convert HEX to image using:

```
python3 hex_to_image.py out_sobel.hex --width 256 --height 256 --out edge.png
```

---

##  Hardware Readiness

✔ Fully synthesizable  
✔ FPGA-friendly (BRAM-based line buffers)  
✔ Streaming architecture  
✔ Real-time capable  

Future extensions:
- VGA display output
- Camera sensor integration
- Real-time edge visualization

---

##  Tools Used

- Verilog HDL
- Xilinx Vivado
- Python (for image reconstruction)
- FPGA-based digital design flow

---

##  Applications

- Embedded vision systems
- Robotics
- Object detection preprocessing
- Industrial inspection
- Real-time image enhancement

---

##  Author

Final-year Electrical & Electronic Engineering Undergraduate  
Interested in FPGA Design, Digital Systems, and Hardware Acceleration
