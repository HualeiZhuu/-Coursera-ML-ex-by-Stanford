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


% ======================================================
% Code for selection are here,and it will take a few minutes.
vec = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]';
bestC = 0;
bestSigma = 0;
error_cv = 0;

for i=1:8,
	for j = 1:8,
		C = vec(i);
		sigma = vec(j);
		model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		predictions = svmPredict(model, Xval);
		t = mean(double(predictions ~= yval));
		if i ==1 && j == 1 || t < error_cv,
			bestC = C;
			bestSigma = sigma;
			error_cv = t;
		end
	end
end
C = bestC;
sigma = bestSigma;

% =====================================================
% Results are:
% C = 1;
% sigma = 0.1;

% =========================================================================

end
