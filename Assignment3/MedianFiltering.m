function filteredIm = MedianFiltering(im, mask)
    %mask odd number row and col and must be square 
    if size(mask,1) ~= size(mask,2) || mod(size(mask,1) ,2) ~= 1 || mod(size(mask,2) ,2) ~= 1
        msg = 'Invalid mask 1';
        error(msg);
    end
    for i = size(mask,1)
        for j = size(mask,2)
            if mask(i,j) <= 0
                msg = 'Invalid mask 3';
                error(msg);
            end
            if floor(mask(i,j))~=mask(i,j)
                msg = 'Invalid mask 4';
                error(msg);
            end
        end
    end
    if issymmetric(mask) == 0
        msg = 'Invalid mask 5';
        error(msg);
    end
    
    filteredIm = zeros(size(im,1), size(im,2));
   % use the filter on the image 
    paddingSize = floor(size(mask,1)*0.5);
    paddingCol = zeros(size(im,1),paddingSize);
    paddingRow = zeros(paddingSize,size(im,2)+2*paddingSize);
    padIm = [paddingCol im paddingCol];
    image = [padIm;paddingRow];
    paddingImage = [paddingRow;image];
    
    for i = 1: size(filteredIm,1)
        for j = 1:size(filteredIm,2)
            selected =paddingImage(i:i+size(mask,1)-1,j:j+size(mask,2)-1);
            result =[];
            for n = 1: size(mask,1)
                for m = 1:size(mask,2)
                   newNumber = selected(n,m);
                   for k = 1: mask(n,m)
                       result =[result newNumber];
                   end
                end
            end
  
            result = sort(result);
            
            if mod(size(result),2) == 0 %even size
                mid = length(result)*0.5;
                median = 0.5*( result(mid) + result(mid+1));
            else
                mid = floor(length(result)*0.5); %odd
                median = result(mid);  
            end
            
            filteredIm(i,j) = median;
        end
    end
    filteredIm = uint8(filteredIm);
end