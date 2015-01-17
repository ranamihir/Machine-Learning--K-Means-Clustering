function [centroids, idx, cat1, cat2, cat3, cat4, data1, data2, data3, data4] = runkMeans(X, initial_centroids, ...
                                      max_iters, plot_progress, textdata)
%RUNKMEANS runs the K-Means algorithm on data matrix X, where each row of X
%is a single feature
%

% Set default value for plot progress
if ~exist('plot_progress', 'var') || isempty(plot_progress)
    plot_progress = false;
end

% Plot the data if we are plotting progress
if plot_progress
    figure;
    hold on;
end

% Initialize values
[m n] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
previous_centroids = centroids;
idx = zeros(m, 1);

% Run K-Means
for i=1:max_iters
    
    % Output progress
    fprintf('K-Means iteration %d/%d...\n', i, max_iters);
    if exist('OCTAVE_VERSION')
        fflush(stdout);
    end
    
    % For each example in X, assign it to the closest centroid
    idx = findClosestCentroids(X, centroids);
    
    % Optionally, plot progress here
    if plot_progress
        plotProgresskMeans(X, centroids, previous_centroids, idx, K, i);
        previous_centroids = centroids;
        fprintf('Press enter to continue.\n');
        pause;
    end
    
    % Given the memberships, compute new centroids
    centroids = computeCentroids(X, idx, K);
end

% Hold off if we are plotting progress
if plot_progress
    hold off;
end

[cat1, cat2, cat3, cat4, p, q, r, s] = categorise(idx, m);
fprintf(' Cluster 1 has %d elements,\n Cluster 2 has %d elements,\n Cluster 3 has %d elements \n', p, q, r);
fprintf('The details of the stocks in each cluster have been stored in data1, data2, data3 variables respectively.');

    for i = 1:p
       data1(i, 1) = textdata(cat1(i), 1);
       data1(i, 2) = textdata(cat1(i), 2);
       data1(i, 3) = textdata(cat1(i), 3);
%       fprintf(fileID1,'%d, %d, %d',textdata{cat1(i), 1}, textdata{cat1(i), 2}, textdata{cat1(i), 3});
    end

    for i = 1:q
       data2(i, 1) = textdata(cat2(i), 1);
       data2(i, 2) = textdata(cat2(i), 2);
       data2(i, 3) = textdata(cat2(i), 3);
%      fprintf(fileID2,'%d, %d, %d',textdata{cat2(i), 1}, textdata{cat2(i), 2}, textdata{cat2(i), 3});
    end

    for i = 1:r
       data3(i, 1) = textdata(cat3(i), 1);
       data3(i, 2) = textdata(cat3(i), 2);
       data3(i, 3) = textdata(cat3(i), 3);
%     fprintf(fileID3,'%d, %d, %d',textdata{cat3(i), 1}, textdata{cat3(i), 2}, textdata{cat3(i), 3});
    end

    for i = 1:s
       data4(i, 1) = textdata(cat4(i), 1);
       data4(i, 2) = textdata(cat4(i), 2);
       data4(i, 3) = textdata(cat4(i), 3);
%    fprintf(fileID4,'%d, %d, %d',textdata{cat4(i), 1}, textdata{cat4(i), 2}, textdata{cat4(i), 3});
    end

end

