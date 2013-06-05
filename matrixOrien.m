clear;
t = 200;
dT = 0.1;

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
d = 0;
i = 2;
L(1) = rad(30);
l(1) = rad(60);
WieConstant = 7.2921151467 * 10^-5;
e = 0.00335281066475;

Re = 6378140;
for j = 1:dT:t-1
   An(i) = a;%-10*2*pi*5*sin(2*pi*5*i/180) * cos(rad(angle));
   Ae(i) = a;%-10*5*sin(5*i/180) * sin(rad(angle));
   A(:,i) = [An(i); Ae(i); 0];
   
   Vn(i) = Vn(i - 1) + An(i) * dT;%-10*(2*pi*5)^2*sin(2*pi*5*i/180) * cos(rad(angle));
   Ve(i) = Ve(i - 1) + Ae(i) * dT;%-10*(5)^2*sin(5*i/180) * sin(rad(angle));
   
   V(:, i) = [Vn(i); Ve(i); 0];
   L(i) = L(i - 1) + Vn(i)*dT/Re; 
   l(i) = l(i - 1) + Ve(i)*dT*sec(rad(L(i)))/Re;
   
   RN = Re*(1 - e^2)/(1 - e^2 * sin(L(i))^2)^(3/2);
   RE = Re/(1 - e^2 * sin(L(i))^2)^(1/2);
   
   Wnen(:,i) = [Ve(i)/RE; -Vn(i)/RE; -Ve(i) * tan(L(i))/ RN];
   Wnie(:,i) = [WieConstant * cos(L(i)); 0; -WieConstant * sin(L(i))];
   
   
   phi(i) = phi(1) + atan(Ve(i)/Vn(i));%sin(8*rad(j)); %phi(i - 1) + d;
   tetha(i) = tetha(i - 1)+ d;
   psi(i) = psi(i -1)+d;
   i= i+1;
end

wx(1) = 0;
wy(1) = 0;
wz(1) = 0;

i = 2;
w(:,1) = [wx(1); wy(1); wz(1)];
for j = 1:dT:t-1
   w(:,i) = [phi(i)-phi(i - 1); 0; 0] + C3(phi(i)) * [0; tetha(i) - tetha(i - 1); 0] + C3(phi(i)) * C2(tetha(i)) * [0; 0; psi(i) - psi(i - 1)];
   wx(i) = w(1, i);
   wy(i) = w(2, i);
   wz(i) = w(3, i);
   Wnbn(:,i) = [wx(i); wy(i); wz(i)];
   i = i + 1;
end

i = 1;
for j= 1:dT:t-1
   Wbib(:,i) = eye(3) * (C(phi(i), tetha(i), psi(i)) * (Wnie(:,i) + Wnen(:,i)) + Wnbn(:,i));
   i = i + 1;
end

i = 1;
for j = 1:dT:t-1
   fn(:,i) = A(:,i) + cross((2*Wnie(:,i) + Wnen(:,i)), V(:,i)) - [0;0;9.8];
   fb(:,i) = C(phi(i), tetha(i), psi(i)) * fn(:,i);
   i = i+1;
end

% txt = [fb];
% fid = fopen('D:\example.txt','w');
% fprintf(fid,'%f\n',txt);		%将矩阵y写入文件中，规定了写入格式
% fclose(fid);
Le = L;
le = l;
save('out.mat', 'Wbib', 'fb', 'Wnbn', 'Le', 'le');