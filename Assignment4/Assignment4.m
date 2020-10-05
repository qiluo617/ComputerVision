%Qi Luo 
%A02274095
%Assignment4

%problrm I 
%1
sample = imread('Sample.jpg');
fft_sample = fft2(sample);
fftshift_sample = fftshift(fft_sample);
Huv = zeros(size(fftshift_sample,1),size(fftshift_sample,2));
centerU = floor(size(fftshift_sample,1)/2 +1);
centerV = floor(size(fftshift_sample,2)/2 +1);
for u = 1:size(fftshift_sample,1)
    for v = 1:size(fftshift_sample,2)
        Huv(u,v) = exp(-(u-centerU)^2/(2*(75^2))-(v-centerV)^2/(2*(25^2)));
    end
end
filted_sample = fftshift_sample.*Huv;
inverse_sample = ifft2(ifftshift(filted_sample));
real_sample = real(inverse_sample);
result_sample = uint8(real_sample);
figure;
subplot(1,2,1);
imshow(sample);
title('Original Image');
subplot(1,2,2);
imshow(result_sample);
title('Gaussian low-pass filter');
disp('----Finish Solving Problem I 1 ----');
pause;

%2
fft_sample_high = fft2(sample);
fftshift_sample_high = fftshift(fft_sample_high);
Huv_high = zeros(size(fftshift_sample_high,1),size(fftshift_sample_high,2));
for u = 1:size(fftshift_sample_high,1)
    for v = 1:size(fftshift_sample_high,2)
        Huv_high(u,v) = 1/(1+(40/sqrt(((u-centerU)^2)+(v-centerV)^2))^4);
    end
end
filted_sample_high = fftshift_sample_high.*Huv_high;
inverse_sample_high = ifft2(ifftshift(filted_sample_high));
real_sample_high = real(inverse_sample_high);
result_sample_high = uint8(real_sample_high);
figure;
subplot(1,2,1);
imshow(sample);
title('Original Image');
subplot(1,2,2);
imshow(result_sample_high);
title('Butterworth high-pass filter');
disp('----Finish Solving Problem I 2 ----');
pause;

%problrm II
%1
city = imread('City.jpg');
fft_city = fft2(city);
fftshift_city = fftshift(fft_city);
Huv_city = zeros(size(fftshift_city,1),size(fftshift_city,2));
centerU = floor(size(fftshift_city,1)/2 +1);
centerV = floor(size(fftshift_city,2)/2 +1);
k = 0.0025;
for u = 1:size(fftshift_city,1)
    for v = 1:size(fftshift_city,2)
        Huv_city(u,v) = exp(-(k*sqrt(((u-centerU)^2)+(v-centerV)^2)^(5/3)));
    end
end
filted_city = fftshift_city.*Huv_city;
inverse_city = ifft2(ifftshift(filted_city));
real_city = real(inverse_city);
result_city = uint8(real_city);
imwrite(result_city,'BlurCity.bmp');
figure;
subplot(1,2,1);
imshow(Huv_city);
title('Filter H');
subplot(1,2,2);
imshow(result_city);
title('Filted City');
disp('----Finish Solving Problem II 1 ----');
pause;

%2 the image will not remove all the noise, but will a little bit clearer.
blurCity = imread('BlurCity.bmp');
g=25;
filted_blurCity = (1./Huv_city).*((abs(Huv_city))^2./((abs(Huv_city))^2+g)).*filted_city;
inverse_blurCity = ifft2(ifftshift(filted_blurCity));
restored_image = uint8(real(inverse_blurCity));
figure;
imshow(restored_image);
title('Wiener Filter');
disp('----Finish Solving Problem II 2 ----');
pause;

%problem III
% 1
capitol = imread('Capitol.jpg');
fft_capitol = fft2(capitol);
fftshift_capitol = fftshift(fft_capitol);

mag_sample = Scaling(log(abs(fftshift_sample)),[0 255]);
pha_sample = Scaling(wrapTo2Pi(angle(fftshift_sample)),[0 255]);

mag_capitol = Scaling(log(abs(fftshift_capitol)),[0,255]);
pha_capitol = Scaling(wrapTo2Pi(angle(fftshift_capitol)),[0,255]);

figure;
subplot(2,2,1);
imshow(mag_sample);
title('Magnitude of Sample');
subplot(2,2,2);
imshow(pha_sample);
title('Phase of Sample');
subplot(2,2,3);
imshow(mag_capitol);
title('Magnitude of Capitol');
subplot(2,2,4);
imshow(pha_capitol);
title('Phase of Capitol');
disp('----Finish Solving Problem III 1 ----');
pause;

%2
j = sqrt(-1);

% tan_s = atan(imag(fftshift_sample)./real(fftshift_sample));
% tan_c = atan(imag(fftshift_capitol)./real(fftshift_capitol));

tan_s = angle(fftshift_sample);
tan_c = angle(fftshift_capitol);

new_sample = abs(fftshift_capitol).*exp(j.*tan_s);
new_capitol = abs(fftshift_sample).*exp(j.*tan_c);

