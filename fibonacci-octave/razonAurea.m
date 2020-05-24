function [r] = razonAurea(f, n)
  r = feval(f, n + 1) /feval(f, n);
endfunction
