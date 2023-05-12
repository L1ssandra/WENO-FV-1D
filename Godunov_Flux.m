function fhat = Godunov_Flux(uR,uL,fR,fL)

if uR > uL
    if uR < 0 || uL > 0
        fhat = min([fR,fL]);
    else
        fhat = 0;
    end
else
    fhat = max([fR,fL]);
end

end