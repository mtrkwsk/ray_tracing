function [ PLANESw ] = newPlane( PLANES, x1, y1, x2, y2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
temp=0;
if (x1>x2 || y1>y2)
    temp=x1;
    x1=x2;
    x2=temp;
    temp=y1;
    y1=y2;
    y2=temp;
end

plane_vect_x = -(y2-y1); %WAZNE! zwrot wektora normalnego okresla powierzchnie "odbijalna"
plane_vect_y = x2-x1; %zmiana wktorow na normalne
plane_len = sqrt(plane_vect_x^2+plane_vect_y^2); %normalizacja
plane_vect_x = plane_vect_x /plane_len;
plane_vect_y = plane_vect_y /plane_len;

c = -(plane_vect_x*x1 + plane_vect_y*y1);

PLANESw=[PLANES; plane_vect_x, plane_vect_y, x1, y1, x2, y2];
hold on;
if(x1~=x2)
    if (x1<=x2)
        x=x1:x2;
    else
        x=x2:x1;
    end
   y = (-plane_vect_x/plane_vect_y).*x - (c/plane_vect_y)   ;
    plot(x, y,'b');
else
    if (y1<=y2)
        y=y1:y2;
    else
        y=y2:y1;
    end
    x=(-plane_vect_y/plane_vect_x).*y - (c/plane_vect_x);
    plot(x, y,'b');
end
    %rysowanie normalnych:
   % t2=0:2;
   % nplane_x_plot = y1 + t2*plane_vect_x;    
   % nplane_y_plot = x1 + t2*plane_vect_y;
   % plot(nplane_x_plot, nplane_y_plot,'g-');
end

