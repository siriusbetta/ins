clear;
load('out.mat');

t = 200;
dT = 0.1;

phi(1) = rad(40);
tetha(1) = rad(50);
psi(1) = rad(60);

angle = 2;
a = 10;
An = a * sin(rad(angle));
Ae = a * cos(rad(angle));

v = 50;
Vn(1) = v * sin(angle);

d = 0;
i = 2;
for j = 1:dT:t
    Vn(i) = v + An * dT;
    Ve(i) = v + Ae * dT;
   phi(i) =sin(8*rad(j));% phi(i - 1) + atan(Ve(i)/Vn(i));%phi(i - 1) + d;% sin(8*rad(j));
   
   %phi(i) = phi(i - 1) + d;
   
   tetha(i) = cos(rad(j));%tetha(i - 1)+ d;
   %tetha(i) = tetha(i) * rad(10);
   psi(i) = sin(5*rad(j));%psi(i -1)+d;%sin(8*rad(j));
   %psi(i) = psi(i) * rad(10);
   i= i+1;
end

wx(1) = 0;
wy(1) = 0;
wz(1) = 0;

testPhi(1) = rad(40);
testTetha(1) = rad(50);
testPsi(1) = rad(60);
iPhi(1) = 0;
iPsi(1) = 0;
iTetha(1) = 0;

i = 2;
for j = 1:dT:t-1
   dTetha = tetha(i) - tetha(i - 1); %tetha(i - 1) - tetha(i);
   dPsi = psi(i) - psi(i - 1);%psi(i - 1) - psi(i);
   dPhi = phi(i) - phi(i - 1);%phi(i - 1) - phi(i);
   wx(i) = dTetha * cos(psi(i)) - dPsi*sin(psi(i))*cos(tetha(i));
   wx(i) = wx(i)*dT + wx(i - 1);
   wy(i) = dPsi + dPhi * sin(tetha(i));
   wy(i) = wy(i)*dT + wy(i - 1);
   wz(i) = dTetha * sin(psi(i)) + dPhi * cos(psi(i)) * cos(tetha(i));
   wz(i) = wz(i) * dT +  wz(i - 1);

   
    i = i + 1;
end
i = 2;

for j = 1:dT:t
    testPhi(i) = (wy(i)*sin(testPhi(i - 1) + wz(i) * cos(testPhi(i - 1)))) * tan(testTetha(i - 1)) + wx(i);
    %testPhi(i) = testPhi(i)*dT + testPhi(i - 1);
    testTetha(i) = wx(i) * cos(testPhi(i - 1) - wz(i) * sin(testPhi(i - 1)));
    %testTetha(i) = testTetha(i)*dT + testTetha(i - 1);
    testPsi(i) = (wy(i) * sin(testPhi(i - 1)) + wz(i) * cos(testPhi(i - 1))) * sec(testTetha(i - 1));
    %testPsi(i) = testPsi(i)*dT + testPsi(i - 1);
    
%     
%      iPhi(i) = testPhi(i) * dT + iPhi(i - 1);
%     iTetha(i) = testTetha(i) *dT + iTetha(i -1);
%     iPsi(i) = testPsi(i) *dT + iPsi(i -1);
     i = i + 1;
end