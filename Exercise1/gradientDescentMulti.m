function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
% new X with appended x_0


for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    % we want theta order to be 3 by 1   
    hx=(X*theta)-y;
    % idhar sada dala .* ki ...
    delta=sum(hx .* X);
    % delta' to adjust with theta dims
    theta=theta - ((alpha/m).*delta');
    
    % Just for understanding
    %error = (X * theta) - y;
    %theta = theta - ((alpha/m) * X'*error);
    
    
    
    % ============================================================
    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);
 
end

end
