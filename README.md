# Voice Denoising using IIR/FIR Filtering in MATLAB

This repository contains a digital signal processing (DSP) solution designed to suppress background noise from voice recordings using Infinite Impulse Response (IIR) filtering techniques.

## 🚀 Overview
Background noise often degrades the quality of voice communication. This project demonstrates a pipeline to analyze the spectral characteristics of a noisy signal and design a custom Butterworth High-pass filter to isolate and enhance the human voice.

## 🛠 Key Features
- **Signal Analysis:** Time-domain and Frequency-domain (FFT) analysis to identify noise profiles.
- **Filter Design:** Implementation of a 10th-order IIR Butterworth High-pass filter.
- **Zero-Phase Filtering:** Utilized `filtfilt` to ensure zero phase shift, preserving signal timing.
- **Quantitative Evaluation:** Automated SNR (Signal-to-Noise Ratio) calculation before and after processing.

## 📁 Repository Contents
- `/src`: Contains the MATLAB script `filtering_code.m`.
- `/data`: Includes the `voice_noisy.wav` and the enhanced `voice_filtered.wav`.
