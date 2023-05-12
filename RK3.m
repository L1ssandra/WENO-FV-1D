% RK3.m

alpha = max(abs(uh));
dt = CFL*hx/alpha;
t = 0;

while t < tend
    
    if t + dt >= tend
        dt = tend - t;
        t = tend;
    else
        t = t + dt;
    end
    
    du = Lh(uh);
    uh1 = uh + dt*du;
    
    du = Lh(uh1);
    uh2 = (3/4)*uh + (1/4)*uh1 + (1/4)*dt*du;
    
    du = Lh(uh2);
    uh = (1/3)*uh + (2/3)*uh2 + (2/3)*dt*du;
    
    fprintf('%d  %d\n',t,max(abs(uh(:))))
     
end