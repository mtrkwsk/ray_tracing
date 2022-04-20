function [ RAYSw ] = newRay( RAYS, ray_start_x, ray_start_y, ray_vect_x, ray_vect_y, ray_power )

%opis promienia (pkt poczatkowy, wektor kierunkowy)
ray_len = sqrt(ray_vect_x^2 + ray_vect_y^2); %normalizacja
ray_vect_x=ray_vect_x/ray_len;
ray_vect_y=ray_vect_y/ray_len;

RAYSw=[RAYS; ray_start_x ray_start_y ray_vect_x ray_vect_y ray_power];

end

