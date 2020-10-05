function score = histintersection(hist1,hist2,imSize1,imSize2)
    score = 0;
    histL = length(hist1);
    
    for i = 1:histL
        if hist1(i)*imSize1 > hist2(i)*imSize2
            score = score + hist2(i)*imSize2;
        else
            score = score + hist1(i)*imSize1;
        end
    end

    score = score / min(imSize1,imSize2);

end