function [filteredIm] = AverageFiltering(im,mask)
    %mask odd number row and col and must be square 
    if size(mask,1) ~= size(mask,2) || mod(size(mask,1) ,2) ~= 1 || mod(size(mask,2) ,2) ~= 1
        msg = 'Invalid mask 1';
        error(msg);
    end
    %three properties
    if sum(sum(mask)) ~= 1 
        msg = 'Invalid mask 2';
        error(msg);
    end
    for i = size(mask,1)
        for j = size(mask,2)
            if mask(i,j) <= 0 
                msg = 'Invalid mask 3';
                error(msg);
            end
        end
    end
    if issymmetric(mask) == 0
        msg = 'Invalid mask 4';
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
    paddingImage = double(paddingImage);
    for i = 1: size(filteredIm,1)
        for j = 1:size(filteredIm,2)
            selected =paddingImage(i:i+size(mask,1)-1,j:j+size(mask,2)-1);
            filteredIm(i,j) = sum(sum(selected.*mask));
        end
    end
    filteredIm = uint8(filteredIm);
end