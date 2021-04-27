clc; clear all;close all; 
%---------PUNTO 10----------------------------------------------------
imagen=imread('placas4.jpeg');
subimagen=imagen(302:590,:,:);
placasGray=double(rgb2gray(subimagen))/255;
figure(1),imshow(placasGray),title('Imagen Original')
%---------PUNTO 11----------------------------------------------------
%Mascaras de derivadas
prewittHorizontal=fspecial('prewitt');
prewittVertical=prewittHorizontal';

sobelHorizontal=[-1 -2 -1;0 0 0;1 2 1];
sobelVertical=[-1 0 1;-2 0 2;-1 0 1];

%---------PUNTO 12 Aplicacione de las mascaras------------------------
PreHorizontal=imfilter(placasGray,prewittHorizontal,'conv');
figure(2),imshow(PreHorizontal),title('Prewitt Horizontal')
PreVertical=imfilter(placasGray,prewittVertical,'conv');
figure(3),imshow(PreVertical),title('Prewitt Vertical')

SobHorizontal=imfilter(placasGray,sobelHorizontal,'conv');
figure(4),imshow(SobHorizontal),title('Sobel Horizontal')
SobVertical=imfilter(placasGray,sobelVertical,'conv');
figure(5),imshow(SobVertical),title('Sobel Vertical')
%---------PUNTO 13 Magnitud del gradiente-----------------------------
MagnitudGradientePrewitt=sqrt(PreHorizontal.^2+PreVertical.^2);
figure(6),imshow(MagnitudGradientePrewitt,[]),title('Magnitud Gradiente Prewittl')

MagnitudGradienteSobel=sqrt(SobHorizontal.^2+SobVertical.^2);
figure(7),imshow(MagnitudGradienteSobel,[]),title('Magnitud Gradiente Sobel')

%---------PUNTO 15 SUAVIZADO MÁS GRADIENTE---------------------------
mascaraMedia=fspecial('average',[5,5]);
imagenSuavizada=conv2(placasGray,mascaraMedia,'same'); %Same quita bordes negros
figure(8),imshow(imagenSuavizada),title('Imagen Suavizada')

%---------PUNTO 16---------------------------------------------------
PreSuavHorizontal=imfilter(imagenSuavizada,prewittHorizontal,'conv');
figure(9),imshow(PreSuavHorizontal),title('Suavizada con Prewitt Horizontal')
PreSuavVertical=imfilter(imagenSuavizada,prewittVertical,'conv');
figure(10),imshow(PreSuavVertical),title('Suavizada con Prewitt Vertical')

SobSuavHorizontal=imfilter(imagenSuavizada,sobelHorizontal,'conv');
figure(11),imshow(SobSuavHorizontal),title('Suavizada con Sobel Horizontal')
SobSuavVertical=imfilter(imagenSuavizada,sobelVertical,'conv');
figure(12),imshow(SobSuavVertical),title('Suavizada con Sobel Vertical')


MagnitudGradienteSuavizadoPrewitt=sqrt(PreSuavHorizontal.^2+PreSuavVertical.^2);
figure(13),imshow(MagnitudGradienteSuavizadoPrewitt,[]),title('Magnitud Gradiente Prewittl Suavizado')

MagnitudGradienteSuavizadoSobel=sqrt(SobSuavHorizontal.^2+SobSuavVertical.^2);
figure(14),imshow(MagnitudGradienteSuavizadoSobel,[]),title('Magnitud Gradiente Sobel Suavizado')

%---------PUNTO 18 Laplaciano---------------------------------------------------
mascaraLaplaciana=fspecial('laplacian');
imagenLaplaciana=imfilter(placasGray,mascaraLaplaciana,'conv');
figure(15),imshow(imagenLaplaciana),title('Imagen con filtro laplaciano')
Ib=abs(imagenLaplaciana)>0.15; %Umbralizado de la imagen
figure(16),imshow(Ib),title('Imagen Umbralizada')
%---------PUNTO 18 Laplaciano---------------------------------------------------
mascaraLaplaciana=fspecial('laplacian');
imagenLaplaciana=imfilter(placasGray,mascaraLaplaciana,'conv');
figure(15),imshow(imagenLaplaciana),title('Imagen con filtro laplaciano')
Ib=abs(imagenLaplaciana)>0.15; %Umbralizado de la imagen
figure(16),imshow(Ib),title('Imagen Umbralizada')

%---------PUNTO 20 Suavizado + Laplaciano-----------------------------------------
imagenSUAVmasLAPL=imfilter(imagenSuavizada,mascaraLaplaciana,'conv');
figure(17),imshow(imagenSUAVmasLAPL),title('Imagen Suavizada + Laplaciano')
Ib2=abs(imagenSUAVmasLAPL)>0.05; %Umbralizado de la imagen
figure(18),imshow(Ib2),title('Imagen Umbralizada 2')

%---------PUNTO 22 Perfilado-----------------------------------------
mascaraLaplaciana=fspecial('laplacian');
M=[0,0,0;0,1,0;0,0,0]-2*mascaraLaplaciana
imagenPerfilada=imfilter(placasGray,M,'same');
figure(19),imshow(imagenPerfilada),title('Perfilado')

