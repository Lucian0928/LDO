# LDO with I/O Pad Design (UMC 0.18 µm CMOS)

## Design Objective

This project presents the design, simulation, and layout verification of a **low-dropout regulator (LDO) with integrated I/O pads**, targeting **low-noise analog supply generation** for mixed-signal systems.

The design integrates a **bandgap reference** and a **high-gain error amplifier**, and focuses on **system-level stability, transient performance, and layout robustness under heavy load conditions**.

### Design Targets

- Stable regulated output voltage under wide load range  
- Fast transient recovery with minimal overshoot and undershoot  
- Robust stability across light and heavy load conditions  
- Proper operation with realistic **I/O pad parasitics**  
- DRC/LVS-clean layout with current density and thermal considerations  

---

## System Architecture Overview

![LDO System Architecture](figures/architecture.png)

The LDO system consists of:

- **Bandgap Reference (BGR)**  
  Provides a temperature-stable reference voltage (~1.2 V)

- **Error Amplifier (EA)**  
  High-gain amplifier regulating the pass device gate voltage

- **PMOS Pass Device**  
  Large-width power transistor supplying up to **200 mA load current**

- **Feedback Network (RF1, RF2)**  
  Sets the regulated output voltage

- **Off-Chip Load Network**  
  Includes load capacitor (CL) and ESR to emulate real system conditions

- **I/O Pads**  
  VIN, VOUT, VREF, control, and ground pads with realistic parasitics

---

## Supply & Operating Conditions

| Parameter | Value |
|---------|------|
| Process | UMC 0.18 µm CMOS |
| VIN (VDD) | 1.8 – 2.0 V |
| VOUT (Target) | 1.5 V |
| Load Current Range | 1 mA – 200 mA |
| Load Capacitor (CL) | 4.7 µF (off-chip) |
| ESR | 0 – 5 Ω |
| Temperature | 60 °C |
| Corner | TT (simulation requirement) |

---

## Design Methodology

### 1. Pass Device Sizing

- Initial sizing was estimated assuming:
  - \( V_{OUT} = 1.5 \, \text{V} \)
  - \( V_{GP} \approx 0.9 \, \text{V} \)
- Required PMOS width was first estimated to meet **200 mA load current**
- To reduce excessive parasitic capacitance:
  - Error amplifier RC compensation was removed
  - PMOS size was subsequently reduced while maintaining stability
- Final tuning balanced:
  - Load capability
  - Phase margin
  - Transient response

---

### 2. Stability Considerations

- Loop stability was evaluated using **STB analysis** with `iprobe`
- Phase margin was checked under:
  - Light load (1 mA)
  - Heavy load (200 mA)
- ESR zero from off-chip capacitor was leveraged to improve phase margin
- Trade-off between bandwidth and transient overshoot was carefully managed

---

### 3. Transient Response Optimization

- Load transient simulated with:
  - 1 mA → 200 mA → 1 mA step
  - Transition time within 1 µs
- Key metrics:
  - Overshoot voltage
  - Undershoot voltage
  - Recovery time (±0.02% of VOUT)

---

## Performance Summary

### DC & Regulation Performance

| Metric | Specification | Result |
|------|--------------|--------|
| Output Voltage @ 100 mA | 1.495 – 1.505 V | Pass |
| Line Regulation | < 40 mV/V | Pass |
| Load Regulation | < 100 mV/A | Pass |
| Quiescent Current (IQ) | Optimized | Pass |

---

### Transient Performance

| Metric | Specification | Result |
|------|--------------|--------|
| Overshoot Voltage | < 25 mV | Pass |
| Undershoot Voltage | < 25 mV | Pass |
| Recovery Time (H→L) | < 20 µs | Pass |
| Recovery Time (L→H) | < 20 µs | Pass |

---

### AC Stability

| Load Condition | DC Gain | Phase Margin |
|--------------|--------|-------------|
| Light Load (1 mA) | Verified | > 40° |
| Heavy Load (200 mA) | Verified | > 40° |

---

### Efficiency & Area

| Metric | Value |
|------|------|
| Power Efficiency |
