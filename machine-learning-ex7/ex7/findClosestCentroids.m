function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);
sizex = size(X,1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

min_cen_dis = inf;
min_cen_id = inf;


for x_id = 1:sizex
  
  for cen_id = 1:K
    distance = X(x_id,:) - centroids(cen_id,:);
    sum_distance_sq = sum(distance.^2);
    if sum_distance_sq < min_cen_dis
      min_cen_dis = sum_distance_sq;
      min_cen_id = cen_id;
    end
  end
  idx(x_id) = min_cen_id;
  min_cen_id = inf;
  min_cen_dis = inf; 
end



% =============================================================

end

