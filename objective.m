function Y = objective(X_extended, noise)

X = X_extended(2);


% Matyas function 
% Matlab Code by A. Hedar (Nov. 23, 2005).
% The number of variables n =2.

%  Y = -(0.26*(X(1)^2+X(2)^2)-0.48*X(1)*X(2));


Y = -(X-0.5)^2+1;

if nargin < 2
	noise = 0;
end


if noise > 0
	Y = Y + randn*sqrt(noise);
end

%  NR = size(X,1);
%  Y = zeros(NR, 1);
%  
%  for i =1:NR
%      Y(i,:) = -(0-X(i,1))^2 + -(1-X(i,2))^2;
%  end
%  
