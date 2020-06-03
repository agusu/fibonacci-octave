function [R] = fibonacci_por_sucesion(n)
  %Función de fibonacci iterativa. f0 = f1 = 1; n > 2
  if (n == 1 || n == 0)
    R = 1;
    return;
  endif
  R = [1 2];
 %R(1) = 1;
 %R(2) = 2;

 for k=3:n
   R(k) = R(k-1) + R(k-2);
 endfor
 R = R(end);
 #R = R(end);
 #FI = FI(end);
endfunction
