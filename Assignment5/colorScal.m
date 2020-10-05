function RGBIm = colorScal(lableIm, num)
    RGBIm = zeros([size(lableIm,1) size(lableIm,2) 3]);
    R = zeros([size(lableIm,1) size(lableIm,2)]);
    G = zeros([size(lableIm,1) size(lableIm,2)]);
    B = zeros([size(lableIm,1) size(lableIm,2)]);
    
    U = 64;
    V = 255;
    W = 128;
    
    for i = 1:num
        pos = find(lableIm == i);
        R(pos) = mod(i,2)*V;
        G(pos) = mod(i,5)*U;
        B(pos) = mod(i,3)*W;
    end
   
    RGBIm(:,:,1) = R;
    RGBIm(:,:,2) = G;
    RGBIm(:,:,3) = B;
    RGBIm = uint8(RGBIm);
end