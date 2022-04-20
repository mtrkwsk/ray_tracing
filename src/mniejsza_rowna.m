function [ l ] = mniejsza_rowna(x, y)
tsh=0.01;

if ( abs(x-y)<=tsh )
    l = 1;
    return
elseif (x-y<0)
    l = 1;
    return
else
    l =0;
    return
end

end

