clc; clear all; close all;
%---------PUNTO 1------------------------------------------
imagen=imread('imagendeprueba.bmp');
% imagenGray=rgb2gray(imagen);
imagenruidoGaus = double(imnoise(imagen,'gaussian',0,0.02))/255;
%---------PUNTO 2 Ruido Gaussiano---------------------------
%Suavizado por Media
mascaraMedia=fspecial('average',[3,3]);
    imagen1(:,:,1)=conv2(imagenruidoGaus(:,:,1),mascaraMedia,'same'); %Same quita bordes negros
    imagen1(:,:,2)=conv2(imagenruidoGaus(:,:,2),mascaraMedia,'same'); %Same quita bordes negros
    imagen1(:,:,3)=conv2(imagenruidoGaus(:,:,3),mascaraMedia,'same'); %Same quita bordes negros
%Suavizado por Mascara Gaussiana
mascaraGussiana=fspecial('gaussian',[13,13],2);
    imagen2(:,:,1)=conv2(imagenruidoGaus(:,:,1),mascaraGussiana,'same'); %Same quita bordes negros
    imagen2(:,:,2)=conv2(imagenruidoGaus(:,:,2),mascaraGussiana,'same'); %Same quita bordes negros
    imagen2(:,:,3)=conv2(imagenruidoGaus(:,:,3),mascaraGussiana,'same'); %Same quita bordes negros
%Filtro de mediana      
ventana=[1 1 1;1 1 1;1 1 1];       
    imagen3(:,:,1)=ordfilt2(imagenruidoGaus(:,:,1),4,ventana);
    imagen3(:,:,2)=ordfilt2(imagenruidoGaus(:,:,2),4,ventana);
    imagen3(:,:,3)=ordfilt2(imagenruidoGaus(:,:,3),4,ventana);
%Filtro de minimo       
    imagen4(:,:,1)=ordfilt2(imagenruidoGaus(:,:,1),1,ventana);
    imagen4(:,:,2)=ordfilt2(imagenruidoGaus(:,:,2),1,ventana);
    imagen4(:,:,3)=ordfilt2(imagenruidoGaus(:,:,3),1,ventana);
% impresion por pantalla
        figure(1), subplot(3,2,1),imshow(imagenruidoGaus),title('Imagen Contaminada: Ruido Gausiano')
        subplot(3,2,2),imshow(imagen1),title('Imagen Filtrada: mascara media')
        subplot(3,2,3),imshow(imagen2),title('Imagen Filtrada: mascara Gaussiana')
        subplot(3,2,4),imshow(imagen3),title('Imagen Filtrada: Filtro de Mediana')
        subplot(3,2,5),imshow(imagen4),title('Imagen Filtrada: Filtro de minimos')
        subplot(3,2,6),imshow(imagen),title('Imagen Original')

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


