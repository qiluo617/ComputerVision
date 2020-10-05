function hist = CalNormalizedHSVHist (im, hBinNum, sBinNum, vBinNum)
    im=rgb2hsv(im);
    imh = im(:,:,1);
    ims = im(:,:,2);
    imv = im(:,:,3);
    
    [m, n, s] = size(im);
    
    temp(:,:,1) = floor(imh.*hBinNum);
    temp(:,:,2) = floor(ims.*sBinNum);
    temp(:,:,3) = floor(imv.*vBinNum);
    
    hist = zeros(hBinNum, sBinNum, vBinNum);
    cur = zeros(1,3);
    
    for i = 1:m  
        for j = 1:n 
            for k = 1:s        
                if (temp(i,j,k)==4)
                    temp(i,j,k)=3;
                end
                cur(1,k) = temp(i,j,k);
            end
         hist(cur(1,1)+1,cur(1,2)+1,cur(1,3)+1) = hist(cur(1,1)+1,cur(1,2)+1,cur(1,3)+1) + 1;
        end
    end
    
    hist = hist(:) / (m*n);
    
end