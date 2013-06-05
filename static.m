clear;
%time
t = 200;
deltaTetha = 0;
deltaLamba = 0;

dTetha(1) = rad(0);
dLamba(1) = rad(0);

dDeltaTetha = 0;
dDeltaLamba = 0;

L(1) = rad(45);
l(1) = rad(60);

v = 100;
angle = rad(30);
vN = v * sin(angle);
vE = v * cos(angle);

deltaP = 0;
dP = 0;

lamba(1) = rad(0);
tetha(1) = rad(0);
P(1) = rad(0);

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
        L(i) = L(i-1) + 0;
        l(i) = l(i-1) + 0;
        P(i) = P(i-1) + 0;
        dP(i) = dP(i-1) + 0;
        
        
        
    end
    Wnie(:,i) = [Wie * cos(L(i)); 0; Wie * sin(L(i))];
    
    Wnen(:,i) = [vE/RE; - vN/RN; -vE*tan(L(i))/RN];
    
    Wnbn(:,i) = [cos(lamba(i))*dTetha(i) - sin(lamba(i))*cos(tetha(i))*dP(i)
                 dLamba(i) + sin(tetha(i))*dP(i)
                 sin(lamba(i))*dTetha(i) + cos(lamba(i)) * cos(tetha(i))*dP(i)];
             
    Wbib(:,i) = eye(3) * C(P(i), tetha(i), lamba(i))*(Wnie(:,i) + Wnen(:,i)) + Wnbn(:, i);
    
    fn(:,i) = cross((2*Wnie(:,i) + Wnen(:,i)), [vE vN 0]) - 9.8;
    fb(:,i) = C(P(i), tetha(i), lamba(i))*fn(:,i); 
   i = i + 1;
end

