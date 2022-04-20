function [ ray_start_x ray_start_y ray_vect_x ray_vect_y] = Odbicie( PLANES, ray_vect_x1, ray_vect_y1, inc_x, inc_y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

A = [ray_vect_x1 ray_vect_y1];
B = [PLANES(1,1) PLANES(1,2)];
C = A - B.*dot(A,B)*2;

ray_len = sqrt(C(1)^2 + C(2)^2); %normalizacja
ray_vect_x=C(1)/ray_len;
ray_vect_y=C(2)/ray_len;
ray_start_x = inc_x;
ray_start_y = inc_y;

end

