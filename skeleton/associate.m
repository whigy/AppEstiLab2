% function [outlier,Psi] = associate(S_bar,z,W,Lambda_psi,Q)
%           S_bar(t)            4XM
%           z(t)                2Xn
%           W                   2XN
%           Lambda_psi          1X1
%           Q                   2X2
% Outputs: 
%           outlier             1Xn
%           Psi(t)              1XnXM
function [outlier,Psi] = associate(S_bar,z,W,Lambda_psi,Q)
% FILL IN HERE

M = size(S_bar, 2); %number of particles
N = size(W, 2); %number of landmark
n = size(z, 2); % number of observations

outlier = zeros(1, n);
Psi = zeros(1, n, M);
nu = zeros(2, N, M, n);
%psi = zeros(n, N, M);
c = zeros(n, M);

z_hat = zeros(2, N, M);
for k = 1 : N
    z_hat(:, k, :) = observation_model(S_bar, W, k);
end

for i = 1 : n

    %BE SURE THAT YOUR innovation 'nu' has its second component in [-pi, pi]
    nu(2, :, :, i) = mod(nu(2, :, :, i) + pi, 2 * pi) - pi;
    for m = 1 : M
        psi = (2 * pi * det(Q)^0.5)^-1 * exp(diag(-0.5 * nu(:, :, m, i)' / Q * nu(:, :, m, i)));
        [max_psi,ind] = max(psi);
        c(i, m) = ind;
        Psi(1, i, m) = max_psi;
    end
    outlier(i) = logical(mean(Psi(:, i, :)) <= Lambda_psi);
end

end
