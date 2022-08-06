subplot(121), fimplicit3(@(x,y,z)x.^2/9+y.^2/4+z.^2/6-1)
subplot(122), ellipsoid(0,0,0,3,2,sqrt(6))
