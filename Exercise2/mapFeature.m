function out = mapFeature(X1, X2)
% MAPFEATURE Feature mapping function to polynomial features
%
%   MAPFEATURE(X1, X2) maps the two input features
%   to quadratic features used in the regularization exercise.
%
%   Returns a new feature array with more features, comprising of 
%   X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
%
%   Inputs X1, X2 must be the same size
%


% 28 new features(including earlier) created from existing features
% X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc.. for each record all these are new features

degree = 6;
% add intercept
out = ones(size(X1(:,1)));
for i = 1:degree
    for j = 0:i
        % add feature columns after that
        % 118 by 28 out array first column x_0 all 1
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end

end