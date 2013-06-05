clear;
t = 200;
dT = 0.1;

load('out.mat');

phi(1) = rad(40);
tetha(1) = rad(50);
psi(1) = rad(60);

angle = 2;
a = 5;
An(1) = a * sin(rad(angle));
Ae(1) = a * cos(rad(angle));

v = 50;
Vn(1) = v * sin(angle);
Ve(1) =v * cos(angle);

V = [Vn(1); Ve(1); 0];
d = 0;
i = 2;
L(1) = rad(30);
l(1) = rad(60);
WieConstant = 7.2921151467 * 10^-5;
e = 0.00335281066475;

Re = 6378140;


for j = 1:dT:t-1
    
    RN = Re*(1 - e^2)/(1 - e^2 * sin(L(i-1))^2)^(3/2);
    RE = Re/(1 - e^2 * sin(L(i-1))^2)^(1/2);
    Wnen(:,i) = [Ve(i-1)/Re; -Vn(i-1)/Re; -Ve(i-1) * tan(L(i-1))/ Re];
    Wnie(:,i) = [WieConstant * cos(L(i-1)); 0; -WieConstant * sin(L(i-1))];
    Wbin(:,i) = Wbib(:,i-1) - eye(3) * C(phi(i - 1), tetha(i- 1), psi(i - 1)) * (Wnie(:,i-1) + Wnen(:,i-1));
   
    wx(i-1) = Wbin(1,i);
    wy(i-1) = Wbin(2,i);
    wz(i-1) = Wbin(3,i);

    phi(i) = (wy(i-1)*sin(phi(i - 1) + wz(i-1) * cos(phi(i - 1)))) * tan(tetha(i - 1)) + wx(i-1);
    phi(i) = phi(i) + phi(i - 1);
    tetha(i) = wy(i-1) * cos(phi(i - 1) - wz(i-1) * sin(phi(i - 1)));
    tetha(i) = tetha(i) + tetha(i - 1);
    psi(i) = (wy(i-1) * sin(phi(i - 1)) + wz(i-1) * cos(phi(i - 1))) * sec(tetha(i - 1));
    psi(i) = psi(i) + psi(i - 1);
    
    fn(:,i) = eye(3) * C(phi(i - 1), tetha(i-1), psi(i - 1))' * fb(:,i - 1);
    
    
    
    A(:,i) = fn(:,i) - cross((2*Wnie(:,i-1) + Wnen(:,i-1)), V(:,i - 1)) + [0;0;9.8];
    Vn(i) = V(1, i-1) + A(1, i)*dT;
    Ve(i) = V(2, i-1) + A(2, i)*dT;
    L(i) = L(i - 1) + Vn(i)*dT/Re; 
    l(i) = l(i - 1) + Ve(i)*dT*sec(rad(L(i)))/Re;
    V(:, i) = [Vn(i); Ve(i); 0];
   
    
    i = i + 1;
end
