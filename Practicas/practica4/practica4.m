clear
clc
close
image = imread('Desktop\placa3.jpg');
imageN = rgb2gray(double(image)/255);
    [r,c]=size(imageN);
    m = fspecial('laplacian');
    r=((r+3)-1);
    c=((c+3)-1);
tic
fftmask=fft2(m,r,c);    
fftimage=fft2(imageN,r,c);
imageFinalfft=fftimage.*fftmask;
imageFinal=ifft2(imageFinalfft);
toc
tic 
imageFinalconv=conv2(imageN, m);
toc
figure(1)
subplot(3,2,1),imshow((log(1+abs(fftshift(fftimage)))),[]),title('epectro original')
subplot(3,2,2),imshow((log(1+abs(fftshift(imageFinalfft)))),[]),title('espectro filtrado')
subplot(3,2,3),imshow(abs(imageFinalconv),[]),title('Filtro:convolucion')
subplot(3,2,4),imshow(abs(imageFinal),[]),title('Filtro: FFT(laplaciano)')
subplot(3,2,5),imshow(image),title('Imagen: original')
subplot(3,2,6),imshow(imageN),title('Imagen: Gray')

% Elapsed time is 0.032752 seconds.
% Elapsed time is 0.002051 seconds.
        

