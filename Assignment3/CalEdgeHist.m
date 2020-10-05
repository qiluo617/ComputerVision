function edgeHist = CalEdgeHist(im, bin) 
    [BW,~,Gv,Gh] = edge(im,'Sobel');
    edgeHist = zeros(1,bin+1);
    for i=1:size(im,1)
        for j = 1:size(im,2)
            %rad = myatan(Gh(i,j),Gv(i,j));
            rad =mod(atan2(Gh(i,j),Gv(i,j)),2*pi);
            angle = rad2deg(rad);
            edgeHist(fix(angle/(360/bin))+1) = edgeHist(fix(angle/(360/bin))+1)+1;
        end
    end
    figure;
    subplot(1,3,1);
    imshow(im);
    title('Original Image');
    subplot(1,3,2);
    imshow(BW);
    title('Image with the important edges');
    subplot(1,3,3);
    bar(edgeHist);
    title('The edge histogram ');
end