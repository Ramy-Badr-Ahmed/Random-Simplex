% Sampling from a Multivariate Normal Distribution Using Simplex Sampling

mu = [1; 2; 3];               % Mean vector
Sigma = [1, 0.5, 0.3;         % Covariance matrix
         0.5, 2, -0.1;
         0.3, -0.1, 0.5];


n = length(mu);     % Number of dimensions (variables)

m = 1000;           % Number of samples to generate

y = randomSimplexMatrix(n, m);      % Generate random samples on (n-1)-dimensional simplex

samples = mvnrnd(mu', Sigma, m);    % Transform samples to follow the multivariate normal distribution

%--------------------------------------------------------------------------------------------------------------------

% Scatter plot of generated samples

figure;
scatter3(samples(:,1), samples(:,2), samples(:,3), 10, y(:,1), 'filled')         % Color by the first dimension of y
title('Samples from Multivariate Normal Distribution');
xlabel('X1');
ylabel('X2');
zlabel('X3');
colormap('parula'); 
colorbar; 
axis equal;
grid on;

%--------------------------------------------------------------------------------------------------------------------

% Pairwise Scatter Plots

figure;
subplot(1,2,1);
scatter(samples(:,1), samples(:,2), 10, 'filled');
title('X1 vs X2');
xlabel('X1');
ylabel('X2');
axis square;
grid on;

subplot(1,2,2);
scatter(samples(:,1), samples(:,3), 10, 'filled');
title('X1 vs X3');
xlabel('X1');
ylabel('X3');
axis square;
grid on;

%--------------------------------------------------------------------------------------------------------------------

%Histograms of Sampled Variables

figure;
for i = 1:n
    subplot(1, n, i);
    histogram(samples(:, i), 'Normalization', 'probability');
    title(['Histogram of X', num2str(i)]);
    xlabel(['X', num2str(i)]);
    ylabel('Probability');
    grid on;
end

%--------------------------------------------------------------------------------------------------------------------


% Display generated samples

disp('Generated samples from multivariate normal distribution:');
disp(samples);
