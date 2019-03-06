function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%
%Cost function
%J_y_zero = (-y)' *log(sigmoid(X*theta)) % (y)mx1 * (theta)nx1 * (X)mxn 
%J_y_one = (1 - y)' * log( 1 - (sigmoid(X*theta)))

%usual_grad = (1/m) * (sigmoid(X*theta) - y)' * X

%Cost function regularisation
%theta(1) = 0
%regularization = (lambda/(2*m)) * theta'*theta
%regularized_grad = (lambda/m) * theta

%J = (1/m) * (J_y_zero - J_y_one) + regularization

%grad =    ( usual_grad + regularized_grad')

theta_length = length(theta)



cost_func = (1/m) * ( ( (-y)' * log(sigmoid(X * theta)) ) - ( (1-y)' * log(1 - sigmoid(X*theta))     ) )

%size(cost_func)

% old cost func
%cost_func = -y .* log(sigmoid(X*theta)) - (1 - y) .* log(1 - sigmoid(X*theta));
%size(cost_func)

%here we're using . products. to multiply each y by each 1 or 0. 
%So we get a vector of the differences. 
%X*theta = mxn matrix multiplied by the vector theta = 1 by n matrix. y is an nx1 matrix. 


temp_theta = theta
temp_theta(1) = 0
J = cost_func + (lambda/(2*m)*sum(temp_theta.^2))

grad = ((1/m) * (X' * (sigmoid(X*theta) - y))) + ((lambda/m) * temp_theta)


%grad = (1 / m) .* (X' * (sigmoid(X*theta) - y) ) + (lambda / m) * thetaNoZero;







end


%Cost function

%J_y_zero = (-y)' *log(sigmoid(X*theta)) % (y)mx1 * (theta)nx1 * (X)mxn 
%J_y_one = (1 - y)' * log( 1 - (sigmoid(X*theta)))
%J = (1/m) * (J_y_zero - J_y_one)


%Gradient descent 

%grad = (1/m) * (sigmoid(X*theta) - y)' * X

%g = 1./( 1 + exp( - z ))



