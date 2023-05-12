% calculate_L2_Error.m
uhG = zeros(Nx,1);

for i = 1:Nx
    uhG(i,:) = uh(i);
end

main1;
ureal = u;
uE = abs(uh - ureal);
L2_Error = 0;

for i = 1:Nx
    L2_Error = L2_Error + hx*uE(i)^2;
%     for i1 = 1:NumGLP
%         L2_Error = L2_Error + hx1*weight(i1)*uE(i,i1)^2;
%     end
end
L2_Error = sqrt(L2_Error);