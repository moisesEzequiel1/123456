clc;clear all;
% 2-Leer imagen de la computadora en matlab.
    imagen=imread('pitbull.jpg');
    figure(1)
    imshow(imagen(:,:,:))
    size(imagen)
    
    

% 3-Sub-muestrear la imagen original para reducir a una novena parte su tama�o 
    imagenReducida=imagen(1:3:end,1:3:end,:);
    figure(2)
    imshow(imagenReducida(:,:,:))
    size(imagenReducida)
    
    
  
% 4-Guardar en la PC la imagen resultante en dos formatos diferentes (jpg y bmp)   

    %alamacenar imagenes en BMP
    imwrite(imagenReducida,'pitbullBMP.bmp')
    
    %almacenar imagenes en JPG
    imwrite(imagenReducida,'pitbullJpg.jpg')
   
    
%6- Agregar franjas verticales blancas de 100 pixeles de ancho cada 200 pixeles 

    dimension = size(imagen);
    m=101;
    n=1;
    ancho=100;

 while m < dimension (2)
        %El comando a(:,n,m,:)= 255 se utiliza para delmitar a que es lo que le
        %queremos sumar 255, este idica que utilizaremos todos los renglones de
        %las columans n(inicio), m(fin), en todas las capas de la imagen
    
        imagen(:,n:m,:)=255;
    
        %incrementando las variables inicio y fin de las columnas
    
        m = m + 200;
        n = n + 200;
    
        %imshow, instruccion utilizada para imprimir la imagen en pantalla, ya
        %con las franjas blancas.
        figure(3),imshow(imagen)
        size(imagen);
end  


% 7-Leer alguna imagen del medio de su elecci�n con alto contenido de cromaticidad
    imagenColores=imread('colores.jpg');
    figure(4)
    imshow(imagenColores(:,:,:))

% 8-Realizar las siguientes conversiones entre modelos de color.
%         imagenpaisaje=imread('paisaje.jpg'); %Leemos la imagen
        
        %1. RGB a escalas de grises.
        imagenGris =rgb2gray(imagenColores); %Funcion para convertir RgbToGrises
        figure(5); 
        subplot(2,1,1),imshow(imagenColores(:,:,:)) 
        title('RGB');
        subplot(2,1,2),imshow(imagenGris(:,:,:)) 
        title('Escala de grises');
      
        %2. RGB a CMY.
        imagenCMY=imagenColores;
       
        imagenCMY(:,:,1)=255-imagenColores(:,:,1); %cyan=255-rojo
        imagenCMY(:,:,2)=255-imagenColores(:,:,2);%Magenta=255-verde
        imagenCMY(:,:,3)=255-imagenColores(:,:,3);%Amarillo=255-azul
        
        figure(6)
        subplot(3,2,1),imshow(imagenColores(:,:,:)) 
        title('RGB');
        subplot(3,2,2),imshow(imagenCMY(:,:,:)) 
        title('CMY');
        subplot(3,2,3),imshow(imagenCMY(:,:,1)) 
        title(' Cyan');
        subplot(3,2,4),imshow(imagenCMY(:,:,2)) 
        title(' Magenta');
        subplot(3,2,5),imshow(imagenCMY(:,:,3)) 
        title('Amarillo');
        
        %3. RGB a HSV.
        imagenHSV=rgb2hsv(imagenColores); %Funcion para convertir RgbToHsv
        figure(7)
        subplot(3,2,1),imshow(imagenColores(:,:,:)) 
        title('RGB');
        subplot(3,2,2),imshow(imagenHSV(:,:,:)) 
        title('HSV');
        subplot(3,2,3),imshow(imagenHSV(:,:,1)) 
        title(' H=tonalidad');
        subplot(3,2,4),imshow(imagenHSV(:,:,2)) 
        title(' S=Saturacion');
        subplot(3,2,5),imshow(imagenHSV(:,:,3)) 
        title(' V=Brillo');


% El codigo siguiente tenia varias fallas





