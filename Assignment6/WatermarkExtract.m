function result = WatermarkExtract( im, beta )
    [C,S] = wavedec2(im,3,'db9');
    imsize = S(1,1)*S(1,2);
    result = zeros(1,imsize);
    temp = zeros(S(1,1),S(1,2));
    temp(:) = C(1:imsize);
    temp=temp';
    
    for i = 1:imsize
        if mod(temp(i),beta) > beta/2
            result(i) = 1;
        end
    end
end
