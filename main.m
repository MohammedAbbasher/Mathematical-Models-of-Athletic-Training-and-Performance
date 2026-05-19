clc;
clear;
close all;

% =========================================================
% IMPORTANT NOTE
%
% This implementation is intended for educational and
% research purposes.
%
% The parameter values used here are illustrative and do not
% represent athlete-specific calibrated values.
%
% Accurate prediction requires:
%
%   - Experimental calibration
%   - Athlete-specific data
%   - Training load quantification
%
% =========================================================

% =========================================================
% FITNESS-FATIGUE (IMPULSE-RESPONSE) MODEL
% =========================================================
%
% Description:
% ------------
% This code implements the Banister Impulse-Response (IR)
% model for training adaptation and performance prediction.
%
% The model assumes that training produces:
%
%   1. Positive training effects  (fitness)
%   2. Negative training effects  (fatigue)
%
% Performance is modeled as:
%
%   Performance = Base Performance
%               + Fitness Effect
%               - Fatigue Effect
%
% The code supports:
%
%   - Rectangular training load profiles
%   - Triangular training load profiles
%   - Influence curve analysis
%   - Characteristic times:
%         tg : maximum positive influence time
%         tn : fatigue-dominant region limit
%
% Reference:
% -----------
% Banister IR Model described in:
%
% "Mathematical Modeling of Training and Performance"
% Skiba et al.
%
% Main concepts:
%   - Positive Training Effect (PTE)
%   - Negative Training Effect (NTE)
%   - Supercompensation
%   - Tapering
%   - Overreaching
%
% =========================================================
% Author: Mohammed Abbasher
% Date  : 2019
% =========================================================

% =========================================================
% USER GUIDE
% =========================================================
%
% workload_type:
%
%   1 -> Rectangular workload
%   2 -> Triangular workload
%
% Main parameters:
%
%   s                  : total simulation days
%
%   tau_1              : fitness decay time constant
%   tau_2              : fatigue decay time constant
%
%   k_1                : fitness gain factor
%   k_2                : fatigue gain factor
%
%   base_performance   : initial athlete performance
%
% Interpretation:
%
%   Large tau_1:
%       Long-lasting fitness adaptations
%
%   Small tau_2:
%       Fast fatigue dissipation
%
%   Large k_2:
%       Strong fatigue response
%
% =========================================================

workload_type = 1;

s = 250;

tau_1 = 25;
tau_2 = 10;

k_1 = 1;
k_2 = 2;

base_performance = 500;

m = 165;

tau1_decay = 36;
tau2_decay = 21;

k1_decay = 0.18;
k2_decay = 0.23;

% =========================================================
% MAIN PROGRAM
% =========================================================

t = 1:s;

[T, figure_title] = generate_workload(workload_type, s);

[g_t, h_t, p_t] = fitness_fatigue_model( ...
    T, t, tau_1, tau_2, ...
    k_1, k_2, base_performance);

[t_decay, L, t_g, t_n] = decay_analysis( ...
    m, tau1_decay, tau2_decay, ...
    k1_decay, k2_decay);

plot_decay_analysis(t_decay, L, t_g, t_n);

plot_fitness_fatigue( ...
    t, T, g_t, h_t, p_t, figure_title);