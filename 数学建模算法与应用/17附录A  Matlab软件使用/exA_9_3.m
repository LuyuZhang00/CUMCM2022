x = @(u,v) u.*sin(v); 
y = @(u,v) -u.*cos(v); z = @(u,v) v;
fsurf(x, y, z,[-5 5 -5 -2],'--','EdgeColor','g'); hold on
fsurf(x, y, z,[-5 5 -2 2],'EdgeColor','none'), hold off

