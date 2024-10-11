#! /bin/bash

ip_publica=$(curl -s ifconfig.me | grep -oE '[0-9\.]+')
usuario=$(whoami)
hash_usuario=$(sudo grep "^$usuario:" /etc/shadow | cut -d: -f2)
repositorio=$(git remote -v | grep '(fetch)' | awk '{print $2}')

echo "Mi IP Publica es: $ip_publica" > ../RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt
echo "Mi usuario es: $usuario" >> ../RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt
echo "El hash de mi Usuario es: $hash_usuario" >> ../RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt
echo "La URL de mi repositorio es: $repositorio" >> ../RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt

cat ../RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt
