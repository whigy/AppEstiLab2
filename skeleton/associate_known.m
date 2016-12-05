% function [outlier,Psi] = associate_known(S_bar,z,W,Lambda_psi,Q,known_associations)
%           S_bar(t)            4XM  %prediction
%           z(t)                2Xn  %measurement
%           W                   2XN  %landmark
%           Lambda_psi          1X1  %threshold
%           Q                   2X2  
%           known_associations  1Xn
% Outputs: 
%           outlier             1Xn
%           Psi(t)              1XnXM
function [outlier,Psi] = associate_known(S_bar,z,W,Lambda_psi,Q,known_associations)
% FILL IN HERE
M = size(S_bar, 2); %number of particles
N = size(W, 2); %number of landmark
n = size(z, 2); % number of observations

outlier = zeros(1, n);
Psi = zeros(1, n, M);
nu = zeros(2, N, M, n);
%psi = zeros(n, N, M);
%c = zeros(n, M);

z_hat = zeros(2, N, M);
for k = 1 : N
    z_hat(:, k, :) = observation_model(S_bar, W, k);
end

for i = 1 : n
    z_temp = repmat(z(:, i), 1, N * M);
    z_temp = reshape(z_temp, 2, N, M);
    nu(:, :, :, i) = z_temp - z_hat;
    %BE SURE THAT YOUR innovation 'nu' has its second component in [-pi, pi]
    nu(2, :, :, i) = mod(nu(2, :, :, i) + pi, 2 * pi) - pi;
    for m = 1 : M
        psi = (2 * pi * det(Q)^0.5)^-1 * exp(diag(-0.5 * nu(:, :, m, i)' / Q * nu(:, :, m, i)));
        %[max_psi,ind] = max(psi);
        %c(i, m) = ind;
        %Psi(1, i, m) = max_psi;
        Psi(1, i, m) = psi(known_associations(i));
    end
    outlier(i) = logical(mean(Psi(:, i, :)) <= Lambda_psi);
end
end
