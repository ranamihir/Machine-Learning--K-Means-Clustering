%% =================== K-Means Clustering ====================== 
fprintf('\nRunning K-Means clustering on example dataset.\n\n');

% Load an example dataset
X = Y;

% Settings for running K-Means
K = 4;
max_iters = 10;

initial_centroids = [randi([-20, 20]) randi([0, 20]); randi([-20, 20]) randi([0, 20]); randi([-20, 20]) randi([0, 20]); 188 0];

% Run K-Means algorithm. The 'true' at the end tells our function to plot
% the progress of K-Means
[centroids, idx, cat1, cat2, cat3, cat4, data1, data2, data3, data4] = runkMeans(X, initial_centroids, max_iters, true, textdata);
fprintf('\nK-Means Done.\n\n');
fprintf('Program paused. Press enter to continue.\n');
pause;