% Vsualize the Voronoi diagram of random points generated on a 2-dimensional simplex.

n = 3;      % Number of dimensions (simplex is 2-dimensional, in 2D space)
m = 150;    % Number of samples

y = randomSimplexMatrix(n, m);  % Generate random samples on (n-1)-dimensional simplex

% Voronoi diagram based on the generated points
voronoi(y(:,1), y(:,2));
title('Voronoi Diagram of Random Points on a 2-Dimensional Simplex');
xlabel('t1');
ylabel('t2');
axis equal;
grid on;

% Display the generated points
disp('Generated points on the 2-dimensional simplex:');
disp(y);
