close all;
clear all;
clc;

a1 = [1 1 0;3.6114 .5795 -.5968;13.04 -0.0203 -.6918], b1 = [1;0;-1]
x1 = inv(a1)*b1;
if rank(a1) == length (a1)
    fprintf('El rango de la matriz es: %i', rank(a1));
    fprintf('\nla solucion para el ejercicio es:\n')
    disp(x1)
else
    fprintf('El rango de la matriz es: %i', rank(a1));  
    fprintf('\nla matriz no es linealmente independiente %s',x1)
    disp(x1)
end
a2 = [-2 1;-2 1], b2 = [-3;1]
x2 = inv(a2)*b2;
if rank(a2) == length (a2)
    fprintf('El rango de la matriz es: %i', rank(a2));
    fprintf('\nla solucion para el ejercicio es:\n')
    disp(x2)
else
    fprintf('El rango de la matriz es: %i', rank(a2));  
    fprintf('\nla matriz no es linealmente independiente\n')
    disp(x2)
end
a3 = [3 2 -1;-1 3 1;1 -1 -1], b3 = [1;1;1]
x3 = inv(a3)*b3;
if rank(a3) == length (a3)
    fprintf('El rango de la matriz es: %i', rank(a3));
    fprintf('\nla solucion para el ejercicio es:\n')
    disp(x3)
else
    fprintf('El rango de la matriz es: %i', rank(a3));  
    fprintf('\nla matriz no es linealmente independiente\n')
    disp(x3)
end
a4 = [10 -7 0;-3 2 6;5 1 5], b4 = [7;4;6]
x4 = inv(a4)*b4;
if rank(a4) == length (a4)
    fprintf('El rango de la matriz es: %i', rank(a4));
    fprintf('\nla solucion para el ejercicio es:\n')
    disp(x4)
else
    fprintf('El rango de la matriz es: %i', rank(a4));  
    fprintf('\nla matriz no es linealmente independiente\n')
    disp(x4)
end
a5 = [1 4 -1 1;2 7 1 -2;1 4 -1 2;3 -10 -2 5], b5 = [2;16;1;-15]
x5 = inv(a5)*b5;
if rank(a5) == length (a5)
    fprintf('El rango de la matriz es: %i', rank(a5));
    fprintf('\nla solucion para el ejercicio es:\n')
    disp(x5)
else
    fprintf('El rango de la matriz es: %i', rank(a5));  
    fprintf('\nla matriz no es linealmente independiente\n')
    disp(x5)
end