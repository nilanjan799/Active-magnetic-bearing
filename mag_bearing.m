function []=mag_bearing()
m=1; ks=-10^4; ki=10; r=1; l=.01; kp=5000; kd=500;
zi=[0;0;0];
ti=0; tf=10; fps=100;
tspan=linspace(ti,tf,fps);
[t,z]=ode45(@(t,z)solver1(t,z,m,ks,ki,r,l,kp,kd),tspan,zi);
plot(t,z(:,1))
title('kp=5000; kd=500; f=100+ 50*cos(15t)')
end