%Qi Luo 
%A02274095
%Assignment2

% int - 1: return normalized histogram
%       2: return histogram
%       3: return both 
function [output,varargout] = CallHist(inputIm, int)
     Imax = max(max(inputIm));
     H = zeros(1,Imax);
     for i = 1:size(inputIm,1)
            for j = 1:size(inputIm,2)
                 indesity = inputIm(i,j);
                 H(indesity) = H(indesity) +1;
            end
     end
     
     P = zeros(1,Imax);
     for k = 1:length(H)
         P(k) = double(H(k)) / double(size(inputIm,1) * size(inputIm,2)) ;
     end
       
     if int==1
         output = P;
         varargout{k} = output;
     end
     if int==2
         output = H;
         varargout{k} = output;
     end
     if int==3
         output=[{H},{P}];
         varargout{k} = output;
     end
     
end