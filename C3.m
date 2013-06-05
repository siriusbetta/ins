function out = C3(phi)
phiRad = rad(phi);
%phiRad = phi;
R = [1, 0, 0;
     0, cos(phiRad), sin(phiRad);
     0, -sin(phiRad), cos(phiRad)];

out = R;
end