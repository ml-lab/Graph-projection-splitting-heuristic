
clearvars;

% -------------------------------------------------------------
% Let us load all the data first from precalculation
% ------------------------------------------------------------

% please change the location of mypath variable to the same directory where
% you saved the data

mypath = 'C:\Users\Shuvomoy Das Gupta\Google Drive\GitHub\Graph_splitting_form_over_integers\Numerical_example_6\Input_data';

% please change the location of the outputpath to a directory where you
% want to save the data
outputpath='C:\Users\Shuvomoy Das Gupta\Google Drive\GitHub\Graph_splitting_form_over_integers\Numerical_example_6_alternative\Output_and_plots';

A=csvread(fullfile(mypath,'A.txt'));

x_star=csvread(fullfile(mypath,'x_star.txt'));

b=csvread(fullfile(mypath,'bvect.txt'));

D=csvread(fullfile(mypath,'matD.txt'));

d=csvread(fullfile(mypath,'dvect.txt'));

bounds=csvread(fullfile(mypath,'bounds.txt'));

U=csvread(fullfile(mypath,'U.txt'));

B=csvread(fullfile(mypath,'B.txt'));

U1=csvread(fullfile(mypath,'U1.txt'));

U2=csvread(fullfile(mypath,'U2.txt'));

C=csvread(fullfile(mypath,'cC.txt'));

hatU=csvread(fullfile(mypath,'hatU.txt'));

hatU1=csvread(fullfile(mypath,'hatU1.txt'));

hatU2=csvread(fullfile(mypath,'hatU2.txt'));

hatB=csvread(fullfile(mypath,'hatB.txt'));

x0=csvread(fullfile(mypath,'x0.txt'));

z_init=csvread(fullfile(mypath,'z0.txt'));

y_init=csvread(fullfile(mypath,'y0.txt'));


%----------------------------------
% Getting some relevant info
%---------------------------------
l=bounds(1);
u=bounds(2);
[m,n]=size(A);


%-------------------------------------
% Finding one feasible solution
% -------------------------------------
% mid_vect=round((0+u)/2)*ones(n,1);
% 
% lhs=(mid_vect-(U1*inv(B)*b));

 %z_init = round(pinv(U2)*(mid_vect-(U1*inv(B)*b)));
% z_init = sils(U2,lhs,1);
% x0=U1*inv(B)*b+U2*z_init;
% y_init=U2*z_init;
% if norm(A*x0-b)==0
%     disp('x_0 satisfies A x_0=b');
% end

% Data for the projection problem:
D_tilde=D*U2;
d_tilde=D*x0-d;

% Test if the initialization is alright
% 
% if norm(D*x0-d)==0
%     disp(':-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-)')
%     disp('No need to solve the problem, the initial solution is optimal')
%     disp(':-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-)')
%     return
% end

% Generate a initial z_k, y_k, z_tilde_k, y_tilde_k
z_k=z_init;
y_k=y_init;
z_tilde_k=z_init;
y_tilde_k=y_init;
length(z_tilde_k)

flag=0;
tol=0.001;
iter_number=500;
z_array=zeros(length(z_tilde_k),iter_number);

%----------------------------------
% The following for loop implements graph projection splitting over
% integers
%-----------------------------------

for i=1:iter_number
z_k_half=prox_quad_test(D_tilde,d_tilde,z_k-z_tilde_k);
y_k_half=proj_mx0_umx0(y_k-y_tilde_k,x0,u);

w_hat=[z_k_half+z_tilde_k; y_k_half+y_tilde_k];
w_hat_k=proj_nonlinear(w_hat,hatU2);
z_k_pls_1=w_hat_k(1:n-m);
y_k_pls_1=w_hat_k(n-m+1:2*n-m);

z_array(:,i)=z_k_pls_1;

x_test=x0+(U2*z_k_pls_1);

if(norm(D*x_test-d) < tol && flag==0)
disp(':-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-)')
disp(['Optimality reached at iteration number = ', num2str(i)]);
disp(':-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-) :-)')
flag=1;
%break;
end

z_tilde_k_pls_1=z_tilde_k+z_k_half-z_k_pls_1;
y_tilde_k_pls_1=y_tilde_k+y_k_half-y_k_pls_1;


% k := k+1

z_k=z_k_pls_1;
y_k=y_k_pls_1;
z_tilde_k=z_tilde_k_pls_1;
y_tilde_k=y_tilde_k_pls_1;

end

x_array=zeros(length(x0),iter_number);
obj=zeros(iter_number,1);
norm_gap=zeros(iter_number,1);
for i=1:iter_number
   x_array(:,i)=x0+U2*z_array(:,i);
   obj(i)=norm(D*x_array(:,i)-d);
   norm_gap(i)=norm(x_star-x_array(:,i));
end

% Finding the best solution:
[best_obj_value,index_best_obj_value] = min(obj);

x_best=x_array(:,index_best_obj_value);

disp('##################################');
disp('the best solution is, x_best = ');
disp(x_best');
disp('##################################');


save(fullfile(outputpath,'output.mat'));

fig1=figure(1);
x_axis=1:iter_number;
y_axis=obj(x_axis);
plot(x_axis,y_axis);
 ylim([-20 2000]);
xlabel('iteration number');
ylabel('$f(x^{\rm current})-f(x^\star)$','Interpreter','latex');
title('$f(x^{\rm current})-f(x^\star)$ vs. iterations','Interpreter','latex');
saveas(fig1, fullfile(outputpath,'objective_vs_iterations.png'));

fig2=figure(2);
x_axis=1:iter_number;
y_axis=norm_gap(x_axis);
fig2=plot(x_axis,y_axis);
 ylim([-10 2000]);
min(y_axis);
xlabel('iteration number');
ylabel('$\|x^{\star}-x^{{\rm current}}\|$','Interpreter','latex');
title('$\|x^{\star}-x^{{\rm current}}\|$ vs. iterations','Interpreter','latex');
saveas(fig2,fullfile(outputpath,'x_star_minus_x_current_vs_iterations.png'));