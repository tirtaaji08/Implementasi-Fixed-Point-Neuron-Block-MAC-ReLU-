##  Deskripsi Singkat

Proyek ini mengimplementasikan unit dasar pemrosesan saraf (Neuron Block) menggunakan bahasa deskripsi perangkat keras Verilog. Modul ini dirancang untuk efisiensi tinggi pada FPGA dengan menggunakan aritmatika Fixed-Point dan fungsi aktivasi ReLU, yang merupakan fondasi utama dalam perancangan chip akselerator kecerdasan buatan (AI Hardware).

---
## Fitur Utama
```
Q8.8 Fixed-Point Multiplication: Menggunakan format 16-bit (8-bit integer, 8-bit fractional) untuk meminimalkan penggunaan resource FPGA dibandingkan floating-point.

Accumulator Unit: Menjumlahkan hasil perkalian secara berurutan untuk simulasi operasi dot-product.

ReLU Activation Function: Implementasi fungsi aktivasi non-linear tingkat hardware untuk memotong nilai negatif menjadi nol.

Modular Design: Terdiri dari modul perkalian terpisah yang diinstansiasi ke dalam blok neuron utama.
```

## Arsitektur Blok

1. Multiplication  : Input x Weight
2. Accumulation    : Σ (Input x Weight)
3. Activation      : max (0, sum)

---

## Spesifikasi Teknis

Bahasa: Verilog HDL

Tools: AMD Xilinx Vivado ML Edition

Format Data: Signed Fixed-Point Q8.8

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
