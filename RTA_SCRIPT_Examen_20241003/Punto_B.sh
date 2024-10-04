#!/bin/bash

DISCO="/dev/sdb"               # Disco de 10GB (ajustar según sea necesario)
NUM_PARTICIONES=10             # Número de particiones a crear
TAM_PARTICION_MB=1024          # Tamaño de cada partición en MB (1GB)

# Crear las particiones usando fdisk
(
echo o   # Crear una nueva tabla de particiones DOS

for i in $(seq 1 $NUM_PARTICIONES); do
    echo n    # Crear una nueva partición
    echo p    # Tipo de partición primaria
    echo $i   # Número de partición
    echo      # Usar el sector por defecto para el inicio
    echo      # Usar el sector por defecto para el final
done

echo w    # Guardar los cambios y salir
) | sudo fdisk "$DISCO"

# Formatear cada partición en ext4
for i in $(seq 1 $NUM_PARTICIONES); do
    sudo mkfs.ext4 "${DISCO}${i}"
    echo "Partición ${DISCO}${i} formateada en ext4."
done

echo "Montando las particiones..."
sudo mount /dev/sdb1 /Examenes-UTN/alumno_1/parcial_1
sudo mount /dev/sdb2 /Examenes-UTN/alumno_1/parcial_2
sudo mount /dev/sdb3 /Examenes-UTN/alumno_1/parcial_3
sudo mount /dev/sdb4 /Examenes-UTN/alumno_2/parcial_1
sudo mount /dev/sdb5 /Examenes-UTN/alumno_2/parcial_2
sudo mount /dev/sdb6 /Examenes-UTN/alumno_2/parcial_3
sudo mount /dev/sdb7 /Examenes-UTN/alumno_3/parcial_1
sudo mount /dev/sdb8 /Examenes-UTN/alumno_3/parcial_2
sudo mount /dev/sdb9 /Examenes-UTN/alumno_3/parcial_3
sudo mount /dev/sdb10 /Examenes-UTN/profesores

# Agregar entradas a /etc/fstab para el montaje persistente
{
    echo "/dev/sdb1   /Examenes-UTN/alumno_1/parcial_1   ext4    defaults    0    2"
    echo "/dev/sdb2   /Examenes-UTN/alumno_1/parcial_2   ext4    defaults    0    2"
    echo "/dev/sdb3   /Examenes-UTN/alumno_1/parcial_3   ext4    defaults    0    2"
    echo "/dev/sdb4   /Examenes-UTN/alumno_2/parcial_1   ext4    defaults    0    2"
    echo "/dev/sdb5   /Examenes-UTN/alumno_2/parcial_2   ext4    defaults    0    2"
    echo "/dev/sdb6   /Examenes-UTN/alumno_2/parcial_3   ext4    defaults    0    2"
    echo "/dev/sdb7   /Examenes-UTN/alumno_3/parcial_1   ext4    defaults    0    2"
    echo "/dev/sdb8   /Examenes-UTN/alumno_3/parcial_2   ext4    defaults    0    2"
    echo "/dev/sdb9   /Examenes-UTN/alumno_3/parcial_3   ext4    defaults    0    2"
    echo "/dev/sdb10  /Examenes-UTN/profesores            ext4    defaults    0    2"
} | sudo tee -a /etc/fstab