% new_sample = abs(fftshift_sample).*exp(j.*tan_c);
% new_capitol = abs(fftshift_capitol).*exp(j.*tan_s);

inverse_sample = ifft2(ifftshift(new_sample));
result_sample = uint8(real(inverse_sample));

inverse_capitol = ifft2(ifftshift(new_capitol));
result_capitol = uint8(real(inverse_capitol));

figure;
subplot(1,2,1);
imshow(result_sample);
title('new Sample image');
subplot(1,2,2);
imshow(result_capitol);
title('new Capitol image');

disp('----Finish Solving Problem III 2 ----');
pause;

%problem IV
%1
boy = imread('boy_noisy.gif');
ifft_boy = fftshift(fft2(boy));
center_boy = ifft_boy((floor(size(ifft_boy,1)/2 +1)),(floor(size(ifft_boy,2)/2 +1)));

disp('----Finish Solving Problem IV 1 ----');
pause;

%2
boy = imread('boy_noisy.gif');
ifft_boy = fftshift(fft2(boy));

[mag1, freq1, mag2, freq2 , mag3, freq3, mag4, freq4] = MagAndFreq(ifft_boy);

ifft_boy = replaceFreqAvg(ifft_boy,freq1);
ifft_boy = replaceFreqAvg(ifft_boy,freq2);
ifft_boy = replaceFreqAvg(ifft_boy,freq3);
image = replaceFreqAvg(ifft_boy,freq4);

image = ifft2(ifftshift(image));
image = uint8(real(image));
figure;
imshow(image);
title('Remove Additive Cosine Noise');
disp('----Finish Solving Problem IV 2 ----');
pause;

%Problem V 1
dwtmode('per');
lena = imread('Lena.jpg');
N = log2(size(lena,1));
[C,S] = wavedec2(lena,N,'db2');
result = waverec2(C,S,'db2');
result = uint8(round(result));

if lena==result
    disp('two images are equal');
else
    disp('two images are not equal');
end

disp('----Finish Solving Problem V 1 ----');
pause;

%2
x = floor(N/2);
[C2,S2] = wavedec2(lena,x,'db2');
%a
CA = appcoef2(C2,S2,'db2',x);
for i = 1:2:size(CA,1)
    for j = 1:2:size(CA,2)
        avg = (CA(i,j) + CA(i,j+1)+CA(i+1,j)+CA(i+1,j+1))/4;
        CA(i,j) = avg;
        CA(i,j+1) = avg;
        CA(i+1,j) = avg;
        CA(i+1,j+1) = avg;
    end
end
CA = CA(:);
C2(1:size(CA,1)) = CA';
outputA = waverec2(C2,S2,'db2');
outputA = uint8(round(outputA));
figure;
imshow(outputA);
disp('----Finish Solving Problem V 2(a) ----');
pause;

%b first level vertical 
x = floor(N/2);
[C3,S3] = wavedec2(lena,x,'db2');
v1 = detcoef2('v',C3,S3,1);
for i = 1:size(v1,1)
    for j = 1:size(v1,2)
        v1(i,j) = 0;
    end
end
v1 = v1(:);
endR = size(C3,2)-size(v1,1);
beginR = size(C3,2)-2*(size(v1,1));
C3(beginR+1:endR) = v1';
outputB = waverec2(C3,S3,'db2');
outputB = uint8(round(outputB));
figure;
imshow(outputB);
disp('----Finish Solving Problem V 2(b) ----');
pause;

%c second level horizontal
x = floor(N/2);
[C4,S4] = wavedec2(lena,x,'db2');
h2 = detcoef2('h',C4,S4,2);
for i = 1:size(h2,1)
    for j = 1:size(h2,2)
        h2(i,j) = 0;
    end
end
h2 = h2(:);
endR = size(C4,2)-size(h2,1)*2 - size(v1,1)*3;
beginR = size(C4,2)-size(h2,1)*3 - size(v1,1)*3;
C4(beginR+1:endR) = h2';
outputC = waverec2(C4,S4,'db2');
outputC = uint8(round(outputC));
figure;
imshow(outputC);
disp('----Finish Solving Problem V 2(c) ----');
pause;

%VI
lena = imread('Lena.jpg');
noise_lena = imnoise(lena,'gaussian');
[C5,S5] = wavedec2(noise_lena,3,'db2');
[H1,V1,D1] = detcoef2('all',C5,S5,1);
L1 = modifyWavelet(H1,V1,D1);
[H2,V2,D2] = detcoef2('all',C5,S5,2);
L2 = modifyWavelet(H2,V2,D2);
[H3,V3,D3] = detcoef2('all',C5,S5,3);
L3 = modifyWavelet(H3,V3,D3);
newC = [C5(1:S5(1,1)*S5(1,2)) L3 L2 L1];
outputD = waverec2(newC,S5,'db2');
outputD = uint8(round(outputD));

figure;
subplot(1,2,1);
imshow(noise_lena);
subplot(1,2,2);
imshow(outputD);
disp('----Finish Solving Problem VI ----');
pause;

