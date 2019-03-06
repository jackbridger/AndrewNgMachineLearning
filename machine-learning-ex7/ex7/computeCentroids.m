function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);
% You need to return the following variables correctly.
centroids = zeros(K, n);



% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
num_x_in_this_k = zeros(K,1); % gotta find how many xs are in that centroid


for k_id = 1:K
%for each centroid we want to find the mean of the x values near to it
  for x_id = 1:m
  % we have to loop through each x value to find the ones linked to this particular cluster K. 
    if idx(x_id) == k_id
    %we see if this particular x is linked to our current k.
      %we count the number of points in the cluster
      num_x_in_this_k(k_id) = num_x_in_this_k(k_id) + 1;
      centroids(k_id, :) = centroids(k_id, :) + X(x_id,:);
    end
  end
end

centroids = centroids ./num_x_in_this_k;





%for cen_id = 1:K
%for every centroid 
%  for X_m_id = 1:m
  %for every row of X
%    if cen_id = idx(X_m_id)
%      centroids(cen_id,:) = centroids(cen_id,:) + X(X_m_id, :);
%      num_x[cen_id] = num_x[cen_id] + 1;
%    end
  
%  end
    
%  centroids(K,:) = centroids(K,:) / K / num_x;
  
%end




% =============================================================


end

