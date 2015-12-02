function [X, t, model] = linRnd(d, n, prior)
% Generate a data from a linear model p(t|w,x)=G(w'x+w0,sigma), where w and w0 are
% generated from G(0,1)
%   d: dimension of data
%   n: number of data
%   prior: a structure specify the prior

if nargin < 3
    sigma = 1;
else
    sigma = prior.sigma;
end
X = rand(d,n);
w = randn(d,1);
w0 = randn(1,1);
epsilon = sigma^2*randn(1,n);
t = w'*X+w0+epsilon;
model.w = w;
model.w0 = w0;
model.sigma = sigma;