function [] = programa()
  format long;
  NRO_AUREO = 1.618033988749894848204586834365638;
  FI = (1 + sqrt(5))/2;
      
  printf("NRO_AUREO %.20f\n",NRO_AUREO);
  printf("FI %.10g\n",FI);
  
  tiempo_total_por_iteraciones = 0;
  tiempos_temp_iter = [];
  resultados_fib_iter = [];
  resultados_aur_iter = [];
  
  tiempo_total_por_potencias = 0;
  tiempos_temp_pot = [];
  resultados_fib_pot = [];
  resultados_aur_pot = [];
  
  for(i = 1:100)
    %Calculos por metodo iterativo
    tic;
    resultados_fib_iter(i) = fibonacci_por_sucesion(i);
    tiempos_temp_iter(i) = toc;
    tiempo_total_por_iteraciones += tiempos_temp_iter(i);
    resultados_aur_iter(i) = razonAurea("fibonacci_por_sucesion", i);
    
    %Calculos por metodo de potencias
    tic;
    resultados_fib_pot(i) = fibonacci_por_potencias(i);
    tiempos_temp_pot(i) = toc;
    tiempo_total_por_potencias += tiempos_temp_pot(i);
    resultados_aur_pot(i) = razonAurea("fibonacci_por_potencias", i);
  endfor
  
  vN = 1:100;
  %Escritura de comparativas de tiempos y resultados en los calculos de la sucesion de Fibonacci
  encabezado = "n, Fn sucesion, t sucesion, Fn formula, t formula, |Fn_sucesion - Fn_formula|, error relativo Fn_formula";
  fid = fopen('Fibo.csv','w'); 
  fprintf(fid,'%s\n',encabezado);
  fclose(fid);  
  dlmwrite ("Fibo.csv", [vN', resultados_fib_iter', tiempos_temp_iter', resultados_fib_pot', tiempos_temp_pot', (abs(resultados_fib_iter - resultados_fib_pot))', (abs(resultados_fib_iter - resultados_fib_pot)./resultados_fib_iter)'], "-append");   
  
  %Escritura de comparativas en la razon aurea
  encabezado  = "n, fi por sucesion, fi por formula, |fi_sucesion - fi_formula|, |fi_sucesion - fi_exacto|,  |fi_formula - fi_exacto|";
  fid = fopen('RazonAurea.csv','w'); 
  fprintf(fid,'%s\n',encabezado);
  fclose(fid);  
  M = [vN', resultados_aur_iter', resultados_aur_pot', (abs(resultados_aur_iter - resultados_aur_pot))', (abs(resultados_aur_iter .- NRO_AUREO))', (abs(resultados_aur_pot .- NRO_AUREO))'];
  dlmwrite("RazonAurea.csv", M, "-append");
  
endfunction
