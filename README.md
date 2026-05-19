# Mathematical Models of Athletic Training and Performance


---

# Repository Structure

```text
.
├── IR_Model/
│   ├── main.m
│   ├── generate_workload.m
│   ├── fitness_fatigue_model.m
│   ├── decay_analysis.m
│   ├── plot_decay_analysis.m
│   └── plot_fitness_fatigue.m
│
├── PerPot_Model/
│   ├── main.m
│   └── perpot_model.m
│
└── README.md
```

---

# 1. IR Fitness-Fatigue Model

## Description

The Impulse-Response (IR) model, represents athletic performance as the balance between:

- Positive training adaptations (fitness)
- Negative training adaptations (fatigue)

The model assumes that each training session produces both:

- long-term positive adaptations
- short-term fatigue accumulation

Performance is modeled as:

```math
p(t) = p_0 + g(t) - h(t)
```

where:

- `g(t)` = fitness response
- `h(t)` = fatigue response
- `p_0` = baseline performance

---

## Features

- Rectangular training load profiles
- Triangular training load profiles
- Influence curve analysis
- Characteristic time computation:
  - `t_g` : maximum positive training influence
  - `t_n` : fatigue-to-fitness transition

---

## Generated Outputs

The model generates:

- Fitness evolution
- Fatigue evolution
- Performance evolution
- Training load visualization
- Influence curve analysis

---

# 2. PerPot Model

## Description

The PerPot (Performance Potential) model is a nonlinear antagonistic model describing athletic adaptation through the interaction between:

- Stress Potential (SP)
- Recovery Potential (RP)
- Performance Potential (PP)

Unlike the classical IR model, PerPot uses nonlinear `min()` and `max()` operators to represent:

- physiological saturation
- recovery limitations
- overtraining effects

The model computes:

- Stress Rate (SR)
- Recovery Rate (RR)
- Overtraining Rate (OR)

to update the athlete state variables.

---

## Features

- Nonlinear antagonistic dynamics
- Physiological saturation modeling
- Overtraining representation

---

# References

## IR Fitness-Fatigue Model

- David C. Clarke and Philip F. Skiba
  *Rationale and resources for teaching the mathematical modeling of athletic
training and performance*,
  Adv Physiol Educ, 2013.

---

## PerPot Model

- David Schaefer, Alexander Asteroth, Melanie Ludwig
  *Training Plan Evolution based on Training Models*,
  2015.
---

# Requirements

- MATLAB
- No external toolboxes required

The code was tested on standard MATLAB installations.

# Scientific Notes

These implementations are intended for:

- educational purposes
- research applications
- experimentation with training models

The parameter values included are illustrative only.

Real-world applications require:

- athlete-specific calibration
- experimental validation
- longitudinal performance measurements

# License

This repository is intended for educational and research purposes.

---

# Author

Mohammed Abbasher
