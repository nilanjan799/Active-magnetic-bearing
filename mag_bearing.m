function []=mag_bearing()
m=6; ks=-4.5; ki=3.51; r=3.7; l=5.94*10^-4; kp=500; kd=500; k=500;

zi=[0;0;0;0];
ti=0; tf=20; fps=250;

A=[0,1,0,0;-ks/m,0,ki/m,0;0,-ki/l,-r/l,0;1,0,0,0];
B1=[0;0;1/l;0];
B2=[0;1/m;0;0];
C1=[1,0,0,0];
C2=[kp,0,0,k];
E=eye(4)+kd*B1*C1;
A1=E\(A-B1*C2)
damp(A1)

tspan=linspace(ti,tf,fps);
[t,z]=ode45(@(t,z)solver2(t,z,m,ks,ki,r,l,kp,kd,k),tspan,zi);
plot(t,z(:,1))
title('kp=500; kd=500; ki=500; f=100+ 50*cos(15t)')
end