function y=gaussiana(a,b)
%INGRESO DE DATOS%

fprintf('\n\n\n\t\t********************************************************************************\n')
fprintf('\t\t*  Este metodo consiste en ingresar la matriz A de coeficientes del sistema    *\n')
fprintf('\t\t*  y el B vector de valores, para partiendo de AX=B se establece la matriz     *\n')
fprintf('\t\t*  aumentada A|B y en base del algoritmo de eliminacion gaussiana se  realiza  *\n')
fprintf('\t\t*  operaciones hasta triangulizar la matriz aumentada A|B y obtener los        *\n')
fprintf('\t\t*  valores del vector X, y con este los valores de xi (i=1,2,3,...n) que son   *\n')
fprintf('\t\t*  las respuestas de las incognitas del sistema                                *\n')
fprintf('\t\t********************************************************************************\n\n')


fprintf('\n\t\t********************************************************************************\n')
fprintf('\t\t*        Antes de empezar a ejecutar el algoritmo de Gauss en el sistema,      *\n')
fprintf('\t\t*        por favor escoja una opcion de presentacion de datos....              *\n')
fprintf('\t\t********************************************************************************\n\n\n')

fprintf('\t\t\t\t1. Format short; coma fija con 4 decimales (defecto)\n');
fprintf('\t\t\t\t2. Format long; coma fija con 15 decimales\n');
fprintf('\t\t\t\t3. Format short e;  notacin cientfica con 4 decimales\n');
fprintf('\t\t\t\t4. Format long e;  notacin cientfica con 15 decimales\n');
fprintf('\t\t\t\t5. Format rat;  expresa los nmeros racionales como cocientes de enteros\n');


fprintf('\n\t\t\t\tIngrese una opcion por favor;\n');
onn=input('                Opcion #   ');
if (onn~=1&onn~=2&onn~=3&onn~=4&onn~=5)
    fprintf('\n\t\t\t\tIngrese una opcion valida...por favor, \n\n')
    fprintf('\n\t\t\t\tse iniciara con format short(por defecto) \n\n')
end

switch (onn) 
	
		case 1, 
            format short
            fprintf('\n\t\tLa presentacion de datos se va a iniciar segun\n ')
            fprintf('\n\t\tFormat short; coma fija con 4 decimales (defecto)\n')
        case 2, 
            format long
            fprintf('\n\t\tLa presentacion de datos se va a iniciar segun\n ')
            fprintf('\n\t\tFormat long; coma fija con 15 decimales\n')
        case 3, 
            format short e
            fprintf('\n\t\tLa presentacion de datos se va a iniciar segun\n ')
            fprintf('\n\t\tFormat short e;  notacin cientfica con 4 decimales\n')
        case 4,
            format long e
            fprintf('\n\t\tLa presentacion de datos se va a iniciar segun\n ')
            fprintf('\n\t\tFormat long e;  notacin cientfica con 15 decimales\n')
        case 5, 
            format rat
            fprintf('\n\t\tLa presentacion de datos se va a iniciar segun\n ')
            fprintf('\n\t\tFormat rat;  expresa los nmeros racionales como cocientes de enteros\n')
end

fprintf('\n\t\tPresione una tecla para continuar por favor...\n ')
pause
clc
fprintf('\n\t\t\tIngrese la matriz de coeficientes  por favor\n\n')
fprintf('\t\t********************************************************************************\n')
fprintf('\t\t*                       POR EJEMPLO [4 1 2;2 4 -1;1 1 -3]                      *\n')
fprintf('\t\t********************************************************************************\n\n')
a=input('                      ');

fprintf('\n\t\t\tIngrese matriz columna de terminos independientes  por favor\n\n')
fprintf('\t\t********************************************************************************\n')
fprintf('\t\t*                              POR EJEMPLO [9;-5;-9]                           *\n')
fprintf('\t\t********************************************************************************\n\n')
b=input('                      ');


fprintf('\n\t\t\tEmpezando el proceso de eliminacion gaussiana...\n')
fprintf('\n\t\t\t\t\tPresione una tecla para continuar...\n')
pause
fprintf('\n\t\t\t\t\tLa matriz aumentada A|B del sistema es;\n')
n=length(a);
m=size(a);
r=size(b);
if m(2)==r(1)                      %condicion del sistema a(m*n)y b(n*p)
    k=1;
    while k<=(n-1)
        c=a;                      %matriz almacenada para la interaccion k-1                                      
        if a(k,k)~=0
            i=k+1;
            while i<=n            % reduccion por eliminacion gaussiana
                j=k;
                AB=[a,b] 
                fprintf('\n\t\t\t\t\tPresione una tecla para continuar...\n')
                fprintf('\n\t\t\tEliminar la columna %d a partir de F(%d)\n',k,k)
                fprintf('\n\t\t\tF(%d)-%.4f/%.4f*F(%d)\n',i,c(i,k),c(k,k),k)
                b(i)=b(i)-((c(i,k)/c(k,k))*b(k));    
                pause
                while j<=n
                    a(i,j)=a(i,j)-((c(i,k)/c(k,k))*a(k,j));
                    j=j+1;
                end
                i=i+1;
            end
        else
            fprintf('\n\t\t\t\t\tEl sistema es inconsistente')
            k=n+1;
        end
        k=k+1;
        c=a;               %matriz alamcenada para la interaccion k
    end
    AB=[a,b] %Matriz aumentada triangulizada
    i=n;
    while i>=1
        d(1,i)=a(i,i);        %diagonal almacenada
        i=i-1;
    end
    e=any(any(d==0));         %herramienta que busca 0 en la diagonal
    if e==0                   %si no existe 0 en la diagonal realiza calculos
        fprintf('\n\t\t\t\t\tLos valores de las incognitas son :\n')
        i=n;
        while i>=1
            j=i+1;
            s=0;
            while j<=n
                s=s+(a(i,j)*x(j));  %calculo del sumatorio de los elementos de una fila
                j=j+1;
            end
            x(i)=(b(i)-s)/a(i,i);   %calculo de las incognitas
            fprintf('\n\t\tx(%d) es igual a',i)
            fprintf('\n\t\tx(%d) = (b(%d)-s)/a(%d,%d)',i,i,i,i)
            fprintf('\n\t\tx(%d) = (%.5f - %.5f)/%.5f',i,b(i),s,a(i,i))
            fprintf('\n\t\tx(%d) = %.5f\n\n',i,x(i))
                if i>1
                    fprintf('\n\t\t\t\t\tPresione una tecla para continuar...\n')
                    pause
                end
           i=i-1; 
        end
    else
       fprintf('\n\t\t\t\t\tEl sistema  no tiene solucion o tiene soluciones infinitas')
       fprintf('\n\t\t\t\t\trevise si el planteamiento del sistema de ecuaciones es correcto')
       fprintf('\n\t\t\t\t\tpor favor...')
   end
else
    fprintf('\n\t\t\t\t\tImposible resolver el sistema ingresado falta argumentos,')
    fprintf('\n\t\t\t\t\tintente otra vez por favor')
end