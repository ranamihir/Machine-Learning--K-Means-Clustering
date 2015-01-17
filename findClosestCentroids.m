function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%

% Set K
K = size(centroids, 1);

idx = zeros(size(X,1), 1);


for i = 1:length(X)
	deltas = zeros(K,1);
	x = X(i,:);
	for j = 1:K
		k = centroids(j,:);
		delta = x - k;
		deltas(j) = delta * delta';
		%fprintf(['delta for X(%d) & centroid(%d) : %f\n'], i, j, deltas(j));
	end
	[y, idx(i)] = min(deltas);
	%fprintf(['centroid idx for X(%d): %d\n'], i, idx(i) );
end
% =============================================================

end