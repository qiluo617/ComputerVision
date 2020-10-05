%Qi Luo 
%A02274095
%Assignment1

function [blurredIm] = BlurImage(oriIm)
    if ndims(oriIm)==3 
        one = oriIm(:,:,1);
        two = oriIm(:,:,2);
        three = oriIm(:,:,3);
        
        onecal = cal(one);
        twocal = cal(two);
        threecal = cal(three);

        blurredIm = cat(3,onecal,twocal,threecal);
    else
        blurredIm = cal(oriIm);
    end

    
    function result = cal(im)
        rsize = size(im,1);
        csize = size(im,2);
        result = zeros(rsize,csize);
        for i = 1:2:rsize
            for j = 1:2:csize
            row = i;
            col = j;
            a=double(im(row,col));
            b=double(im(row+1,col));
            c=double(im(row,col+1));
            d=double(im(row+1,col+1));
            sum = double(a+b+c+d);
            avg= double(sum/4.0);
            result(row,col) = avg;
            result(row+1,col)= avg;
            result(row,col+1)= avg;
            result(row+1,col+1)= avg;
            end
        end
        result = uint8(result);
     end

end