function [r] = fibonacci_rec(n)
 if (n==1 || n==0) 
   r = 1;
 elseif (n==2)
   r = 2; 
 else
   r = fibonacci_rec(n-1) + fibonacci_rec(n-2); 
 endif
endfunction