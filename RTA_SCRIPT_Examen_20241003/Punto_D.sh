#!/bin/bash
echo "Script Punto D"

# Crear los directorios correo y clientes
mkdir -p ~/Estructura_Asimetrica/{correo,clientes}

# Crear cartas del 1 al 100 en las carpetas correo y clientes
touch ~/Estructura_Asimetrica/correo/carta_{0{1..9},1{0..0}} ~/Estructura_Asimetrica/correo/carta_{10..100}
touch ~/Estructura_Asimetrica/clientes/carta_{0{1..9},1{0..0}} ~/Estructura_Asimetrica/clientes/carta_{10..100}

# Crear carteros del 1 al 10 solo en la carpeta correo
touch ~/Estructura_Asimetrica/correo/cartero_{0{1..9},10}

# Mostrar la estructura para validar
echo "Estructura creada:"
tree ~/Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4


