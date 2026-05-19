clc;
clear;
close all;

% =========================================================
% PERPOT MODEL
% =========================================================
%
% Description:
% ------------
% This code implements the PerPot (Performance Potential)
% model proposed by Jürgen Perl.
%
% The model describes athletic adaptation through the
% interaction between:
%
%   - Stress Potential (SP)
%   - Recovery Potential (RP)
%   - Performance Potential (PP)
%
% Unlike the classical Banister Fitness-Fatigue model,
% PerPot uses nonlinear min/max operators to represent
% physiological saturation and overtraining effects.
%
% Reference:
% ----------
% Perl, J.:
% "PerPot: A Metamodel for Simulation of Load Performance
% Interaction"
%
% =========================================================
% IMPORTANT NOTE
% =========================================================
%
% The parameter values used in this implementation are
% illustrative only.
%
% Real applications require:
%
%   - athlete-specific calibration
%   - experimental measurements
%   - longitudinal performance data
%
% =========================================================

% =========================================================
% USER GUIDE
% =========================================================
%
% SP_0 :
%       Initial stress potential
%
% RP_0 :
%       Initial recovery potential
%
% PP_0 :
%       Initial performance potential
%
% LR :
%       Training load rate
%
% DS :
%       Stress dissipation parameter
%
% DR :
%       Recovery dissipation parameter
%
% DSO :
%       Overtraining dissipation parameter
%
% =========================================================
% USER INPUTS
% =========================================================

SP_0 = 10;

RP_0 = 20;

PP_0 = 50;

LR = 100;

DS = 6.8;

DR = 6.3;

% Optional:
% OR = 0;
%
% Used when DSO calibration data is unavailable,
% as discussed in the reference paper.

DSO = 5;

% =========================================================
% MODEL EXECUTION
% =========================================================

[SP, RP, PP, SR, RR, OR] = ...
    perpot_model( ...
    SP_0, RP_0, PP_0, ...
    LR, DS, DR, DSO);

% =========================================================
% DISPLAY RESULTS
% =========================================================

fprintf('\n====================================\n');

fprintf('Stress Potential      : %.4f\n', SP);

fprintf('Recovery Potential    : %.4f\n', RP);

fprintf('Performance Potential : %.4f\n', PP);

fprintf('Stress Rate           : %.4f\n', SR);

fprintf('Recovery Rate         : %.4f\n', RR);

fprintf('Overtraining Rate     : %.4f\n', OR);

fprintf('====================================\n');
