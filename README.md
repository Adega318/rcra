# Participantes
Enrique Adega Fernández  
Alejandro Becerra Suárez

# Uso
Se debera combertir los .txt con el formato presentado en la practica usando:
```sh
python3 encode.py <masyuEntrada.txt> <mansyu.lp>
```
El archivo de salida se debera ejecutar junto al archivo mansyuKB.lp
```sh
clingo 0 mansyuKB.lp <mansyu.lp>
```

# Tiepos
Con este codigo en nuestro hardware tenemos los siguientes resultados:

| mansyu | tiempo |
| ------ | ------ |
| 00     | 0.003  |
| 01     | 0.002  |
| 02     | 0.028  |
| 03     | 0.032  |
| 04     | 0.101  |
| 05     | 0.541  |
| 06     | 3.505  |
| 07     | 35.72  |
| 08     | 76.81  |