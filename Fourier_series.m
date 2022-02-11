N = input("Please enter the value of x  \n(it's better to be fewer than 100) :");
E_1_TO_N=1:1:N;


X0 = input("please enter X0 :");
X1 = input("please enter x1 :");
xinterval=[X0  X1];
syms x;
func(x)=input("please enter ur function :");



[a0,an,bn,T]=fourierSeriesCalc(func,xinterval,N);%%function 

% displaying
disp("T =  " + T)
disp("a0 =  " + a0)
for n=1:1:N
disp("A(" + n +") = "  + an(n))
disp("B("+ n + ") = " + bn(n))
end



f_Fourier =a0; 
for n=1:1:N
 f_Fourier = f_Fourier + (an(n).*cos(2*(1*(n)*x*pi/T))) + (bn(n)*sin(2*(n)*x*pi/T));%%summing data
  E_1_TO_N(n)=vpaintegral((f_Fourier - func)^2,x,X0,X1);%%finding error from 1 to N
  
  if n == 1
      %%plotting f-fourier n=1
     figure('Name','F');
     subplot(2,2,1)    
     fplot(f_Fourier,xinterval)
     hold on
     fplot(func,xinterval)
     title("F vs f Fourier" ,"N=1")
     legend( 'f n=1 ' ,'F')
     xlabel("[x0 , x1]")
     ylabel("F(x) &  f Fourier ")

  end
  if n == round(N/4)
      %%plotting f-fourier round(N/4)
     subplot(2,2,2)   
     fplot(f_Fourier,xinterval)
     hold on
     fplot(func,xinterval)
     title("F vs f Fourier" ,"N = " +num2str(round(N/4)))
     legend( "f n= "+ num2str(round(N/4)) ,'F')
     xlabel("[x0 , x1]")
     ylabel("F(x) &  f Fourier ")

  end
  if n == round(N/2)
      %%plotting f-fourier round(N/2)
       subplot(2,2,3)   
      fplot(f_Fourier,xinterval)
        hold on
        fplot(func,xinterval)
        title("F vs f Fourier" ,"N = " +num2str(round(2*N/4)))
         legend( "f n= " + num2str(round(2*N/4)) ,'F')
         xlabel("[x0 , x1]")
        ylabel("F(x) &  f Fourier ")

  end
   if n == round(3*N/4)
      %%plotting f-fourier round(3*N/4)
       subplot(2,2,4)   
      fplot(f_Fourier,xinterval)
        hold on
        fplot(func,xinterval)
        title("F vs f Fourier" ,"N = "+num2str(round(3*N/4)))
         legend( "f n= " +num2str(round(3*N/4)) ,'F')
         xlabel("[x0 , x1]")
        ylabel("F(x) &  f Fourier ")

  end

    
end

      figure('Name',"N = "+num2str(N));%%plotting f-fourier n=N
     fplot(f_Fourier,xinterval)
       hold on
     fplot(func,xinterval)
      title("F vs f Fourier   final campare" ,"N= " +num2str(N))
       legend( "f n= "+num2str(N) ,'F')
       xlabel("[x0 , x1]")
       ylabel("F(x) &  f Fourier ")

       
%%plotting error with diffrent n
    figure('Name',"N =" + num2str(N));
plot( E_1_TO_N)
title("Error with diffrent amount of n")
       legend( 'E')
       xlabel("N from 1 to " + num2str(N) )
       ylabel("Error")
       
       
      
  function [a0,an,bn,T]=fourierSeriesCalc(func,xinterval,N)
syms x;
T=(xinterval(2)-xinterval(1));
a0 = double((1/T).*int(func,x,xinterval(1),xinterval(2)));
an =double((2/T).*int(func.*cos(2*(1:N)*x*pi/T),x,xinterval(1),xinterval(2)));
bn =double((2/T).*int(func.*sin(2*(1:N)*x*pi/T),x,xinterval(1),xinterval(2)));

end   