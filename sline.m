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
h = rad(30);
acN(1) = 10;
acE(1) = a * rad(h);
vN(1) = v * sin(h);
vE(1) = v * cos(h);
A = 10;
deltaP(1) = 0;
dP(1) = 0;
dDeltaP(1) = 0;

lamba(1) = rad(30);
tetha(1) = rad(45);
P(1) = rad(50);
Ts = 10;
Vg = 40;
dT = 0.1;
nu0 = rad(30);
Wie = 7.292115*10^-5;

%deltaP= mod(2*pi*dT/Tc, 2*pi);
%dDeltaP = 2*pi/Tc;

e = 0.00335281066475;
Re = 6378140;
f = 0.1;
RN = Re*(1 - e^2)/((1 - e^2 * sin(L)^2))^(3/2);
RE = Re / (1 - e^2 * sin(L)^2)^0.5;
As = 1;
i = 1;


for j = 1:dT:t
    if i ~= 1
        lamba(i) = lamba(i-1) + deltaLamba;
        tetha(i) = tetha(i-1) + deltaTetha;
        dLamba(i) = dLamba(i-1) + dDeltaLamba;
        dTetha(i) = dTetha(i-1) + dDeltaTetha;
        
        
        acE(i) = (4*A*pi^2)/(Ts^2) * cos(2*pi*j/Ts + nu0);
        acN(i) = a;
        vE(i) = vE(i-1)*cos(h) + acE(i)*dT*cos(h);
        vN(i) = vN(i-1)*sin(h) + a*dT*sin(h);
        
        
        L(i) = L(i-1) + vN(i)*dT/RN;
        l(i) = l(i-1) + vE(i)*dT * sec(L(i))/RE;
        RN = Re*(1 - e^2)/((1 - e^2 * sin(L(i))^2))^(3/2);
        RE = Re / (1 - e^2 * sin(L(i))^2)^0.5;
    end
    
    P(i) = P(1) + As*sin(2*pi*j/Ts);
    dP(i) = 2*pi*As * cos(2*pi*j/Ts);
    
    Wnie(:,i) = [0; Wie * cos(L(i)); Wie * sin(L(i))];
    
    Wnen(:,i) = [- vN(i)/RN; vE(i)/RE; vE(i)*tan(L(i))/RN];
    
    Wnbn(:,i) = [cos(lamba(i))*dTetha(i) - sin(lamba(i))*dP(i)
                 dLamba(i) + sin(tetha(i))*dP(i)
                 sin(lamba(i))*dTetha(i) + cos(lamba(i))*dP(i)];
             
    Wbib(:,i) = eye(3) * C(P(i), tetha(i), lamba(i))*(Wnie(:,i) + Wnen(:,i));
    
    fn(:,i) = cross((2*Wnie(:,i) + Wnen(:,i)), [vN(i);vE(i);0]) - 9.8;
    fb(:,i) = [ acN(i); acE(i); 0] + C(P(i), tetha(i), lamba(i))*fn(:,i); 
    
   i = i + 1;
end