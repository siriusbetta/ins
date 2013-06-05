clear;
load('out.mat');

WieConstant = 7.2921151467 * 10^-5;
e = 0.00335281066475;

Re = 6378140;

t = 200;
dT = 0.1;

phi(1) = rad(40);
tetha(1) = rad(50);
psi(1) = rad(60);

angle = 2;
a = 0;
An(1) = a * sin(rad(angle));
Ae(1) = a * cos(rad(angle));

v = 0;
Vn(1) = v * sin(angle);
Ve(1) =v * cos(angle);
d = 0;
i = 2;
L(1) = rad(30);
l(1) = rad(60);

phi(1) = rad(40);
tetha(1) = rad(50);
psi(1) = rad(60);

testPhi(1) = rad(40);
testTetha(1) = rad(50);
testPsi(1) = rad(60);
V = [Vn(1); Ve(1); 0];
for j=1:dT:t-2
    RN = Re*(1 - e^2)/(1 - e^2 * sin(L(i - 1))^2)^(3/2);
    RE = Re/(1 - e^2 * sin(L(i-1))^2)^(1/2);
   
    Wnen(:,i) = [Ve(i - 1)/RE; -Vn(i - 1)/RE; -Ve(i - 1) * tan(L(i-1))/ RN];
    Wnie(:,i) = [WieConstant * cos(L(i - 1)); 0; -WieConstant * sin(L(i-1))];
    Wbin(:,i) = Wbib(:,i) - eye(3) * C(phi(i - 1), tetha(i- 1), psi(i - 1)) * (Wnie(:,i) + Wnen(:,i));
    
    wx(i) = Wbin(1,i);
    wy(i) = Wbin(2,i);
    wz(i) = Wbin(3,i);
    
    testPhi(i) = (wy(i)*sin(testPhi(i - 1) + wz(i) * cos(testPhi(i - 1)))) * tan(testTetha(i - 1)) + wx(i);
    testTetha(i) = wx(i) * cos(testPhi(i - 1) - wz(i) * sin(testPhi(i - 1)));
    testPsi(i) = (wy(i) * sin(testPhi(i - 1)) + wz(i) * cos(testPhi(i - 1))) * sec(testTetha(i - 1));
    
    fn(:,i) =  eye(3)*C(phi(i-1), tetha(i-1), psi(i-1))*fb(:,i)- cross((2*Wnie(:,i) + Wnen(:,i)), V(:,i-1));
    V(:, i) = C(phi(i - 1), tetha(i - 1), psi(i - 1)) * fb(:,i) ;
    
    Vn(i) = V(1,i);
    Ve(i) = V(2,i);
    V(:,i) = [Vn(i); Ve(i); 0];
    L(i) = L(i - 1) + Vn(i)*dT/Re; 
    l(i) = l(i - 1) + Ve(i)*dT*sec(rad(L(i)))/Re;
    
    phi(i) = testPhi(i);
    tetha(i) = testTetha(i);
    psi(i) = testPsi(i);
   
    i = i + 1;
end 


% for j = 1:dT:t-1
%     testPhi(i) = (wy(i)*sin(testPhi(i - 1) + wz(i) * cos(testPhi(i - 1)))) * tan(testTetha(i - 1)) + wx(i);
%    iPhi(i) = testPhi(i) * dT + iPhi(i - 1);
%    
%    testTetha(i) = wx(i) * cos(testPhi(i - 1) - wz(i) * sin(testPhi(i - 1)));
%    iTetha(i) = testTetha(i) *dT + iTetha(i -1);
%    
%    testPsi(i) = (wy(i) * sin(testPhi(i - 1)) + wz(i) * cos(testPhi(i - 1))) * sec(testTetha(i - 1));
%    iPsi(i) = testPsi(i) * dT + iPsi(i -1);
%    i = i + 1;
% end