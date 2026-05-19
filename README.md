# Mathematical-Models-of-Athletic-Training-and-Performance

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

# 1. Banister Fitness-Fatigue Model

## Description

The Banister model, also called the Impulse-Response (IR) model, represents athletic performance as the balance between:

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
- Modular MATLAB implementation
- Vectorized computations
- Scientific documentation and comments

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

The PerPot (Performance Potential) model proposed by Jürgen Perl is a nonlinear antagonistic model describing athletic adaptation through the interaction between:

- Stress Potential (SP)
- Recovery Potential (RP)
- Performance Potential (PP)

Unlike the classical Banister model, PerPot uses nonlinear `min()` and `max()` operators to represent:

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
- Modular MATLAB implementation
- Scientific documentation and comments

---

# References

## Banister Fitness-Fatigue Model

- Calvert, T.W., Banister, E.W., Savage, M.V., Bach, T.
  *A Systems Model of the Effects of Training on Physical Performance*,
  IEEE Transactions on Systems, Man, and Cybernetics, 1976.

- Fitz-Clarke, J.R., Morton, R.H., Banister, E.W.
  *Optimizing athletic performance by influence curves*,
  Journal of Applied Physiology, 1991.

- Busso, T., Candau, R., Lacour, J.R.
  *Fatigue and fitness modelled from the effects of training on performance*,
  European Journal of Applied Physiology, 1994.

---

## PerPot Model

- Perl, J.
  *PerPot: A Metamodel for Simulation of Load Performance Interaction*,
  European Journal of Sport Science, 2001.

- Schäfer et al.
  *Automated Generation and Optimization of Training Plans*,
  2015.

---

# Requirements

- MATLAB
- No external toolboxes required

The code was tested on standard MATLAB installations.

---

# Usage

## Banister Model

Run:

```matlab
main
```

inside:

```text
Banister_Model/
```

You can choose the workload type inside `main.m`:

```matlab
workload_type = 1;
```

where:

- `1` → Rectangular workload
- `2` → Triangular workload

---

## PerPot Model

Run:

```matlab
main
```

inside:

```text
PerPot_Model/
```

Modify the physiological parameters directly in the user input section.

---

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

---

# Future Improvements

Possible future extensions include:

- time-dependent PerPot simulations
- athlete parameter calibration
- optimization algorithms
- tapering optimization
- evolutionary training plan generation
- multi-objective optimization
- coupling with real training datasets

---

# License

This repository is intended for educational and research purposes.

---

# Author

Mohammed Abbasher

CFD Engineer | Scientific Computing | Mathematical Modeling
