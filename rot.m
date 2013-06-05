function out = rot(angle, N)
%N must be vector 3*1
n = N;
nx = [0 -n(3) n(2); n(3) 0 -n(1); -n(2) n(1) 0];
out = (1 - cos(angle)) * n * n' + cos(angle)*eye(3) + sin(angle)*nx;
end