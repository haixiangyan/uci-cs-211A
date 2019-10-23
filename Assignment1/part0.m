img = double(imread('../images/flowergray.jpg'));
A = imresize(img,[100,100]);
%% a
x = sort(A(:));
figure("Name", "Vector x");
plot(x)

%% b
figure("Name", "Histogram of A?s intensities");
histogram(A,32);

%% c
t = 100;
binaryImage = imbinarize(A, t);
figure("Name", "Binary image A");
imshow(binaryImage)

%% d
meanIntensity = mean(mean(A));
Aprime = A - meanIntensity;
Aprime(Aprime < 0) = 0;

%% e
y = [1:8];
newY = reshape(y,[4,2]);

%% f
indexs = (1:2:99);
downImage = A(indexs,indexs);

%% g

filter1 = fspecial('gaussian',[3,3], 1);
image1 =  imfilter(A, filter1);
filter2 = fspecial('gaussian',[5,5], 10);
image2 =  imfilter(A, filter2);
filter3 = fspecial('gaussian',[13,13], 10);
image3 =  imfilter(A, filter3);

figure("Name", "Gaussian filter");

subplot(131)
imshow(image1,[])
title("Filter size [3,3], sigma 1");

subplot(132)
imshow(image2,[])
title("Filter size [5,5], sigma 5");

subplot(133)
imshow(image3,[])
title("Filter size [13,13], sigma 10");

%% h
% No changes, they are same
conImage1 = conv2(A, filter1, 'same');

figure("Name", "Conv vs imfilter");

subplot(121)
imshow(image1,[])
title("Imfilter");

subplot(122)
imshow(conImage1,[])
title("conv2");