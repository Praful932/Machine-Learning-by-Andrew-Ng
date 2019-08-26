function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    hx = X*theta;
    s = hx-y;
    % since x0 is 1
    temp1=theta(1)- ((alpha/m)*sum(s));
    % Here derivative is x1 which is whole record of features
    % both s and x are are m by 1 matrix and summation over them and summation of each record
    temp2 = theta(2)-((alpha/m)*sum(s.*X(:,2)));
    theta(1) = temp1;
    theta(2) = temp2;
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
