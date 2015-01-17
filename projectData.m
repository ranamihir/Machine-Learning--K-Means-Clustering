function Z = projectData(X, U, K)
%PROJECTDATA Computes the reduced data representation when projecting only 
%on to the top k eigenvectors

% You need to return the following variables correctly.
Z = zeros(size(X, 1), K);



Z = X * U(:, 1:K);

% =============================================================
end