function p=prox_quad_test(D_tilde,d_tilde,z)

% dimension:
% D_tilde : p x n-m
% d_tilde: p x 1
% z : n-p

A=2*D_tilde'*D_tilde;

b=2*D_tilde'*d_tilde;

[m,n]=size(A);

p=(eye(n)+A)\(z-b);

p=round(p);






