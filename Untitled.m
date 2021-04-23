clear all % limpia el workspace
clc %limpia la linea de comandos
n1= input('Teclea un número: ');
n2= input ('Teclea otro: ');
reply=4;

while (reply~=1)&(reply~=2)&(reply~=3)
    
    fprintf('Selecciona la operación que deseas: \n' );
    fprintf('1 Suma \n' );
    fprintf('2 Resta \n' );
    fprintf('3 Multiplicacion \n' );
    reply = input('...');
end

if reply==1 %la suma de los dos números
    resultado=n1+n2;
elseif reply==2 %la resta de los dos números
    resultado=n1-n2;
elseif reply==3 %la multiplicación de los dos números
    resultado=n1*n2;
end
fprintf('El resultado es = %f \n', resultado);