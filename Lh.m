function du = Lh(uh)
global Nx bcL bcR hx
uhb = [[0,0,0],uh,[0,0,0]];
uL = zeros(Nx + 1,1);
uR = zeros(Nx + 1,1);
fR = zeros(Nx + 1,1);
fL = zeros(Nx + 1,1);
fhat = zeros(Nx + 1,1);
du = zeros(1,Nx);

% set_bc
if bcL == 1
    uhb(1:3) = uh(end - 2:end);
end

if bcR == 1
    uhb(end - 2:end) = uh(1:3);
end

for i = 1:Nx + 1
    uL(i) = WENO5(uhb(i),uhb(i + 1),uhb(i + 2),uhb(i + 3),uhb(i + 4));
    uR(i) = WENO5(uhb(i + 5),uhb(i + 4),uhb(i + 3),uhb(i + 2),uhb(i + 1));
end

for i = 1:Nx + 1
    fR(i) = f(uR(i));
    fL(i) = f(uL(i));
end

for i = 1:Nx + 1
    alpha = max([abs(uR(i)),abs(uL(i))]);
    fhat(i) = LF_Flux(uR(i),uL(i),fR(i),fL(i),alpha);
end

for i = 1:Nx
    du(i) = -(1/hx)*(fhat(i + 1) - fhat(i));
end

