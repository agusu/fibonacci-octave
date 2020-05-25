function [] = programa()
  format long;
  NRO_AUREO = 1.618033988749894848204586834365638;
  FI = (1 + sqrt(5))/2;
      
  printf("NRO_AUREO %.20f\n",NRO_AUREO);
  printf("FI %.10g\n",FI);
  
  %Parte A: Imprimir y ver cual converge antes
  %Parte B: Calcular velocidad de procesamiento
  
  %Info util a guardar:
    %tiempo de ejecución para c/función y con qué n
    %tiempo total de iteración
    %precisión respecto a número áureo (y el número calculado)  
  
  tiempo_total_por_iteraciones = 0;
  tiempos_temp_iter = [];
  resultados_fib_iter = [];
  resultados_aur_iter = [];
  
  tiempo_total_por_potencias = 0;
  tiempos_temp_pot = [];
  resultados_fib_pot = [];
  resultados_aur_pot = [];
  
  for(i = 1:100)
    %Cálculos por método iterativo
    tic;
    resultados_fib_iter(i) = fibonacci_por_sucesion(i);
    tiempos_temp_iter(i) = toc;
    tiempo_total_por_iteraciones += tiempos_temp_iter(i);
    resultados_aur_iter(i) = razonAurea("fibonacci_por_sucesion", i);
    
    %Cálculos por método de potencias
    tic;
    resultados_fib_pot(i) = fibonacci_por_potencias(i);
    tiempos_temp_pot(i) = toc;
    tiempo_total_por_potencias += tiempos_temp_pot(i);
    resultados_aur_pot(i) = razonAurea("fibonacci_por_potencias", i);
  endfor
  
  vN = 1:100;
  %Escritura de comparativas de tiempos y resultados en los cálculos de la sucesión de Fibonacci
  encabezado = "n, resultados_fib_iter', tiempos_temp_iter', resultados_fib_pot', tiempos_temp_pot'";
  fid = fopen('Fibo.csv','w'); 
  fprintf(fid,'%s\n',encabezado);
  fclose(fid);  
  dlmwrite ("Fibo.csv", [vN', resultados_fib_iter', tiempos_temp_iter', resultados_fib_pot', tiempos_temp_pot'], "-append");   
  
  %Escritura de comparativas en la razón áurea
  encabezado  = "n, razonAurea iterativa, razón aurea potencia, dif(razones aureas 1 y 2), dif razón aurea 1 y posta, dif razón aurea 2 y posta";
  fid = fopen('RazonAurea.csv','w'); 
  fprintf(fid,'%s\n',encabezado);
  fclose(fid);  
  M = [vN', resultados_aur_iter', resultados_aur_pot', (abs(resultados_aur_iter - resultados_aur_pot))', (abs(resultados_aur_iter .- NRO_AUREO))', (abs(resultados_aur_pot .- NRO_AUREO))'];
  dlmwrite("RazonAurea.csv", M, "-append");
  
  
endfunction
