%Qi Luo
%A02274095
%Assignment 5

%problem I 1
city = imread('City.jpg');
b = strel('square',3);
g = imdilate(city,b) - imerode(city,b);
figure;
imshow(g);

disp('----Finish Solving Problem I 1 ----');
pause;

% 2 
square = imread('SmallSquares.tif');
insquare = zeros(size(square,1),size(square,2));
for i = 1:size(square,1)
    for j = 1:size(square,2)
        if square(i,j) == 0
            insquare(i,j) = 1;
        else
            insquare(i,j) = 0;
        end
    end
end

foreground = strel([0,1,nan;0,nan,1;0,0,0]);
background = strel([1,0,nan;1,nan,0;1,1,1]);
bw1 = imerode(insquare,foreground);
bw2 = imdilate(square,background);
bw = bw1&bw2;

[scaledIm, transFunc] = Scaling(bw, [0,255]);
figure;
imshow(scaledIm);

sum = 0;
for i = 1:size(square,1)
    for j = 1:size(square,2)
        
       if i == 1 
           if j == 1 
               if square(1,2) == 1 && square(2,2) == 0 && square(2,1) == 0
                   sum = sum + 1;
               end
           elseif j == size(square,2)
               if square(1,j-1) == 0 && square(2,j-1) == 0 && square(2,j) == 0
                   sum = sum + 1;
               end
           else
               if square(1,j+1) == 1 && square(2,j+1) == 0 && square(2,j) == 0 && square(2,j-1) == 0 && square(1,j-1) == 0 
                   sum = sum + 1;
               end
           end
       elseif i == size(square,1)
           if j == 1 
               if square(i,1) == 1 && square(i-1,2) == 1 
                   sum = sum + 1;
               end
           elseif j == size(square,2)
               if square(i-1,j) == 1 && square(i-1,j-1) == 0 && square(i,j-1) == 0
                   sum = sum + 1;
               end
           else
               if square(i,j+1) == 1 && square(i-1,j) == 1 && square(i-1,j-1) == 0 && square(i,j-1) == 0 
                   sum = sum + 1;
               end
           end
       else
           if j == 1
               if square(i,j+1) == 1 && square(i-1,j) == 1 && square(i+1,j) == 0 && square(i+1,j+1) == 0 
                   sum = sum + 1;
               end
           elseif j == size(square,2)
               if square(i-1,j) == 1 && square(i-1,j-1) == 0 && square(i,j-1) == 0 && square(i+1,j-1) == 0 && square(i+1,j) == 0 
                   sum = sum + 1;
               end
           else
               if square(i,j+1) == 1 && square(i+1,j+1) == 0 && square(i+1,j) == 0 && square(i+1,j-1) == 0 && square(i,j-1) == 0 && square(i-1,j-1) == 0 && square(i-1,j) == 1
                   sum = sum + 1;
               end
           end
       end

    end
end
disp('The number of foreground pixels that satisfy:');disp(sum);

disp('----Finish Solving Problem I 2 ----');
pause;

% 3
bond = imread('Wirebond.tif');
se_b = strel('square',20);
bond_b = imerode(bond,se_b);

sec = strel('square',10);
bond_c = imerode(bond,sec);

sed = strel('square',40);
bond_d = imerode(bond,sed);

figure;
subplot(1,3,1);
imshow(bond_b);
title('Desired image 1');
subplot(1,3,2);
imshow(bond_c);
title('Desired image 2');
subplot(1,3,3);
imshow(bond_d);
title('Desired image 3');

disp('----Finish Solving Problem I 3 ----');
pause;

% 4
shape = imread('Shapes.tif');
shape_b = imopen(shape,strel('square',20));

shape_c = imclose(shape,strel('square',20));

shape_d = imdilate(imopen(shape,strel('square',20)),strel('square',20));

figure;
subplot(1,3,1);
imshow(shape_b);
title('Desired image 1');
subplot(1,3,2);
imshow(shape_c);
title('Desired image 2');
subplot(1,3,3);
imshow(shape_d);
title('Desired image 3');

disp('----Finish Solving Problem I 4 ----');
pause;

