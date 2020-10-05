%Qi Luo
%A02274095
%Assignment6

%I 1
ball = imread('Ball.bmp');
hsvball = rgb2hsv(ball);
hball = hsvball(:,:,1);
sball = hsvball(:,:,2);
vball = hsvball(:,:,3);

ball1 = imclose(hball,strel('disk',2));
ball2 = imopen(ball1,strel('disk',2));
ball3=imdilate(ball2,strel('disk',5));
ball4=imerode(ball3,strel('disk',5));
ball5=imerode(ball4,strel('disk',5));
ball6=imbinarize(ball5,0.11);

figure;
subplot(1,3,1);
imshow(ball2);
title('After close-open');
subplot(1,3,2);
imshow(ball5);
title('After dialate-erode');
subplot(1,3,3);
imshow(ball6);
title('After creates a binary image with a threshhold');

[m,n]=find(ball6==0);
centrm=sum(m)/length(m);
centrn=sum(n)/length(n);
figure;
imshow(ball);
hold on;
plot(centrn,centrm,'+')
title('Original Image and Ball Center')
disp('----Finish Solving Problem I 1 ----');
pause;

%I 2
ball8=imbinarize(vball,0.4);
ball9=imopen(ball8,strel('disk',1));
ball10=imdilate(ball9,strel('square',2));

for i = 1:size(ball10,1)
    for j = 1:size(ball10,2)
        if ball10(i,j) == 0
            ball10(i,j) = 1;
        else 
            ball10(i,j) = 0;
        end
    end
end

ballclean = imclearborder(ball10);
pos = find(ballclean == 1);
vball(pos) = 1;

ballshadow(:,:,1)=hball;
ballshadow(:,:,2)=sball;
ballshadow(:,:,3)=vball;
rbgballshadow=hsv2rgb(ballshadow);

figure;
subplot(2,2,1);
imshow(ball8);
title('Binarize');
subplot(2,2,2);
imshow(ball9);
title('Open');
subplot(2,2,3);
imshow(ball10);
title('Dilate');
subplot(2,2,4);
imshow(ballclean);
title('Clean boarder');

figure;
imshow(rbgballshadow);
title('Hilight the shadow');
disp('----Finish Solving Problem I 2 ----');
pause;

%II 1
Elephant1=imread('Elephant1.jpg');
Elephant2=imread('Elephant2.jpg');
Horse1=imread('Horse1.jpg');
Horse2=imread('Horse2.jpg');

ElephantH1=CalNormalizedHSVHist(Elephant1,4,4,4);
ElephantH2=CalNormalizedHSVHist(Elephant2,4,4,4);
HorseH1=CalNormalizedHSVHist(Horse1,4,4,4);
HorseH2=CalNormalizedHSVHist(Horse2,4,4,4);

figure;
subplot(2,2,1);
bar(ElephantH1);
title('Histgram of Elephant1')
subplot(2,2,2);
bar(ElephantH2);
title('Histgram of Elephant2')
subplot(2,2,3);
bar(HorseH1);
title('Histgram of Horse1')
subplot(2,2,4);
bar(HorseH2);
title('Histgram of Horse2')
disp('----Finish Solving Problem II 1 ----');
pause;

%II 2
[rowE1,colE1] = size(Elephant1(:,:,1));
[rowE2,colE2] = size(Elephant2(:,:,1));
[rowH1,colH1] = size(Horse1(:,:,1));
[rowH2,colH2] = size(Horse2(:,:,1));

imSize1 = rowE1*colE1;
imSize2 = rowE2*colE2;
imSize3 = rowH1*colH1;
imSize4 = rowH2*colH2;

d1=zeros(1,4);
d1(1) = histintersection(ElephantH1,ElephantH1,imSize1,imSize1);
d1(2) = histintersection(ElephantH1,ElephantH2,imSize1,imSize2);
d1(3) = histintersection(ElephantH1,HorseH1,imSize1,imSize3);
d1(4) = histintersection(ElephantH1,HorseH2,imSize1,imSize4);
d1=sort(d1,'descend');
figure;
subplot(2,2,1);
imshow(Elephant1);
title(['Top Match - ',num2str(d1(1))]);
subplot(2,2,2);
imshow(Horse2);
title(['Second Match - ',num2str(d1(2))]);
subplot(2,2,3);
imshow(Horse1);
title(['Third Match - ',num2str(d1(3))]);
subplot(2,2,4);
imshow(Elephant2);
title(['Fourth Match - ',num2str(d1(4))]);

