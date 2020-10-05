%Qi Luo 
%A02274095
%Assignment4

function [mag1, freq1,mag2,freq2,mag3,freq3,mag4,freq4] = MagAndFreq (image)
    sortImage = (unique(abs(image(:))))';
    
    mag1 = sortImage(1,size(sortImage,2)-1);
    [row,col] = find(abs(abs(image)-mag1) < 0.0001);
    freq1 = [row,col];
    
    mag2 = sortImage(1,size(sortImage,2)-2);
    [row,col] = find(abs(abs(image)-mag2) < 0.0001);
    freq2 = [row,col];
    
    mag3 = sortImage(1,size(sortImage,2)-3);
    [row,col] = find(abs(abs(image)-mag3) < 0.0001);
    freq3 = [row,col];
    
    mag4 = sortImage(1,size(sortImage,2)-4);
    [row,col] = find(abs(abs(image)-mag4) < 0.0001);
    freq4 = [row,col];

end