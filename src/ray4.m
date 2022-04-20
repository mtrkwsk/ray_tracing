path(path,'fun');
clc;
clearvars;
%kwant czasu
dt = 0.1;
tmax=300;

%srodowisko graficzne:
    stem3(0,0,0,'fill')
    hold on;
    view(2);
    grid on;
    axis square

% x1, y1, x2, y2
    PLANES = [];
    PLANES = newPlane( PLANES, -10, 10, 10, 10);
    PLANES = newPlane( PLANES, 10, 10, 10, -10);
    PLANES = newPlane( PLANES, 10, -10, -10, -10);
    PLANES = newPlane( PLANES, -10, -10, -10, 10);
    PLANES = newPlane( PLANES, 4, 2, 3, 7);
    %PLANES = newPlane( PLANES, -4, 1, -3, 7);
    PLANES = newPlane( PLANES, -6, -6, -3, -6);
    PLANES = newPlane( PLANES, -6, -6, -6, -4);
    PLANES = newPlane( PLANES, -6, -4, -3, -4);
    %PLANES = newPlane( PLANES, -3, -4, -3, -6);

% ray_start_x, ray_start_y, ray_vect_x, ray_vect_y, ray_power
    RAYS = [];
    RAYS = newRay( RAYS, 1, 0, 2, 3, 100);
    RAYS = newRay( RAYS, 1, 0, 2, -1, 100);
    RAYS = newRay( RAYS, 1, 0, -2, 5, 100);
    RAYS = newRay( RAYS, 1, 0, 2, 4, 100);
    RAYS = newRay( RAYS, 1, 0, 2, 3, 100);
    RAYS = newRay( RAYS, 1, 0, 2, -4, 100);
    RAYS = newRay( RAYS, 1, 0, -2, -4, 100);
    RAYS = newRay( RAYS, 1, 0, -4, -4, 100);

i_rays =size(RAYS, 1);

% moce
    POWERS = zeros(42,42);
    %disp(POWERS);

%%%%%% tu zaczyna sie algorytm sledzenia
for k=1:100
    
    %sprawdzenie czy wszystkie promienie sa juz wykorzystane:
    if (k>i_rays)
        break
    end
    
    %wyrysowanie punktu startowego:
    plot(RAYS(k,1),RAYS(k,2),'r o');
    
    %przypisanie pozycji startowej:
    ray_x = RAYS(k,1);
    ray_y = RAYS(k,2);

    %poszukiwanie miejsca interakcji i ustawienia tablicy PLANES:
    [inc_x, inc_y, PLANES] = findInc(RAYS(k,1), RAYS(k,2), RAYS(k,3), RAYS(k,4), PLANES);

    %reset czasu lokalnego promieni:
    j=0;

    
    for t = 1:dt:tmax
        %czas lokalny promienia:
        j=j+dt;
        
        %tlumienie wolnej przestrzeni:
        RAYS(k,5)=RAYS(k,5)*0.999;
        
        %warunek mocowy:
        if RAYS(k,5) < 10
            disp('ostatnia moc:');
            disp(RAYS(k,5));
            break
        end
        
        if (check_inc(ray_x, ray_y, inc_x, inc_y, 0.15)==1)  
            %disp('wykryto kolizje');
            
            %utworzenie nowego promienia do analizy z odpowiednio mniejsza moca
            %(do zrobienia-powinna zalezec od plaszczyzny)
            RAYS = newRay( RAYS, inc_x, inc_y, RAYS(k,3), RAYS(k,4), RAYS(k,5)-30);
    
            % wyliczenie promienia odbitego
            [RAYS(k,1) RAYS(k,2) RAYS(k,3) RAYS(k,4)] = Odbicie(PLANES, RAYS(k,3), RAYS(k,4), inc_x, inc_y);
          
    
            %tutaj juz mamy nowy, odbity promien, szukamy dla niego miejsce
            %kolejnego odbicia i ustawiamy tablice PLANES
            [inc_x, inc_y, PLANES]=findInc(RAYS(k,1), RAYS(k,2), RAYS(k,3), RAYS(k,4), PLANES);
            
            %jesli wykryto za dluga droge promienia (lub inny blad)-koniec
            %sledzenia tego promienia. Zabezpieczenie przed rogami i
            %promieniami transmitowanymi poza pomieszczenie
            if(inc_x==RAYS(k,1))
                disp('wykryto zbyt duza odleglosc!');
                break
            end
    
            j=0; %reset czasu lokalnego        
    
        end
    
        %ruch promienia
        [ray_x, ray_y, POWERS] = Sledz(RAYS(k,1), RAYS(k,2), RAYS(k,3), RAYS(k,4), RAYS(k,5), POWERS, j);
        color_g= 1 - (RAYS(k,5)-10)/(100-10);
        color_r= (RAYS(k,5)-10)/(100-10);
        hold all
    
        %rysowanie mocy:    
        %rysowanie promieni:
        plot3(ray_x, ray_y, 100, 'Color',[color_r color_g 0], 'LineStyle','--'); 
        %rysowanie pktow przeciecia:
        plot(inc_x,inc_y, 'black+');
    end

    i_rays =size(RAYS, 1); 

end


disp(size(POWERS));
X=-10:0.5:10.5;
disp(size(X));
Y=-10:0.5:10.5;

contourf(X,Y,POWERS);



