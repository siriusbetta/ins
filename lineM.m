clear;
%time
t = 200;
deltaTetha = 0;
deltaLamba = 0;

dTetha(1) = rad(45);
dLamba(1) = rad(25);

dDeltaTetha = 0;
dDeltaLamba = 0;

L(1) = rad(45);
l(1) = rad(60);

a = 20;
v = 50;
angle = rad(30);
aN = a * sin(angle);
aE = a * cos(angle);
vN(1) = v * sin(angle);
vE(1) = v * cos(angle);

deltaP = 0;
dP = 0;

lamba(1) = rad(30);
tetha(1) = rad(45);
P(1) = rad(50);

Wie = 7.292115*10^-5;



e = 0.00335281066475;
Re = 6378140;

RN = Re*(1 - e^2)/((1 - e^2 * sin(L)^2))^(3/2);
RE = Re / (1 - e^2 * sin(L)^2)^0.5;

dT = 0.1;
i = 1;
for j = 1:dT:t
    if i ~= 1
        lamba(i) = lamba(i-1) + deltaLamba;
        tetha(i) = tetha(i-1) + deltaTetha;
        dLamba(i) = dLamba(i-1) + dDeltaLamba;
        dTetha(i) = dTetha(i-1) + dDeltaTetha;
        
        vN(i) = vN(i-1) + aN * dT;
        vE(i) = vE(i-1) + aE * dT;
        
        L(i) = L(i-1) + vN(i)*dT/RN;
        l(i) = l(i-1) + vE(i)*dT * sec(L(i))/RE;
        
        
        
        P(i) = P(i-1) + atan(vE(i)/vN(i));
        dP(i) = dP(i-1) + aN*vE(i) - aE*vN(i)/(vE(i)^2 + vN(i)^2);
        
        
        
    end
    Wnie(:,i) = [Wie * cos(L(i)); 0; Wie * sin(L(i))];
    
    Wnen(:,i) = [vE(i)/RE; - vN(i)/RN; -vE(i)*tan(L(i))/RN];
    
    Wnbn(:,i) = [cos(lamba(i))*dTetha(i) - sin(lamba(i))*dP(i)
                 dLamba(i) + sin(tetha(i))*dP(i)
                 sin(lamba(i))*dTetha(i) + cos(lamba(i))*dP(i)];
             
    Wbib(:,i) = eye(3) * C(P(i), tetha(i), lamba(i))*(Wnie(:,i) + Wnen(:,i));
    
    fn(:,i) = cross((2*Wnie(:,i) + Wnen(:,i)), [vE(i) vN(i) 0]) - 9.8;
    fb(:,i) = [aE; aN; 0] + C(P(i), tetha(i), lamba(i))*fn(:,i); 
    
   i = i + 1;
end