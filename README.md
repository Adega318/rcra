# Participantes
Enrique Adega Fernández  
Alejandro Becerra Suárez
# Uso
Se deberá convertir los .txt con el formato presentado en la práctica usando:  
```sh
python3 encode.py <masyuEntrada.txt> <masyu.lp>  
```
El archivo de salida se deberá ejecutar junto al archivo masyuKB.lp  
```sh
clingo 0 masyuKB.lp <masyu.lp>  
```  
# Tiempos
Con este código en nuestro hardware tenemos los siguientes resultados:  

| masyu  | tiempo (s) |
| ------ | ------ |
| 00 	| 0.003  |
| 01 	| 0.002  |
| 02 	| 0.028  |
| 03 	| 0.032  |
| 04 	| 0.101  |
| 05 	| 0.541  |
| 06 	| 3.505  |
| 07 	| 35.72  |
| 08 	| 76.81  |
