function [ inc_x, inc_y, PLANESw ] = findInc(ray_start_x, ray_start_y, ray_vect_x, ray_vect_y, PLANES)
i=0;
FAR=[];


for k=1:size(PLANES)
    x1=PLANES(k,3);
    x2=PLANES(k,5);
    y1=PLANES(k,4);
    y2=PLANES(k,6);
    s =  ( (-(PLANES(k,1)*ray_start_x + PLANES(k,2)*ray_start_y) + (PLANES(k,3)*PLANES(k,1)+PLANES(k,4)*PLANES(k,2))))/(ray_vect_y*PLANES(k,2)+ray_vect_x*PLANES(k,1));
    inc_x=ray_start_x + s*ray_vect_x;
    inc_y=ray_start_y + s*ray_vect_y;
    if ~(   mniejsza_rowna(min([x1 x2]), inc_x) && mniejsza_rowna(inc_x, max([x1 x2])) && mniejsza_rowna(min([y1 y2]), inc_y) && mniejsza_rowna(inc_y, max([y1 y2]))  )

        %display('WYKRYTO BLEDNE PRZECIECIE!!!!');
        FAR(k)=0;
    else
        FAR(k)=s;
    end
end;



if (any(FAR==FAR))
end

FAR(FAR<0.1) = 999; % odleglosc od plaszczyzny od ktorej prom juz sie odbil


[s,i] = min(abs(FAR));


if (s>100)
    inc_x = ray_start_x;
    inc_y = ray_start_y;
    PLANESw=PLANES;
    return
end

%punkty przeciecia:
inc_x=ray_start_x + s*ray_vect_x;
inc_y=ray_start_y + s*ray_vect_y;




if (i~=1)
    PLANES([1 i],:) = PLANES([i 1],:);
    PLANESw = PLANES;
else
    PLANESw = PLANES;

end



end


