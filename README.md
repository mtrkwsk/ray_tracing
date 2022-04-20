# ray_tracing
Simple 2D ray tracing approach in matlab

One of my first "science" projects.

The main script is **ray4.m**

One can define the reflective "planes" (lines in 2D) and rays to trace:
```matlab

% x1, y1, x2, y2
    PLANES = [];
    PLANES = newPlane( PLANES, -10, 10, 10, 10);
    PLANES = newPlane( PLANES, 10, 10, 10, -10);
    PLANES = newPlane( PLANES, -6, -4, -3, -4);
    %PLANES = newPlane( PLANES, -3, -4, -3, -6);

% ray_start_x, ray_start_y, ray_vect_x, ray_vect_y, ray_power
    RAYS = [];
    RAYS = newRay( RAYS, 1, 0, 2, 3, 100);
    RAYS = newRay( RAYS, 1, 0, 2, -1, 100);
```

Those rays are being emitted to the environment containing planes and the reflection+transmission behaviour is simulated:

![image](https://user-images.githubusercontent.com/26975498/164226431-8e15e3d6-ff49-4d14-ab02-2e909b4b8dc0.png)


The program can build a "power map" of the ray as well:

![image](https://user-images.githubusercontent.com/26975498/164226604-d3b1848b-af18-4bca-aa13-30cdefc80032.png)

And a little bit more complex case:

![image](https://user-images.githubusercontent.com/26975498/164226696-936439d0-1346-4357-9374-db0508fdfb75.png)

![image](https://user-images.githubusercontent.com/26975498/164226719-092d1334-e05f-4441-96aa-c4d0602d8d73.png)


