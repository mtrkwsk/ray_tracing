function [ ray_x, ray_y, POWERSw ] = Sledz(ray_start_x, ray_start_y, ray_vect_x, ray_vect_y, ray_power, POWERS, t)

ray_x = ray_start_x + t*ray_vect_x;
ray_y = ray_start_y + t*ray_vect_y;


[m,n]=ZaokP(ray_x, ray_y, 0.5);

if(ray_power>POWERS(n,m))
    POWERS(n,m) = ray_power;
    POWERSw = POWERS;
else
    POWERSw = POWERS;
end

end

