function [T, figure_title] = generate_workload(workload_type, s)

T = zeros(1,s);

switch workload_type

    case 1

        T(1:s/2) = 100;
        T(s/2+1:s) = 50;

        figure_title = 'Rectangular Workload';

    case 2

        T(1:s/2) = linspace(0,100,s/2);

        T(s/2+1:s) = linspace(100,0,s/2);

        figure_title = 'Triangular Workload';

    otherwise

        error('Invalid workload type.');

end

end