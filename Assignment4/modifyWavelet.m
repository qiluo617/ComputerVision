%Qi Luo 
%A02274095
%Assignment4

function c = modifyWavelet(h,v,d)
    medianH = median(median(abs(h)));
    medianV = median(median(abs(v)));
    medianD = median(median(abs(d)));
    
    varH = medianH/0.6745;
    varV = medianV/0.6745;
    varD = medianD/0.6745;
    
    tH = sqrt(2*varH*log2(size(h,1)*size(h,2)));
    tV = sqrt(2*varV*log2(size(v,1)*size(v,2)));
    tD = sqrt(2*varD*log2(size(d,1)*size(d,2)));

    for i = 1:size(h,1)
        for j = 1:size(h,2)
            if h(i,j) >=tH
                h(i,j) =  h(i,j) - tH;
            elseif h(i,j) <= (-1)*tH
                h(i,j) =  h(i,j) + tH;
            elseif abs(h(i,j)) < tH
                h(i,j) = 0;
            end
        end
    end
    
    for i = 1:size(v,1)
        for j = 1:size(v,2)
            if v(i,j) >=tV
                v(i,j) =  v(i,j) - tV;
            elseif v(i,j) <= (-1)*tV
                v(i,j) =  v(i,j) + tV;
            elseif abs(v(i,j)) < tV
                v(i,j) = 0;
            end
        end
    end
    
    for i = 1:size(d,1)
        for j = 1:size(d,2)
            if d(i,j) >=tD
                d(i,j) =  d(i,j) - tD;
            elseif d(i,j) <= (-1)*tD
                d(i,j) =  d(i,j) + tD;
            elseif abs(d(i,j)) < tD
                d(i,j) = 0;
            end
        end
    end
    
    h = h(:);
    v = v(:);
    d = d(:);
    
    c = [h' v' d'];
end