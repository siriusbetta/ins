%The trajectory of moving flying object
clc;
clear;

%Initial parameters
%Re - Earth radius
%V0 - Velocity
%lat0 - Latitude
%long0 - Longitude
%h0 - height

Re = 6378140;
V0 = 100;
lat0 = 45;
long0 = 126;
h0 = 0;
psi0 = 15;%pith

%All angular parameters in radians
psi0_rad = rad(psi0);
lat_rad = rad(lat0);
long_rad = rad(long0);

wm = 50*pi/180;%diffetentation of gyro sig
dm = V0 / wm;
Ts = 0.1;
t1 = 5;
h = h0;
i = 1;
for t = Ts:Ts:t1
    Vn(:,i) = [V0 * sin(psi0_rad); V0 * cos(psi0_rad); 0];
    lat_rad = Vn(2,i)/(Re + h) * Ts + lat_rad;
    long_rad = Vn(1,i)/(Re + h)/cos(lat_rad)*Ts + long_rad;
    
	if lat_rad > pi/2
        lat_rad = pi - lat_rad
    end
	
	if long_rad > pi;
        long_rad = long_rad - 2*pi;
    end
    
    h = Vn(3,i)*Ts + h;
    position(:,i) = [lat_rad, long_rad, h];
    attitude(:,i) = [0, 0, psi0_rad];
    acceleration(:,i) = [0;0;0];
    wm_vector(:,i) = [0,0,0];
    i = i + 1;
end
psi = psi0_rad;

t2 = 200;

for t = (t1+Ts):Ts:(t1+t2)
    psi = psi + wm * Ts
    if psi >= 2*pi
        psi = psi - 2*pi;
    end
    
    if psi < 0
        psi = psi + 2*pi;
    end
    attitude(:,i) = [0;0;psi];
    wm_vector(:,i) = [0;0;-wm];
    V = dm*wm;
    Vn(:,i) = [V * sin(psi); V * cos(psi); 0];
    acceleration(:,i) = [V * wm * cos(psi); -V * wm * sin(psi); 0]; 
    lat_rad = Vn(2,i)/(Re + h) * Ts + lat_rad;
    long_rad = Vn(1,i)/(Re + h)/cos(lat_rad)*Ts + long_rad;
    if long_rad > pi;
        long_rad = long_rad - 2*pi;
    end
    if lat_rad > pi/2
        lat_rad = pi - lat_rad;
    end
    h = Vn(3,i)*Ts + h;
    position(:,i) = [lat_rad, long_rad, h];
    i = i + 1;
end


    