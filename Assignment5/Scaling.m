%Qi Luo 
%A02274095
%Assignment2

function [scaledIm, transFunc] = Scaling(inputIm, range)
    if  range(2) < range(1) || range(2)> 255 || range(1)<0
        error('invalid data');
    else
        a = ((double(range(2)) - double(range(1)) )/ ((double(max(max(inputIm))) - double(min(min(inputIm))))));
        b = double(range(1)) - a * double(min(min(inputIm)));

        scaledIm = zeros(size(inputIm,1),size(inputIm,2));
        
        for i = 1:size(inputIm,1)
            for j = 1:size(inputIm,2)
                scaledIm(i,j) = a * double(inputIm(i,j)) + b ;  
            end
        end
        
        scaledIm = uint8(scaledIm);
        transFunc = unique(scaledIm(:));
    end
end