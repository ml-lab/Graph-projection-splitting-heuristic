function p=proj_nonlinear(w_tilde,U2_hat)

% w_tilde is a concatenated version of (z_tilde,y_tilde) vector
% U2_hat is coming from our pre calculation

v_proj=sils(U2_hat,w_tilde);
% nead to have a version with approximate integer least-squares, this one
% is using MILES to calculate the results exactly

p=U2_hat*v_proj;

