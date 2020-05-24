function [r] = fibonacci_por_potencias(n)
  %Devuelve el valor de fibonacci aproximado por potencias. f0 = f1 = 1. n > 2
  if(n < 0)
    r = -1;
  else
    r = (1/sqrt(5))*(((1+sqrt(5))/2)**(n+1) - ((1-sqrt(5))/2)**(n+1));
  endif
endfunction
