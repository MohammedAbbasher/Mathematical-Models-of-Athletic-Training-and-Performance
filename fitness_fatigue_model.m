% =========================================================
% FITNESS RESPONSE
%
% The fitness component follows:
%
% g(t) = T(t) * k1 *
%        (1 - exp(-t/tau1)) /
%        (1 - exp(-1/tau1))
%
% where:
%
%   T(t)   : training load
%   k1     : fitness gain
%   tau1   : fitness decay constant
%
% 
%
%
% FATIGUE RESPONSE
%
% The fatigue component follows:
%
% h(t) = T(t) * k2 *
%        (1 - exp(-t/tau2)) /
%        (1 - exp(-1/tau2))
%
% Fatigue dissipates faster than fitness:
%
%   tau2 < tau1
%
% 
% PERFORMANCE MODEL
%
% Performance is computed as:
%
%   p(t) = p0 + fitness - fatigue
%
% The model reproduces:
%
%   - Overreaching
%   - Supercompensation
%   - Tapering effects
%   - Detraining
%
% 
%
% =========================================================

function [g_t, h_t, p_t] = ...
    fitness_fatigue_model( ...
    T, t, tau_1, tau_2, ...
    k_1, k_2, base_performance)

g_t = T .* k_1 .* ...
    (1 - exp(-t/tau_1)) ./ ...
    (1 - exp(-1/tau_1));

h_t = T .* k_2 .* ...
    (1 - exp(-t/tau_2)) ./ ...
    (1 - exp(-1/tau_2));

p_t = base_performance + g_t - h_t;

end