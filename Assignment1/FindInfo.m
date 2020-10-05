%Qi Luo 
%A02274095
%Assignment1

function [maxValue, minValue, meanValue, medianValue] = FindInfo(oriIm)
    oriIm = oriIm(:);
    sortedoriIm = sort(oriIm);
    uniquesortedoriIm = unique(oriIm);
    maxValue = uniquesortedoriIm(length(uniquesortedoriIm));
    minValue = uniquesortedoriIm(1);
    meanValue = sum(oriIm) / length(oriIm);
    double(oriIm);
    if mod(length(oriIm),2) == 0
        index = length(oriIm)*0.5;
        medianValue = (sortedoriIm(index) +sortedoriIm(index+1))/2;
    else
        index = length(oriIm)*0.5 + 1;
        medianValue = sortedoriIm(index);
    end
    
end

        