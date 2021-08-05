function [ f ] = F2d( x )
%TEST_FUNC 2D function to test the simulated annealing

L = [2,2.2,3,5];
a = [3,-3,0,0];
b = [0,0,-3,3];
s = [0.6,0.6,1,1];
f=0;

for i=1:4
f=f-L(i)*exp( -0.5*(((x(1)-a(i))/s(i)).^2 + ((x(2)-b(i))/s(i)).^2 ));
end
end

