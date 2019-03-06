function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

size(X)
size(y)

disp ("The size of theta is:"), disp (size(theta))
disp ("The size of X is:"), disp (size(X))
disp ("The size of y is:"), disp (size(y))
disp ("The size of X'(:,2) is:"), disp (size(X'(:,2)))


disp ("theta*X(1,:)"), disp (size(theta*X(1,:)))

disp ("(X*theta - y "), disp (size(X*theta - y) )



for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

% do 1 to 2 



theta = theta - ( ( 1 / m ) * alpha * X' *(X*theta - y) ) 



%theta(1:2)   


    
%The size of theta is:
 %  2   1
%The size of X is:
 %  97    2
%The size of y is:
 %  97    1
%The size of X'(:,2) is:
 %  2   1




    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
