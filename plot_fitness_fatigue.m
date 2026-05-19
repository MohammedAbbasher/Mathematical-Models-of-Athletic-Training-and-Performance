% =========================================================
% PLOT DESCRIPTION
%
% Top figure:
%   - Fitness response
%   - Fatigue response
%   - Overall performance
%
% Bottom figure:
%   - Daily training load
%
% =========================================================

function plot_fitness_fatigue( ...
    t, T, g_t, h_t, ...
    p_t, figure_title)

figure;

subplot(2,1,1);

plot(t,g_t,'g','LineWidth',1.5);
hold on;

plot(t,h_t,'r','LineWidth',1.5);

plot(t,p_t,'b','LineWidth',1.5);

grid on;

xlabel('Time (days)');

ylabel('Model Output');

title(['IR Model - ', figure_title]);

legend('Fitness', ...
       'Fatigue', ...
       'Performance');

subplot(2,1,2);

bar(t,T);

grid on;

xlabel('Time (days)');

ylabel('Training Load');

title('Training Load');

end