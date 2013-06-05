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
dT = 0.1;
a = 20;
v = 50;
angle = rad(30);
aN = a * sin(angle);
aE = a * cos(angle);
vN(1) = 0;
vE(1) = 0;

deltaP(1) = 0;
dP(1) = 0;
dDeltaP(1) = 0;

lamba(1) = rad(30);
tetha(1) = rad(45);
P(1) = rad(50);
Tc = 50;
Vg = 40;
dT = 0.1;

Wie = 7.292115*10^-5;



e = 0.00335281066475;
Re = 6378140;

RN = Re*(1 - e^2)/((1 - e^2 * sin(L)^2))^(3/2);
RE = Re / (1 - e^2 * sin(L)^2)^0.5;

i = 1;
for j = 1:dT:t
    if i ~= 1
        lamba(i) = lamba(i-1) + deltaLamba;
        tetha(i) = tetha(i-1) + deltaTetha;
        dLamba(i) = dLamba(i-1) + dDeltaLamba;
        dTetha(i) = dTetha(i-1) + dDeltaTetha;
       
        deltaP= mod(2*pi*dT/Tc, 2*pi);
        dDeltaP = 2*pi/Tc;
        dP(i) = dP(i-1) + dDeltaP;
        
        
        
        
        P(i) = P(i-1) + deltaP;
       
        
        aE(i) = - 2*pi*Vg*cos(P(i))/Tc;
        aN(i) = - 2*pi*Vg*sin(P(i))/Tc;
        vN(i) = aN(i) + vN(i-1) * dT;
        vE(i) = aE(i) + vE(i-1) * dT;
        
        
        L(i) = L(i-1) + vN(i)*dT/RN;
        l(i) = l(i-1) + vE(i)*dT * sec(L(i))/RE;
    end
    Wnie(:,i) = [0; Wie * cos(L(i)); Wie * sin(L(i))];
    
    Wnen(:,i) = [- vN(i)/RN; vE(i)/RE; vE(i)*tan(L(i))/RN];
    
    Wnbn(:,i) = [cos(lamba(i))*dTetha(i) - sin(lamba(i))*dP(i)
                 dLamba(i) + sin(tetha(i))*dP(i)
                 sin(lamba(i))*dTetha(i) + cos(lamba(i))*dP(i)];
             
    Wbib(:,i) = eye(3) * C(P(i), tetha(i), lamba(i))*(Wnie(:,i) + Wnen(:,i));
    
    fn(:,i) = cross((2*Wnie(:,i) + Wnen(:,i)), [vN(i);vE(i);0]) - 9.8;
    fb(:,i) = [ aN(i); aE(i); 0] + C(P(i), tetha(i), lamba(i))*fn(:,i); 
    
   i = i + 1;
end