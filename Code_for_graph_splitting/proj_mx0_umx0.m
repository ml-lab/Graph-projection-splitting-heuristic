function p=proj_mx0_umx0(y,x0,u)
% this function calculates the projection on the set [-x0,u-x0]
% and then rounds the results to keep an integer projection

p=zeros(length(y),1);

up_vct=u-x0;

for i=1:length(y)
    if y(i) < -x0(i)
        p(i)=-x0(i);
    elseif y(i) > up_vct(i)
        p(i)=up_vct(i);
    else
        p(i)=round(y(i));
    end
end