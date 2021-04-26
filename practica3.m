clc; clear all; close all;
%---------PUNTO 1------------------------------------------
imagen=imread('shinkansen-5237269_1920.jpg');
imagenGray=rgb2gray(imagen);
    imagenruidoGaus = double(imnoise(imagenGray,'gaussian',0,0.02))/255;
%---------PUNTO 2 Ruido Gaussiano---------------------------
%Suavizado por Media
mascaraMedia=fspecial('average',[3,3]);
    imagen1=conv2(imagenruidoGaus,mascaraMedia,'same'); %Same quita bordes negros
%Suavizado por Mascara Gaussiana
mascaraGussiana=fspecial('gaussian',[13,13],2);
    imagen2=conv2(imagenruidoGaus,mascaraGussiana,'same');
%Filtro de mediana       
ventana=[0 1 0;1 1 1;0 1 0];       
    imagen3=ordfilt2(imagenruidoGaus,3,ventana);
%Filtro de minimo       
    imagen4=ordfilt2(imagenruidoGaus,1,ventana);
    % impresion por pantalla
figure(1), subplot(3,2,1),imshow(imagenruidoGaus),title('Imagen Contaminada: Ruido Gausiano')
subplot(3,2,2),imshow(imagen1),title('Imagen con suavizado mascara media')
subplot(3,2,3),imshow(imagen2),title('Imagen con suaviazado: mascara Gaussiana')
subplot(3,2,4),imshow(imagen3),title('Imagen con filtrado: Filtro de Mediana')
subplot(3,2,5),imshow(imagen4),title('Imagen con filtrado: Filtro de minimos')
subplot(3,2,6),imshow(imagenGray),title('Imagen Original')

%---------PUNTO 4 Sal y Pimienta------------------------------
imagenINE=imread('ParteDelanteraINE.jpg');
imagenINEGray=rgb2gray(imagenINE);
imagenruidoSalyPim = double(imnoise(imagenINEGray,'salt & pepper',0.15))/255;

%---------PUNTO 5 Sal y Pimienta------------------------------
%Suavizado por Media
mascaraMedia2=fspecial('average',[4,4]);
    imagenSalyPimMedia=conv2(imagenruidoSalyPim,mascaraMedia2,'same'); %Same quita bordes negros
%Suavizado por Mascara Gaussiana
mascaraGussiana2=fspecial('gaussian',[13,13],2);
    imagenSalyPimGaus=conv2(imagenruidoSalyPim,mascaraGussiana2,'same');
%Filtro de mediana       
ventana2=ones(5);      
    imagenSalyPimMediana=ordfilt2(imagenruidoSalyPim,13,ventana2);
%Filtro de minimo 
ventana3=[0 1 0;1 1 1;0 1 0];
    imagenSalyPimMaximo=ordfilt2(imagenruidoSalyPim,1,ventana3);

figure(2), subplot(3,2,1),imshow(imagenruidoSalyPim),title('Imagen Contaminada: Sal y Pimienta')
subplot(3,2,2),imshow(imagenSalyPimMedia),title('Imagen con suavizado mascara media')
subplot(3,2,3),imshow(imagenSalyPimGaus),title('Imagen con suaviazado: mascara Gaussiana')
subplot(3,2,4),imshow(imagenSalyPimMediana),title('Imagen con filtrado: Filtro de Mediana')
subplot(3,2,5),imshow(imagenSalyPimMaximo),title('Imagen con filtrado: Filtro de minimos')
subplot(3,2,6),imshow(imagenINEGray),title('Imagen Original')


