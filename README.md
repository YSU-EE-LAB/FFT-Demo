# FFT-Demo
MATLAB source code for the Fourier Transform and Signal Processing educational experiment.

# Optimization of Experimental Teaching Design for Fourier Transform and Signal Processing in MATLAB
# MATLAB中傅里叶变换以及信号处理实验教学设计优化

This repository contains the official MATLAB source code for the paper *"Optimization of Experimental Teaching Design for Fourier Transform and Signal Processing in MATLAB"*. 
This project demonstrates the teaching process step-by-step using MATLAB experiments, highlighting the European Union (EU) engineering experimental education system. It emphasizes a problem/project-centered approach, focusing on practice and innovation, guided by the **PBL (Problem-Based Learning)** philosophy.

本仓库包含论文《MATLAB中傅里叶变换以及信号处理实验教学设计优化》的官方 MATLAB 源代码。
本项目以 MATLAB 实验为例，一步步展示教学过程，突出欧盟工程实验教育系统强调以问题/项目为中心，强调实践和创新的 **PBL（Problem-Based Learning，项目式学习）** 导向教育方式。

---

## 🎯 Learning Objectives / 教学目标

After completing this study, students should be able to:
完成此次学习后，学生应能够：

1. **Understand FT, DFT, and FFT:** Comprehend the Fourier Transform, Discrete Fourier Transform (DFT), and Fast Fourier Transform (FFT). Utilize the built-in MATLAB function `fft()` to calculate signal spectrum, amplitude, and harmonic components.
   **理解核心概念**：理解傅立叶变换、离散傅立叶变换（DFT）以及快速傅立叶变换。利用 MATLAB 内置函数 `fft()` 计算信号的频谱、幅值以及谐波部分。
2. **Data Preparation:** Correctly prepare time-domain sampled data (samples), including detrending, windowing, calibration, and zero-padding operations.
   **数据预处理**：正确准备时域采样数据（样本）、去趋势、加窗、校准以及补零操作。
3. **Manual DFT Implementation:** Manually implement the Discrete Fourier Transform (DFT) and understand its brute-force algorithmic approach.
   **手动实现 DFT**：手动实现离散傅立叶变换（DFT），理解其暴力算法原理。
4. **Manual FFT Implementation:** Manually implement the Fast Fourier Transform (FFT), mastering its core components: 
   **手动实现 FFT**：手动实现快速傅立叶变换（FFT），包括：
   * ① Bit-reversal (位反转)
   * ② Butterfly computation (蝶形运算)
   * ③ Application of twiddle factors (旋转因子的应用)
   * ④ In-place computation (原地计算)
5. **Signal Verification:** Verify results using preset signals of increasing complexity and correctly extract harmonic amplitudes.
   **信号验证**：实用复杂度递增的预设信号验证结果，并正确提取谐波幅值。
6. **Spectrum Interpretation:** Accurately interpret frequency-domain plots.
   **图表解读**：准确解读频域图。
7. **Practical Application:** Understand the purpose and role of FFT signal analysis in real-world engineering applications.
   **实际应用**：理解 FFT 信号分析及其实际应用中的目的与作用。
8. **Performance Comparison:** Compare the computational performance between the manually implemented DFT and MATLAB's built-in FFT.
   **性能对比**：对比自主实现的 DFT 与 MATLAB 内置 FFT 的计算性能。

---

##  Interactive Execution via MATLAB Online / 网页版一键运行

To facilitate reproduction and interactive learning without local installation, this project supports direct execution via MATLAB Online. Click the badge below to import and run the repository directly in your browser:

为了方便代码复现与交互式学习，且免除本地安装环境的繁琐步骤，本项目支持直接通过 MATLAB 网页版运行。请点击下方官方徽章，直接在浏览器中导入并运行本仓库：

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=YSU-EE-LAB/FFT-Demo)

---

##  Repository Structure / 仓库文件结构

* `ftt_test.m`: **Main Script / 主程序**. Demonstrates the complete workflow of signal generation, Hanning window application, zero-padding, and physical amplitude restoration. (演示加窗、补零以及真实物理幅值还原的完整流程)
* `demo_windowing_fft.m`: **Basic Demo / 基础演示程序**. Focuses on windowing operations and energy attenuation compensation. (重点展示加窗操作与能量衰减补偿)
* `test.m`: **Performance Test / 性能测试脚本**. Compares the execution speed of the built-in FFT with the manually implemented DFT. (测试环境、配置)
* `myFFT.m`: **Core Algorithm / 核心算法实现**. Manually implemented Radix-2 Decimation-In-Time Fast Fourier Transform (Radix-2 DIT FFT). (手动实现的基-2 FFT 底层函数)
* `myDFT.m`: **Core Algorithm / 核心算法实现**. Manually implemented Discrete Fourier Transform (DFT). (手动实现的 DFT 底层函数)

---

##  Environment Dependencies / 环境配置与依赖

This code has been developed and tested in MATLAB. To ensure proper execution, please verify the following dependencies:
本代码在 MATLAB 环境下开发与测试。为确保顺利运行，请在您的本地环境中安装以下组件：
* **MATLAB**: Release R2022a or later is recommended. / 推荐 R2022a 或更高版本。
* **Signal Processing Toolbox**: Required for fundamental signal generation and windowing functions (e.g., `hann`, `chirp`). / 信号处理工具箱。

---

##  Citation / 引用声明

If you find this code or our paper useful for your research or teaching, please consider citing our work:
如果您在研究或教学中使用了本代码或参考了我们的论文，请引用我们的工作：

```bibtex
@article{ma_xu_202X_fft,
  title={Optimization of Experimental Teaching Design for Fourier Transform and Signal Processing in MATLAB},
  author={Huibin Ma and Zhilin Xu and [Corresponding Author TBD]},
  journal={[Journal Name TBD]},
  volume={[TBD]},
  number={[TBD]},
  pages={[TBD]},
  year={[Year TBD]},
  publisher={[Publisher TBD]}
}
```

##  Conect with us / 与我们联系
Huibin Ma 481915882@qq.com
Zhilin Xu 280854151@qq.com
