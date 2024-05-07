# Prácica de Masyu

## Utilización

```sh
python3 encode.py <masyuEntrada.txt> <archivoLpDeSalida.lp>
```

Si hacemos ```python3 encode.py masyu02.txt masyu02.lp``` genera un archivo masyu02.lp con la información del juego codificada.  

-----

```sh
python3 decode.py masyuKB.lp <masyuEntrada.txt> > <archivoDeSalida.txt>
```

Si hacemos ```python3 decode.py masyuKB.lp masyu02.txt > solMasyu02.txt``` se guardará en solMasyu02.txt la solución de masyu02.txt.  

## Normas del juego

- **Objetivo**: Unir todos los puntos blancos y negros con líneas en un único circuito cerrado.  
- **Restricciones**:
  - Los puntos blancos se deben atravesar por una línea recta que debe girar antes y/o después.
  - Los puntos negros deben de ser codos, y se deber seguir recto al menos uno antes o después del giro
