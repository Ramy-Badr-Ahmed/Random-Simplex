% Generate and plot random samples from a 3-dimensional simplex

n = 4;      % Number of dimensions (in 3D space)
m = 1000;   % Number of samples

y = randomSimplexMatrix(n, m);  % Generate random samples on (n-1)-dimensional simplex


%--------------------------------------------------------------------------------------------------------------------

% 3D Scatter Plot

figure;
scatter3(y(:,1), y(:,2), y(:,3), 10, 'filled');
title('Random Samples from a 3-Dimensional Simplex');
xlabel('t1');
ylabel('t2');
zlabel('t3');
grid on;
axis equal;

%--------------------------------------------------------------------------------------------------------------------

% Pairwise Scatter Plots

figure;
subplot(1,2,1);
scatter(y(:,1), y(:,2), 10, 'filled');
title('t1 vs t2');
xlabel('t1');
ylabel('t2');
axis square;
grid on;

subplot(1,2,2);
scatter(y(:,1), y(:,3), 10, 'filled');
title('t1 vs t3');
xlabel('t1');
ylabel('t3');
axis square;
grid on;

%--------------------------------------------------------------------------------------------------------------------

% Histograms of Simplex Coordinates

figure;
histogram(y(:,1), 'Normalization', 'probability', 'FaceColor', 'b', 'EdgeColor', 'none');
hold on;
histogram(y(:,2), 'Normalization', 'probability', 'FaceColor', 'g', 'EdgeColor', 'none');
histogram(y(:,3), 'Normalization', 'probability', 'FaceColor', 'r', 'EdgeColor', 'none');
title('Histograms of Simplex Coordinates');
xlabel('Coordinate Value');
ylabel('Probability');
legend('t1', 't2', 't3');
grid on;

%--------------------------------------------------------------------------------------------------------------------

% 2D Projection of Simplex Samples

figure;
tri = delaunay(y(:,1), y(:,2));
trisurf(tri, y(:,1), y(:,2), y(:,3), 'FaceColor', 'none', 'EdgeColor', 'k', 'FaceAlpha', 0.1);
title('2D Projection of Simplex Samples');
xlabel('t1');
ylabel('t2');
zlabel('t3');
axis equal;
grid on;

%--------------------------------------------------------------------------------------------------------------------

% Color Mapping on 3D Scatter Plot

figure;
scatter3(y(:,1), y(:,2), y(:,3), 20, y(:,1), 'filled');         % Color by the first dimension of y
title('3D Scatter Plot of Simplex Samples with Color Mapping');
xlabel('t1');
ylabel('t2');
zlabel('t3');
colormap('parula'); 
colorbar; 
axis equal;
grid on;

%--------------------------------------------------------------------------------------------------------------------

% Histograms of Each Dimension

figure;
for i = 1:size(y, 2)
    subplot(1, size(y, 2), i);
    histogram(y(:, i), 'Normalization', 'probability');
    title(['Histogram of Dimension ', num2str(i)]);
    xlabel(['t', num2str(i)]);
    ylabel('Probability');
    grid on;
end

%--------------------------------------------------------------------------------------------------------------------

% Display generated simplex

disp('Generated simplex matrix:');
disp(y);




