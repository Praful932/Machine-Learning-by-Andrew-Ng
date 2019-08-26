function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);

% dim 10 by 1
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
% 5000 by 1 vector
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       
% ghx dim 5000 by 10
ghx=sigmoid(X* all_theta');
% taking max along row will give us the y for which c is trained for that number
% we need output y 1 to 10 so for 5000 by 10 we take max along 2nd dim and index
% of max will be the predicted number 
% p is the index we want
%The help doc in Octave is not very well written. Here max(A, [], 2) means maximum of a row of the matrix A, with the second dimension (2), i.e., all the columns of for a given row. [] represents a matrix as opposed to a vector.
[a,p]=max(ghx,[],2);



% =========================================================================


end
