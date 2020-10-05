
%Qi Luo 
%A02274095
%Assignment2

food = imread('food.jpg'); 

% Problem 1:
range = [34 154];
[scaledFood,transFunc] = Scaling(food,range);

figure;
x = min(min(food)):1:max(max(food));
plot(x,transFunc); 
title('Transform Function from function Scaling')
xlabel('Old Intensity')
ylabel('New Intensity')
disp('----Finish Solving Problem 1 ----');
pause;

%problem 2:
matScaledFood = imadjust(food,[0.3 0.7]);

figure;
subplot(1,2,1);
imshow(scaledFood);
title('Function: Scaling');
subplot(1,2,2);
imshow(matScaledFood);
title('Matlab built-in function: imadjust');
disp('----Finish Solving Problem 2 ----');
pause;

%problem 3:

h1 = CallHist(scaledFood,1); %return normalized histogram
h2 = CallHist(scaledFood,2); %return histogram
h3 = CallHist(scaledFood,3); %return both

figure;
subplot(2,2,1)
bar(h1);
title('CalHist function:normalized histogram')
xlabel('Intensity Value')
ylabel('% of intensity value in the image')
subplot(2,2,2)
bar(h3{1,2});
title('CalHist function:both - normalized histogram')
xlabel('Intensity Value')
ylabel('% of intensity value in the image')
subplot(2,2,3)
bar(h2);
title('CalHist function:histogram')
xlabel('Intensity Value')
ylabel('Total of intensity value in the image')
subplot(2,2,4)
bar(h3{1,1});
title('CalHist function:both - histogram')
xlabel('Intensity Value')
ylabel('Total of intensity value in the image')
disp('----Finish Solving Problem 3 ----');
pause;

%problem 4:
tic;
[equalizedFood,tran]= HistEqualization(food);
a = toc;
disp('----Finish Solving Problem 4 ----');
pause;

%problem 5:
tic;
[T,J] = histeq(food);
b = toc;
figure;
subplot(1,2,1);
imshow(equalizedFood);
title('HistEqualization');
subplot(1,2,2);
imshow(T);
title('Matlab build-in function');

figure;
subplot(1,2,1);
plot(tran);
title('HistEqualization');
xlabel('Old Intensity')
ylabel('New Intensity')
subplot(1,2,2);
plot(J);
title('Matlab build-in function');
xlabel('Old Intensity')
ylabel('New Intensity')

disp('Comparison of the running times to accomplish the tasks:');
disp(a-b);

disp('Comparison of the histogram equalization transform functions:');
disp(sum(abs(tran - J)));

disp('the grayscale transformation T is the absolute value from the cumulative sum of hgram for all intensities k subtrack  cumulative histogram of A.')
disp('Also, T must be monotonic. ')
disp('----Finish Solving Problem 5 ----');
pause;

