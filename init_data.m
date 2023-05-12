% init_data.m
global bcL bcR hx hx1

%----------------
xa = -pi;
xb = pi;
u0 = @(x) 0.5 + sin(x);
bcL = 1;
bcR = 1;
tend = 1.5;
%----------------

hx = (xb - xa)/Nx;
hx1 = 0.5*hx;

Xc = xa + hx1:hx:xb - hx1;

uh = zeros(1,Nx);

for i = 1:Nx
    for i1 = 1:NumGLP
        uh(i) = uh(i) + 0.5*weight(i1)*u0(Xc(i) + hx1*lambda(i1));
    end
end