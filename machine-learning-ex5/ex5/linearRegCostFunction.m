function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


h_x = X*theta;
error = h_x - y;
error_sq = error.^2;
sum_sq = sum(error_sq);

J = (1/(2*m)) * sum_sq;
grad = X' * error * (1/m);


theta(1) = 0;

sum_theta_sq = sum(theta.^2);
J = J + (lambda/ (2*m)) * sum_theta_sq;
reg_grad = theta * lambda / m;

grad = grad + reg_grad;
   


% =========================================================================

grad = grad(:);

end