d2=zeros(1,4);
d2(1) = histintersection(ElephantH2,ElephantH1,imSize2,imSize1);
d2(2) = histintersection(ElephantH2,ElephantH2,imSize2,imSize2);
d2(3) = histintersection(ElephantH2,HorseH1,imSize2,imSize3);
d2(4) = histintersection(ElephantH2,HorseH2,imSize2,imSize4);
d2=sort(d2,'descend');
figure;
subplot(2,2,1);
imshow(Elephant2);
title(['Top Match - ',num2str(d2(1))]);
subplot(2,2,2);
imshow(Horse2);
title(['Second Match - ',num2str(d2(2))]);
subplot(2,2,3);
imshow(Elephant1);
title(['Third Match - ',num2str(d2(3))]);
subplot(2,2,4);
imshow(Horse1);
title(['Fourth Match - ',num2str(d2(4))]);

d3=zeros(1,4);
d3(1) = histintersection(HorseH1,ElephantH1,imSize3,imSize1);
d3(2) = histintersection(HorseH1,ElephantH2,imSize3,imSize2);
d3(3) = histintersection(HorseH1,HorseH1,imSize3,imSize3);
d3(4) = histintersection(HorseH1,HorseH2,imSize3,imSize4);
d3=sort(d3,'descend');
figure;
subplot(2,2,1);
imshow(Horse1);
title(['Top Match - ',num2str(d3(1))]);
subplot(2,2,2);
imshow(Horse2);
title(['Second Match - ',num2str(d3(2))]);
subplot(2,2,3);
imshow(Elephant1);
title(['Third Match - ',num2str(d3(3))]);
subplot(2,2,4);
imshow(Elephant2);
title(['Fourth Match - ',num2str(d3(4))]);

d4=zeros(1,4);
d4(1) = histintersection(HorseH2,ElephantH1,imSize4,imSize1);
d4(2) = histintersection(HorseH2,ElephantH2,imSize4,imSize2);
d4(3) = histintersection(HorseH2,HorseH1,imSize4,imSize3);
d4(4) = histintersection(HorseH2,HorseH2,imSize4,imSize4);
d4=sort(d4,'descend');
figure;
subplot(2,2,1);
imshow(Horse2);
title(['Top Match - ',num2str(d4(1))]);
subplot(2,2,2);
imshow(Elephant2);
title(['Second Match - ',num2str(d4(2))]);
subplot(2,2,3);
imshow(Horse1);
title(['Third Match - ',num2str(d4(3))]);
subplot(2,2,4);
imshow(Elephant1);
title(['Fourth Match - ',num2str(d4(4))]);

disp('----Finish Solving Problem II 2 ----');
pause;

%III 1
dwtmode('per');
lena = imread('Lena.jpg');
[C, S] = wavedec2(lena, 3, 'db9');
appLena = appcoef2(C, S, 'db9');
[row, col] = size(appLena);
B = round(rand(1, row*col));
C1 = WatermarkEmbed(C,B,30,row,col);
C2 = WatermarkEmbed(C,B,90,row,col);

lena1 = waverec2(C1,S,'db9');
lena2 = waverec2(C2,S,'db9');
lena1 = uint8(lena1);
lena2 = uint8(lena2);
diff1 = lena - lena1;
diff2 = lena - lena2;

figure;
subplot(1,3,1)
imshow(lena);
title('Original Lena')
subplot(1,3,2)
imshow(lena1)
title('Watermarked1 Lena')
subplot(1,3,3)
imshow(diff1,[])
title('Difference of Original and Watermarked when beta = 30')
figure;
subplot(1,3,1)
imshow(lena);
title('Original Lena')
subplot(1,3,2)
imshow(lena2)
title('Watermarked2 Lena')
subplot(1,3,3)
imshow(diff2,[])
title('Difference of Original and Watermarked when beta = 90')
disp('----Finish Solving Problem III 1 ----');
pause;

%III 2
W1 = WatermarkExtract(lena1,30);
W2 = WatermarkExtract(lena2,90);
result1 = 0;
result2 = 0;
for i = 1:row*col
    if B(i) == W1(i)
        result1 = result1 +1;
    end
    if B(i) == W2(i)
        result2 = result2 +1;
    end
end
percent1 = num2str((result1 / (row * col)) *100);
percent2 = num2str((result2 / (row * col)) *100);
if isequal(percent1,percent2)
    disp(['They are equal ',percent1,'% ',percent2,'%']);
else
    disp(['They are not equal ',percent1,'% ',percent2,'%']);
end
disp('----Finish Solving Problem III 2 ----');



