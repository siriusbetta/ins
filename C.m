function out = C(phi, tetha, psi)
x0 = [1;0;0];
y0 = [0;1;0];
z0 = [0;0;1];

c1 = rot(psi, z0);
c2 = rot(tetha, y0);
c3 = rot(phi, x0);

out = c3*c2*c1;
end