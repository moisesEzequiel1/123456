imagen=imread('placas4.jpeg');
imghsv = rgb2hsv(imagen);
m = max(imghsv,[],3)/2