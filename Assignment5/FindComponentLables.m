function [lableIm, num] = FindComponentLables(im,se)
    lableIm = zeros([size(im,1) size(im,2)]);
    num = 0;

    p = find(im==1);
    p = p(1);
    while (~isempty(p))
        num = num +1;
        p = p(1);
        X = false([size(im,1) size(im,2)]);
        X(p) = 1;
        Y = imdilate(X,se)&im;
        
        while (~isequal(X,Y))
            X = Y ;
            Y = imdilate(X,se)&im;
        end
        
        Pos = find(Y==1);
        im(Pos) = 0;
        lableIm(Pos) = num;
        p = find(im==1);
    end
end