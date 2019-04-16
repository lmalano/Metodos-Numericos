#include <cstdlib>
#include <iostream>
#include <iomanip>//para setw
using namespace std;
int main()

{   // Declaracion de Variables
    float a[20][20],x[20],temp,sum;
    int maxit;
    int n=3; //define la cantidad de ecuaciones e incognitas
    
    cout<<"bienvenidos al programa para calcular las intensidades de este circuito electronico, utilizando el metodo Jacobi"<<endl;
      
cout<<"!-------^^^R1-----------!"<<endl;   
cout<<"!       --->I2          !"<<endl;
cout<<"!                       !"<<endl;
cout<<"!----^^^R2----^^^R3-----!"<<endl;
cout<<"!           !           !"<<endl;
cout<<"!   <---    !    <---   !"<<endl;
cout<<"E    I1     >     I3    >"<<endl;  
cout<<"!           > R4     R5 >"<<endl; 
cout<<"!           >           >"<<endl; 
cout<<"!           !           !"<<endl; 
cout<<"!-----------!-----------!"<<endl; 
cout<<"Las ecuaciones caracteristica de este circuito son(aplicando kirchoff):\n"<<endl;
cout<<"1) -I1(R24) + I2R2 + I3R4=E"<<endl;
cout<<"2) I1R2 - I2(R123)+ I3R3=0"<<endl;
cout<<"3) I1R4 + I2R3 - I3(R345)=0"<<endl;
cout<<"(Donde R24=R2+R4 ; R123=R1+R2+R3 y R345=R3+R4+R5)\n"<<endl;
cout<<"Se ha establecido por defecto, que el valor inicial de la iteracion es para I1=I2=I3=0\n"<<endl;

    for(int i=1;i<=n;i++)
    { cout<<"Ahora, ingrese los valores de las resistencia  que acompanan a las intensidades de la ecuacion "<<i<<", seguido del voltaje del generador(Solo en la 1 Ecuacion) "<<endl;
         
        for(int j=1;j<=n+1;j++)
        cin>>a[i][j]; }

    cout<<"Ingrese la cantidad de iteraciones a realizar:"<<endl;
    cin>>maxit;

   for(int i=0;i<=n;i++)
        {x[i]=0; // valor inicial de la iteracion
           for(int itr=0;itr<=maxit;itr++)
                {for(int i=1;i<=n;i++)
                     {  sum=0;
                           for(int j=0;j<=n;j++)
                                {
                                 if(i!=j)
                                   sum=sum+a[i][j]*x[j];
                                 }
                            temp=(a[i][n+1]-sum)/a[i][i];

            x[i]=temp;}
}

        for(int i=1;i<=n;i++)
        cout<<"\nEl valor de la I"<<i<<" es :"<<setw(3)<<x[i]<<endl;
        system("pause");
      return 0; 
    
}   
}
