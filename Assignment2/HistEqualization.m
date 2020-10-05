%Qi Luo 
%A02274095
%Assignment2

function [enhancedIm, transFunc] = HistEqualization(inputIm)
     H = zeros(1,256);
     for i = 1:size(inputIm,1)
            for j = 1:size(inputIm,2)
                 indesity = inputIm(i,j);
                 H(indesity) = H(indesity) +1;
            end
     end

     T = zeros(1,256);
     sum = 0;
     for k = 1:length(H)
         sum = H(k) + sum;
         T(k) = double(sum) / double(size(inputIm,1) * size(inputIm,2)) ;
     end
     
     gk = double((256 - 1)) * T;
     enhancedIm = zeros(size(inputIm,1),size(inputIm,2));
     for i = 1:size(inputIm,1)
            for j = 1:size(inputIm,2)
                 indesity = inputIm(i,j);
                 enhancedIm(i,j) = gk(indesity);
            end
     end
     enhancedIm = uint8(enhancedIm);
     transFunc = T;
end