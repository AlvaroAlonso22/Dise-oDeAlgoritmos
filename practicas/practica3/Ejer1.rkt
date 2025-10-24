#lang racket
;Ejercicio 1:
;El objetivo de la práctica es conseguir el conjunto minimo de personas que contengan todas las habilidades. Para que esto
;tenga sentido implica que tienen que aparecer todas las habilidades en el fichero. Para comprobar esto ejecutamos el programa
;proporcionado '04_cod_01.py' y ejecutamos carga_habs() con el fichero '04_dat_01.txt' como argumento. Esta funcion devuelve el
;conjunto de todas las habilidades que aparecen en el fichero, por lo tanto la longitud de ese conjunto será el número de habilidades
;que hay en el fichero. Al ejecutarlo obtenemos 137, que coincide con el número de habilidades que tienen que haber, [0,1, .., 136].