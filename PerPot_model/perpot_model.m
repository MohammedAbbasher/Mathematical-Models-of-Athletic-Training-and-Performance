function [SP, RP, PP, SR, RR, OR] = ...
    perpot_model( ...
    SP_0, RP_0, PP_0, ...
    LR, DS, DR, DSO)

% =========================================================
% PERPOT_MODEL
% =========================================================
%
% Description:
% ------------
% This function computes one update step of the PerPot
% (Performance Potential) model.
%
% The model describes the antagonistic interaction between:
%
%   - stress accumulation
%   - recovery processes
%   - overtraining effects
%
% leading to a resulting performance potential.
%
% =========================================================
% PHYSIOLOGICAL INTERPRETATION
% =========================================================
%
% Stress Potential (SP):
% ----------------------
% Represents accumulated physiological stress induced by
% training load.
%
% Recovery Potential (RP):
% ------------------------
% Represents the athlete's recovery capability.
%
% Performance Potential (PP):
% ---------------------------
% Represents the current performance state resulting from
% the balance between adaptation and fatigue.
%
% =========================================================
% MODEL EQUATIONS
% =========================================================
%
% Stress Rate:
%
%   SR = min(min(1,SP), max(0,PP)) / DS
%
% Recovery Rate:
%
%   RR = min(min(1,RP), max(0,1-PP)) / DR
%
% Overtraining Rate:
%
%   OR = max(0,SP-1) / DSO
%
% =========================================================
% INPUTS
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
%       Stress dissipation constant
%
% DR :
%       Recovery dissipation constant
%
% DSO :
%       Overtraining dissipation constant
%
% =========================================================
% OUTPUTS
% =========================================================
%
% SP :
%       Updated stress potential
%
% RP :
%       Updated recovery potential
%
% PP :
%       Updated performance potential
%
% SR :
%       Stress rate
%
% RR :
%       Recovery rate
%
% OR :
%       Overtraining rate
%
% =========================================================

% =========================================================
% STRESS ACCUMULATION
% =========================================================

SP = SP_0 + LR;

% =========================================================
% RECOVERY ACCUMULATION
% =========================================================

RP = RP_0 + LR;

% =========================================================
% STRESS RATE
% =========================================================
%
% Physiological stress is limited by:
%
%   - current stress level
%   - current performance capacity
%
% =========================================================

SR = min( ...
     min(1, SP), ...
     max(0, PP_0)) / DS;

% =========================================================
% RECOVERY RATE
% =========================================================
%
% Recovery depends on:
%
%   - recovery potential
%   - remaining adaptation reserve
%
% =========================================================

RR = min( ...
     min(1, RP), ...
     max(0, 1 - PP_0)) / DR;

% =========================================================
% OVERTRAINING RATE
% =========================================================
%
% Overtraining occurs when:
%
%   SP > 1
%
% =========================================================

OR = max(0, SP - 1) / DSO;

% =========================================================
% UPDATE STATE VARIABLES
% =========================================================

SP = SP - SR - OR;

RP = RP - RR;

PP = PP_0 + RR - SR - OR;

end
