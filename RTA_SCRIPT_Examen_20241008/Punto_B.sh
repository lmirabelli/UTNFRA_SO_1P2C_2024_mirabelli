#!/bin/bash

# Crear particiones usando parted
sudo parted /dev/sdc --script mklabel gpt # Crear tabla de particiones GPT

# Crear las particiones de 1GB cada una
for i in {1..3}; do
  sudo parted /dev/sdc --script mkpart primary ext4 $(($i * 1))GB $(($i * 1 + 1))GB
done

for i in {5..11}; do
  sudo parted /dev/sdc --script mkpart primary ext4 $(($i * 1 - 1))GB $(($i * 1))GB
done
#Para saber si funciono la particion de los discos
sudo fdisk /dev/sdc -l
sudo mkfs.ext4 /dev/sdc1
sudo mkfs.ext4 /dev/sdc2
sudo mkfs.ext4 /dev/sdc3
sudo mkfs.ext4 /dev/sdc5
sudo mkfs.ext4 /dev/sdc6
sudo mkfs.ext4 /dev/sdc7
sudo mkfs.ext4 /dev/sdc8
sudo mkfs.ext4 /dev/sdc9
sudo mkfs.ext4 /dev/sdc10
sudo mkfs.ext4 /dev/sdc11
echo '/dev/sdc1 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc2 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc3 /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc5 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc6 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc7 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc8 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc9 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc10 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0' | sudo tee -a /etc/fstab
echo '/dev/sdc11 /Examenes-UTN/profesores ext4 defaults 0 0' | sudo tee -a /etc/fstab
#Para comprobar los resultados
cat /etc/fstab


