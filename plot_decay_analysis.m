function plot_decay_analysis( ...
    t_decay, L, t_g, t_n)

% =========================================================
% PLOT_DECAY_ANALYSIS
% =========================================================
%
% Description:
% ------------
% This function plots the influence curve associated with
% the Banister Impulse-Response (IR) model.
%
% The influence curve represents the net effect of a single
% training impulse on future performance.
%
% The curve is defined as:
%
%   L(t) = g(t) - h(t)
%
% where:
%
%   g(t) : positive training effect  (fitness)
%   h(t) : negative training effect  (fatigue)
%
% Interpretation:
% ----------------
%
%   L(t) > 0 :
%       Fitness dominates fatigue
%
%   L(t) < 0 :
%       Fatigue dominates fitness
%
% Characteristic Times:
% ----------------------
%
%   t_g :
%       Time corresponding to the maximum positive influence
%       of training on performance.
%
%   t_n :
%       Time separating net negative and net positive
%       training effects.
%
% According to the IR model:
%
%   - Training too close to competition increases fatigue
%   - Training around t_g maximizes adaptation
%   - Tapering should begin before t_n
%
% Inputs:
% -------
%
%   t_decay    : Time vector
%
%   L          : Influence curve values
%
%   t_g        : Maximum positive influence time
%
%   t_n        : Net fatigue-to-fitness transition time
%
% =========================================================

figure;

% ---------------------------------------------------------
% Influence curve
% ---------------------------------------------------------

plot(-t_decay, L, ...
    'b', 'LineWidth',1.5);

hold on;

% ---------------------------------------------------------
% Characteristic time markers
% ---------------------------------------------------------

line([-t_g -t_g], ylim, ...
    'Color','r', ...
    'LineStyle','--');

line([-t_n -t_n], ylim, ...
    'Color','k', ...
    'LineStyle','--');

% ---------------------------------------------------------
% Labels
% ---------------------------------------------------------

text(-t_g, 0, ' t_g', ...
    'Color','r');

text(-t_n, 0, ' t_n', ...
    'Color','k');

% ---------------------------------------------------------
% Plot formatting
% ---------------------------------------------------------

grid on;

xlabel('Time (days)');

ylabel('L(t) = g(t) - h(t)');

title('Influence Curve Analysis');

legend('Influence Curve', ...
       't_g', ...
       't_n');

end