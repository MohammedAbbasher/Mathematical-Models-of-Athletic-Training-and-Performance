% =========================================================
% INFLUENCE CURVE ANALYSIS
%
% The influence curve estimates how a single training
% impulse affects future performance.
%
% Characteristic times:
%
%   tg :
%       Day of maximum positive training influence
%
%   tn :
%       Limit between net fatigue and net fitness
%
% Interpretation:
%
%   t < tn:
%       Fatigue dominates
%
%   t > tn:
%       Fitness dominates
%
% =========================================================

function [t_decay, L, t_g, t_n] = ...
    decay_analysis( ...
    m, tau1_decay, tau2_decay, ...
    k1_decay, k2_decay)

t_decay = 1:m;

t_p = 0;

g = k1_decay .* ...
    exp(-(t_decay - t_p)/tau1_decay);

h = k2_decay .* ...
    exp(-(t_decay - t_p)/tau2_decay);

L = g - h;

t_g = tau1_decay * tau2_decay * ...
    log((k2_decay * tau1_decay) / ...
    (k1_decay * tau2_decay)) / ...
    (tau1_decay - tau2_decay);

t_n = tau1_decay * tau2_decay * ...
    log(k2_decay / k1_decay) / ...
    (tau1_decay - tau2_decay);

end
