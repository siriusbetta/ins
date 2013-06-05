function out = C1(psi)
psiRad = rad(psi);
%psiRad = psi;
R =[cos(psiRad),sin(psiRad),0;
    -sin(psiRad),cos(psiRad),0;
    0,0,1];
out = R;
end