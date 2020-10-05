%Qi Luo 
%A02274095
%Assignment3

% Problem 1.1:
circuit = imread('Circuit.jpg');
weightedFilter = (1/16)*[1,2,1;2,4,2;1,2,1];
standardFilter = (1/25)*ones(5,5);
circuit_wighted = AverageFiltering(circuit,weightedFilter);
circuit_standard = AverageFiltering(circuit,standardFilter);
figure;
subplot(1,3,1);
imshow(circuit);
title('Original Image');
subplot(1,3,2);
imshow(circuit_wighted);
title('Weighted 3×3 averaging filter');
subplot(1,3,3);
imshow(circuit_standard);
title('Standard 5×5 averaging filter');
disp('----Finish Solving Problem 1.1 ----');
pause;

% Problem 1.2:
median_weightedFilter = [1  2  1 ; 2  4  2;  1  2  1];
median_standardFilter = ones(5,5);
median_wighted = MedianFiltering(circuit,median_weightedFilter);
median_standard = MedianFiltering(circuit,median_standardFilter);
figure;
subplot(1,3,1);
imshow(circuit);
title('Original Image');
subplot(1,3,2);
imshow(median_wighted);
title('Weighted 3×3 median filter');
subplot(1,3,3);
imshow(median_standard);
title('Standard 5×5 median filter');
disp('----Finish Solving Problem 1.2 ----');
pause;

% Problem 1.3:
moon = imread('Moon.jpg');
strong_Laplacian = fspecial('laplacian',0.5); 
FilteredImage  = imfilter(moon,strong_Laplacian);
ScaledFilteredImage = imadjust(FilteredImage,[0 1]);
EnhancedImage = moon - FilteredImage;

for i = 1:size(FilteredImage,1)
    for j = 1:size(FilteredImage,2)
        if FilteredImage(i,j) > 255
            FilteredImage(i,j) = 255;
        end
        if FilteredImage(i,j) < 0
            FilteredImage(i,j) = 0;
        end
    end
end
figure;
subplot(1,4,1);
imshow(moon);
title('Original Image');
subplot(1,4,2);
imshow(FilteredImage);
title('Filtered Image');
subplot(1,4,3);
imshow(ScaledFilteredImage);
title('Scaled Filtered Image');
subplot(1,4,4);
imshow(EnhancedImage);
title('Enhanced Image');
disp('----Finish Solving Problem 1.3 ----');
pause;

% Problem 2.1:
rice = imread('Rice.jpg');
[BW,threshOut]  = edge(rice,'Sobel');
disp(threshOut);
largeTh = edge(rice,'Sobel',0.9);
smallTh = edge(rice,'Sobel',0.001);
% mag = |image*Gx |(horizontal) + |image*Gy |(vertical)   
%meg >threshold

% figure;
% subplot(1,4,1);
% imshow(rice);
% title('Original Image');
% subplot(1,4,2);
% imshow(BW);
% title('found by build in function');
% subplot(1,4,3);
% imshow(largeTh);
% title('largeTh');
% subplot(1,4,4);
imshow(smallTh);
% title('smallTh');

disp('The lower the threshold, the more edges will be detected,and the result will be increasingly susceptible to noise and detecting edges of irrelevant features in the image. Conversely a high threshold may miss subtle edges, or result in fragmented edges.');
disp('----Finish Solving Problem 2.1 ----');
pause;

% Problem 2.2:
hist = CalEdgeHist(rice,18);
disp('----Finish Solving Problem 2.2 ----');
pause;

% Problem 3:
text = imread('Text.gif');
test = fft(text);

figure;
subplot(1,2,1);
imshow(text);
subplot(1,2,2);
imshow(test);



