#! /bin/bash

mkdir -p ../RTA_ARCHIVOS_Examen_20241008/
cd ../RTA_ARCHIVOS_Examen_20241008/
grep "MemTotal" /proc/meminfo > Filtro_Basico.txt
sudo dmidecode -t chassis | grep "Manufacturer" >> Filtro_Basico.txt

