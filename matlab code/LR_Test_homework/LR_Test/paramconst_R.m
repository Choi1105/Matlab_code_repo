%% parameter constraints

function [valid] = paramconst_R(theta,Data)

validm = ones(10,1);

% Sig2 > 0
validm(1) = theta(3) > 0; 
valid = min(validm); 

end