% 5
dowel = imread('Dowels.tif');
se_5 = strel('disk',5);
dowel_5_1 = imopen(imclose(dowel,strel('disk',5)),strel('disk',5));
dowel_5_2 = imclose(imopen(dowel,strel('disk',5)),strel('disk',5));

figure;
subplot(1,2,1);
imshow(dowel_5_1);
title('Open-Close');
subplot(1,2,2);
imshow(dowel_5_2);
title('Close-Open');

dowel_openclose = dowel;
for r = 2:20
    dowel_openclose = imopen(imclose(dowel_openclose,strel('disk',r)),strel('disk',r)); 
end

dowel_closeopen = dowel;
for r = 2:20
    dowel_closeopen = imclose(imopen(dowel_closeopen,strel('disk',r)),strel('disk',r)); 
end

figure;
subplot(1,2,1);
imshow(dowel_openclose);
title('Series Open-Close');
subplot(1,2,2);
imshow(dowel_closeopen);
title('Series Close-Open');

disp('----Finish Solving Problem I 5 ----');
pause;


%II 1
ball = imread('Ball.tif');
se = strel('square',3);

[lableIm, num] = FindComponentLables(ball,se);
disp('Total group:');disp(num);
scaledIm = colorScal(lableIm, num);
figure;
imshow(scaledIm);
title('Connect Components');

disp('----Finish Solving Problem II 1 ----');
pause;

% 2
cc = bwconncomp(ball);
number = getfield(cc,'NumObjects');
disp('Total group:');disp(number);
ccIm = zeros(getfield(cc,'ImageSize'));
pos = getfield(cc,'PixelIdxList');

for i=1:number
    index = pos{1,i};
    ccIm(index) = i;
end

ccscaledIm = colorScal(ccIm, number);
figure;
imshow(ccscaledIm);
title('Connect Components (Matlab Built-in Function)');

disp('----Finish Solving Problem II 2 ----');
pause;

% 3 
notBorder = num;
for i = [1,size(lableIm,1)]
    for j= 1:size(lableIm,2)
        if lableIm(i,j) ~= 0
            notBorder = notBorder - 1;
            pos = find(lableIm == lableIm(i,j));
            lableIm(pos) = 0;
        end
    end
end

for i = 1:size(lableIm,1)
    for j= [1,size(lableIm,2)]
        if lableIm(i,j) ~= 0
            notBorder = notBorder - 1;
            pos = find(lableIm == lableIm(i,j));
            lableIm(pos) = 0;
        end
    end
end
disp('Not on boader:');disp(notBorder);
figure;
subplot(1,2,1);
imshow(ball);
title('Original Image');
subplot(1,2,2);
imshow(lableIm);
title('Not on border');

disp('----Finish Solving Problem II 3 ----');
pause;

% 4 
ballclean = imclearborder(ball);
ccnot = bwconncomp(ballclean);
numberOn = getfield(ccnot,'NumObjects');
disp('Not on boader:');disp(numberOn);
figure;
subplot(1,2,1);
imshow(ball);
title('Original Image');
subplot(1,2,2);
imshow(ballclean);
title('Not on border (Matlab Built-in Function)');

disp('----Finish Solving Problem II 4 ----');
pause;

% 5
[centers,radii] = imfindcircles(ballclean,[1 256],'ObjectPolarity','bright');
% viscircles(centers,radii,'EdgeColor','b');
areaMin = floor(pi * min(radii) * min(radii));
areaMax = floor(pi * max(radii) * max(radii));

groupLeft = unique(lableIm);
nonoverlap = 0;
for i = groupLeft(2):groupLeft(length(groupLeft))
    pos = find(lableIm == i);
    area = length(pos);
    if area < areaMin || area > areaMax
        lableIm(pos) = 0;
    else
        nonoverlap = nonoverlap + 1;
    end
end
disp('Not on boader and non overlap:');disp(nonoverlap);
figure;
subplot(1,2,1);
imshow(ball);
title('Original Image');
subplot(1,2,2);
imshow(lableIm);
title('Not on boader and non overlap:');


disp('----Finish Solving Problem II 5 ----');
pause;

