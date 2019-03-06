function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
vars = length(theta)
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


J_unreg = (1/m) * (((-y)' * log(sigmoid(X*theta))) - ((1 - y)' * log(1 - sigmoid(X*theta)) ))


grad_unreg = (1/m)*(X' * (sigmoid(X*theta) - y))


theta(1) = 0

J = sum(J_unreg + ( (lambda/(2*m)) * theta.^2 ))

grad = (grad_unreg + ((lambda/m) * theta))






%Cost function ( old stuff)
%J_y_zero = (-y)' *log(sigmoid(X*theta)) % (y)mx1 * (theta)nx1 * (X)mxn 
%J_y_one = (1 - y)' * log( 1 - (sigmoid(X*theta)))

%usual_grad = (1/m) * (sigmoid(X*theta) - y)' * X


%Cost function regularisation
%theta(1) = 0
%regularization = (lambda/(2*m)) * theta'*theta
%regularized_grad = (lambda/m) * theta


%J = (1/m) * (J_y_zero - J_y_one) + regularization



%grad =    ( usual_grad + regularized_grad')

%usual_grad
%regularized_grad

%grad

%First attempt
%J_y_zero = (-y)' *log(sigmoid(X*theta)) % (y)mx1 * (theta)nx1 * (X)mxn 
%J_y_one = (1 - y)' * log( 1 - (sigmoid(X*theta)))
%regularization = (lambda/2*m) * theta(2:vars)*theta(2:vars)'
%J = ((1/m) * (J_y_zero - J_y_one)) + regularization
%Gradient descent 
%grad(1) = (1/m) * (sigmoid(X(1:end,1)*theta(1)) - y(1)' * X(1:end,1)
%grad(2:end) = (1/m) * (sigmoid(X(1:end,2:end)*theta(2:end)) - y(2:end)' * X(1:end,2:end)





% =============================================================

end
