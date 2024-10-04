#!/bin/bash
# Script Punto F

# Definir el directorio donde se guardará el archivo
DIR=/home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Eduards/RTA_ARCHIVOS_Examen_20241003

# Obtener IP pública y guardar en el archivo
echo "Mi ip publica es: $(curl -s ifconfig.me)" > "$DIR/Filtro_Avanzado.txt"

# Obtener usuario actual y añadir al archivo
echo "Mi usuario es: $(whoami)" >> "$DIR/Filtro_Avanzado.txt"

# Obtener hash del usuario y añadir al archivo
echo "El hash de mi usuario es: $(sudo grep "^$(whoami):" /etc/shadow | awk -F: '{print $2}')" >> "$DIR/Filtro_Avanzado.txt"

# Obtener URL del repositorio y añadir al archivo
echo "La URL de mi repositorio es: $(git config --get remote.origin.url)" >> "$DIR/Filtro_Avanzado.txt"

