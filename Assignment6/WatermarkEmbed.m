function result = WatermarkEmbed(H,b,beta,row, col )
    temp = zeros(row,col);
    temp(:) = H(1:row*col);
    htemp=temp';
    result=H;
    
    for i = 1:row*col
        if b(i) == 1
            if mod(htemp(i),beta) >= 0.25*beta
               htemp(i) = htemp(i) - mod(htemp(i),beta) + 0.75*beta;
            else
               htemp(i) = htemp(i) - 0.25*beta - mod(htemp(i) - 0.25*beta, beta) + 0.75*beta;
            end
        else
            if mod(htemp(i),beta) <= 0.75*beta
               htemp(i) = htemp(i) - mod(htemp(i),beta) + 0.25*beta;
            else
               htemp(i) = htemp(i) - 0.5*beta - mod(htemp(i) - 0.5*beta, beta) + 0.25*beta;
            end
        end
    end
    
    wateredCTemp=htemp';
    result(1:row*col)=wateredCTemp(:)';
end