function [ int ] = check_inc( ray_x, ray_y, inc_x, inc_y, inc_tsh )

odl = sqrt((ray_x-inc_x)^2 + (ray_y - inc_y)^2);

if (odl < inc_tsh)
    
    int=1;

else
    
    int=0;
    
end


end

