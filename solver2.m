function dz=solver2(t,z,m,ks,ki,r,l,kp,kd,k)
x=z(1); v=z(2); I=z(3); ixdt=z(4);
A=[0,1,0,0;-ks/m,0,ki/m,0;0,-ki/l,-r/l,0;1,0,0,0];
B1=[0;0;1/l;0];
B2=[0;1/m;0;0];
C1=[1,0,0,0];
C2=[kp,0,0,k];
E=eye(4)+kd*B1*C1;
dz=E\((A-B1*C2)*z+B2*100*(1+0.5*cos(15*t)));
end