   close
   clear
   clc
%% ejercicio 2 y 3
    %Muestra imagen almacenada en disco, submuestreo de la novena parte de
    %la imagen obtenida
    
    %utilizamos el comando imread para leer la imagen en disco y la
    %alamcenemos en una variable a 
        
    a = imread('ParteDelanteraINE.jpg');
    figure(1)
    %mostrando imagen en pantalla, con el comando imaga(a)
    subplot(1,2,1),image(a)
    
    %muestramos con una factor de 9 la imagen original contenida en "a"
    %estamos indicando que queremos todos los rengolones desde uno hasta el
    %final con incrementos de 9, las columans tambien las queremos desde 1
    %hasta el final con incrementos de 9, y las capas de color se
    %imprimiran todas y asi conseguimos submuestrear la imagen orignal
    suba = a(1:9:end,1:9:end,:);
    subplot(1,2,2),image(suba);
    
%% ejercicio 4
    %alamcenar la imagen resultante en formato BMP, JPG
    %alamcenando iamagenes, usando el comando 'imwrite'
    
    %alamacenar imagenes en BMP
  
    imwrite(suba,'submuestraINE.bmp')
    
    %almacenar imagenes en JPG
    
    imwrite(suba,'submuestraINE.jpg')
        
%% ejercicio 5
   %leer imagen desde la webcam
    
   
%% ejercicio 6
    %Imprimir franjas blancas verticales de 100 pixeles de ancho, cada 200
    %pixeles
    
    
    %obtnenemos de las dimensiones de la imagen en un arreglo de 1*3 donde
    %se indica las propiedades de la imagen (renglones,columnas,capas)

    dimension = size(a);
    
    %generamos un ciclo while para determinar el final de la imgen y evitar
    %que se sigua repitendo la intruccion de a(:,n,m,:)= 255 hasta infinito
    %el ciclo en cada iteracion pregunta si el valor que indica las
    %columnas ya supero el tamaño de la imagen y ahi se para

    %m y n son las variables que se estaran incrementando indicando el
    %inicio y el fin de cada columna m seria el final y n seria el inicio
    %en este a ambos se le estara incrementando 200 cada iteracion, hasta
    %llegar a el limite de la imagen 
    
    m=100;
    n=1;
    
    %intruccion while m < dimension (2) utilizada para delimitar el numero
    %de iteraciones
    
while m <= dimension(2) 
    
    %el comando a(:,n,m,:)= 255 se utiliza para delmitar a que es lo que le
    %queremos sumar 255, este idica que utilizaremos todos los renglones de
    %las columans n(inicio), m(fin), en todas las capas de la imagen
    
    a(:,n:m,:)=255;
    
    %incrementando las variables inicio y fin de las columnas
    
    m = m + 200;
    n = n + 200;
    
    %imshow, instruccion utilizada para imprimir la imagen en pantalla, ya
    %con las franjas blancas.
    figure(2),imshow(a)
    size(a);
end



figure(3), imshow(a)
figure(3), imshow(a)