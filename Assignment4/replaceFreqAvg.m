%Qi Luo 
%A02274095
%Assignment4

function image = replaceFreqAvg(image,location)
    i = location(1,1);
    j = location(1,2);
    
    total = image(i-1,j-1) + image(i-1,j) + image(i-1,j+1) + image(i,j-1) + image(i,j+1) + image(i+1,j-1) + image(i+1,j) + image(i+1,j+1);
    image(i,j) = total/8.0;
    
    i = location(2,1);
    j = location(2,2);
    
    total = image(i-1,j-1) + image(i-1,j) + image(i-1,j+1) + image(i,j-1) + image(i,j+1) + image(i+1,j-1) + image(i+1,j) + image(i+1,j+1);
    image(i,j) = total/8.0;
end
