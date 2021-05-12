clear all;close all;clc
img = imread('plcas1.jpeg');
imshow(img);
thresh = ones(1,2);
    imgGray = rgb2gray(img);
    figure(2),imshow(imgGray);
mascaragauissiana =fspecial('gaussian',[12,12],2);
imgCanny =imfilter(imgGray,mascaragauissiana);
imgCanny = edge(imgCanny,'canny');
figure(3),imshow(imgCanny);

    [h, theta, rho]= hough(imgCanny, 'RhoResolution',3, 'ThetaResolution',0.1);
    peaks= houghpeaks(h,3);
    lines = houghlines(imgCanny, theta, rho, peaks);
figure(4), imshow(imgCanny'),hold on
for k = 1:length(lines)
       xy = [lines(k).point1 ; lines(k).point2];
       plot(xy(:,2), xy(:,1),'linewidth',4,'color',[1 0 0]);
end
