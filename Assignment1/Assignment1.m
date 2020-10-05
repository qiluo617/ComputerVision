%Qi Luo 
%A02274095
%Assignment1

%problem 1:
A = imread('peppers.bmp');
figure('name','RGB Original Image');
imshow(A);
w1 = waitforbuttonpress;
if w1 == 1
    disp('----Finish Solving Problem 1 ----');
end

%problem 2:
B = rgb2gray(A);
TB = transpose(B);

lengthB = size(B,1);
len = 0.5*lengthB;
upperhalf = B(1:len,:);
lowerhalf = B(len+1:lengthB,:);
HB = [lowerhalf;upperhalf];

FB = flip(B,2);

figure;
subplot(2,2,1);
imshow(B);
title('B');
subplot(2,2,2);
imshow(TB);
title('TB');
subplot(2,2,3);
imshow(HB);
title('HB');
subplot(2,2,4);
imshow(FB);
title('FB');

w2 = waitforbuttonpress;
if w2 == 1
    disp('----Finish Solving Problem 2 ----');
end


%problem 3:
[maxV, minV, meanV, medianV] = FindInfo(B); 
arrayB = B(:);
if maxV == max(arrayB)
    disp('Matlab built-in functions max same as FindInfo max');
end
if minV == min(arrayB)
    disp('Matlab built-in functions min same as FindInfo min');
end
if meanV == mean(arrayB)
    disp('Matlab built-in functions mean same as FindInfo mean');
end
if medianV == median(arrayB)
    disp('Matlab built-in functions median same as FindInfo median');
end

w3 = waitforbuttonpress;
if w3 == 1
    disp('----Finish Solving Problem 3 ----');
end

%problem 4:
C = double(B) / double(maxV) ; 
figure;
imshow(C);
title('Normalized Grayscale Image');

colLength = size(B,2);
doubleB = double(B);
D = [B(:,1:colLength*0.25),doubleB(:,colLength*0.25:colLength*0.5).^1.25,B(:,colLength*0.5:colLength*0.75),doubleB(:,colLength*0.75:colLength).^0.75];
figure;
imshow(D);
title('Processed Grayscale Image');
imwrite(D,'Qi_D.jpg');

w4 = waitforbuttonpress;
if w4 ==  1
    disp('----Finish Solving Problem 4 ----');
end


%problem 5
bw1 = C;
k = find(bw1 >= 0.3);
j = find(bw1 < 0.3); 
bw1(k) = 1;
bw1(j) = 0;

bw2 = (C >= 0.3);

bw3 = imbinarize(C,0.3);

if isequal(bw1,bw3)
    if isequal(bw2,bw3)
        disp('Both of my methods worked.');
    else
        disp('My method 1 worked but not my method 2.');
    end
else 
    if isequal(bw2,bw3)
        disp('My method 2 worked but not my method 1.');
    else
        disp('Both of my two methods did not work.');
    end
end

figure;
subplot(1,3,1);
imshow(bw1);
title('my first method');
subplot(1,3,2);
imshow(bw2);
title('my second method');
subplot(1,3,3);
imshow(bw3);
title('matlab method');

w5 = waitforbuttonpress;
if w ==  1
    disp('----Finish Solving Problem 5 ----');
end


%problem 6
BA = BlurImage(A);
BB = BlurImage(B);
figure;
subplot(2,2,1);
imshow(A);
title('A');
subplot(2,2,2);
imshow(B);
title('B');
subplot(2,2,3);
imshow(BA);
title('BA');
subplot(2,2,4);
imshow(BB);
title('BB');

w6 = waitforbuttonpress;
if w6 ==  1
    disp('----Finish Solving Problem 6 ----');
end

%problem 7
close all;
clear;


