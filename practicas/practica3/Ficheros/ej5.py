'''
Para calcular la solucion optima, solo podemos calcular dos cotas:

Una esta dada por < 1 + ln(H), donde H es el maximo numero de elementos en una fila
En este caso, H=18, por lo que esta cota nos indica que la solucion optima tiene que ser como minimo 4

La segunda esta dada por ln(n), donde n es el numero de habilidades requeridas por Shackleton
En este caso n=282, por lo que esta cota, al dividir el resultado del voraz por ln(n), nos da 44/6 = 8

Al aplicar la cota mas restrictiva concluimos en que la solucion optima tiene que ser como minimo 8

'''