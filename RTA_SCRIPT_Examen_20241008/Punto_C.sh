#!/bin/bash
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores
USUARIOS=("p1c2_2024_A1" "p1c2_2024_A2" "p1c2_2024_A3")
HASH_CLAVE=$(openssl passwd -6 "vagrant")

for i in {0..2}; do
	sudo useradd -m -G p1c2_2024_gAlumno -p "$HASH_CLAVE" ${USUARIOS[$i]}
	sudo chown -R ${USUARIOS[$i]}:${USUARIOS[$i]}
done
sudo useradd -m -G p1c2_2024_gProfesores -p "$HASH_CLAVE" p1c2_2024_P1
sudo chown -R p1c2_2024_P1:p1c2_2024_P1
sudo chmod -R 750 /Examenes-UTN/alumno_1
sudo chmod -R 750 /Examenes-UTN/alumno_2
sudo chmod -R 750 /Examenes-UTN/alumno_3
sudo chmod -R 770 /Examenes-UTN/profesores
sudo su - p1c2_2024_A1 -c "whoami > /Examenes-UTN/alumno_1/validar.txt"
sudo su - p1c2_2024_A2 -c "whoami > /Examenes-UTN/alumno_2/validar.txt"
sudo su - p1c2_2024_A3 -c "whoami > /Examenes-UTN/alumno_3/validar.txt"
sudo su - p1c2_2024_P1 -c "whoami > /Examenes-UTN/profesores/validar.txt"

