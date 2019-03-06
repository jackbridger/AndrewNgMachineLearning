function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;


possible_values = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% for each sigma, for each C (8 in total), train the model, test the error, save the errors in 

min_err = inf;
C_min = inf;
Sig_min = inf;


for C_i = possible_values

  for Sig_i = possible_values
    model = svmTrain(X, y, C_i, @(x1, x2) gaussianKernel(x1, x2, Sig_i));
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval));
    
    if error < min_err
      min_err = error;
      C_min = C_i;
      Sig_min = Sig_i;
    end
  
  end

end 


C = C_min;
sigma = Sig_min;

% =========================================================================

end
