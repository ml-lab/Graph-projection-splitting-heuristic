hold on;

load...
('C:\Users\Shuvomoy Das Gupta\Google Drive\GitHub\Graph_splitting_form_over_integers\Numerical_example_10\Output_and_plots\output.mat')

x_axis=1:iter_number;
y_axis=100*norm_gap(x_axis)/norm(x_star);
fig10=plot(x_axis,y_axis,'DisplayName','Example 10','LineWidth',2);
 ylim([-1 100]);
 xlim([0 15]);
min(y_axis);
xlabel('iteration number');
ylabel('$\|x^{\star}-x^{{\rm current}}\|/\|x^{\star}\|$','Interpreter','latex');
title('$\|x^{\star}-x^{{\rm current}}\|/\|x^{\star}\|$ vs. iterations','Interpreter','latex');




