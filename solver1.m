function dz=solver1(t,z,m,ks,ki,r,l,kp,kd)
x=z(1); v=z(2); I=z(3);
A=[0,1,0;-ks/m,0,ki/m;0,-ki/l,-r/l];
B=[0;0;1/l];
C=[0;1/m;0];
D=[1,0,0];
E=eye(3)+kd*B*D;
dz=E\((A-kp*B*D)*z+C*100*(1+0.5*cos(15*t)));
end