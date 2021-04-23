clear all
close all
clc
img = imread('plcas1.jpeg');
imshow(img);
thresh = ones(1,2);
    imgGray = rgb2gray(img);
    figure(2),imshow(imgGray);

imgGray = wiener2(imgGray, [9 9]);
Ms = fspecial('gaussian' ,[13, 13],2);
surf(Ms);
imgCanny =imfilter(imgGray, Ms);
imgCanny = edge(imgCanny,'canny');
figure(3),imshow(imgCanny);

    imgw =edge(imgGray,'Canny');
    SE =strel(1);

    imgw = imdilate(imgw, SE);
    [h, theta, rho]= hough(imgw, 'RhoResolution',1, 'ThetaResolution',0.1);
    peaks= houghpeaks(V, 1);
    lines = houghlines(imgw, theta, rho, peaks);
figure(4), imshow(imgw'),hold on
for k = 1:length(lines)
       xy = [lines(k).point1 ; lines(k).point2];
       plot(xy(:,2), xy(:,1),'linewidth',4,'color',[1 0 0]);
end
