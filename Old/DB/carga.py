# -*- coding: utf-8 -*-
import csv
import psycopg2
conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
cursor = conexion.cursor()
def carga_Materias():
	with open('Materias.csv') as File:  
	    reader = csv.reader(File)
	    for row in reader:
	    	print((row[0])) ### Clave ID INT
	    	ids=int(row[0])
	    	print(row[1]) ##nombre de la materia
	    	nombre=row[1]
	    	print(row[2]) ##status de la materia
	    	status=row[2]
	    	print(row[3]) ##grado de la materia
	    	grado=row[3]
	    	cursor.execute("INSERT INTO materia(materia_id, nombre, estado, grado) VALUES("+str(ids)+", '"+str(nombre)+"', '"+str(status)+"', '"+str(grado)+"')")
	    	conexion.commit()


def carga_Estudiante():
	with open('estudiante.csv') as File:  
	    reader = csv.reader(File)
	    for row in reader:
	    	ids = int((row[0])) ### Clave ID INT
	    	curp = ((row[1])) ### CURP
	    	nombre = ((row[2])) ### Nombre
	    	ap_paterno = ((row[3])) ### Apellido paterno
	    	ap_materno = ((row[4])) ### Apellido materno
	    	grado = ((row[5])) ### grado
	    	edad = int((row[6])) ### edad
	    	nombre_tutor = ((row[7])) ### Nombre Tutor
	    	tel_casa = ((row[8])) ### Telefono Casa
	    	tel_cel = ((row[9])) ### Telefono Celular
	    	correo = ((row[10])) ### Correo electronico
	    	password = ((row[11])) ### Passwords
	    	dia_registro =((row[12])) ### Dai registro
	    	estado = ((row[13])) ### Estado
	    	print(ids, curp, nombre, ap_paterno, ap_materno, grado, edad, nombre_tutor, tel_casa, tel_cel, correo, password, dia_registro, estado )
	    	cursor.execute("INSERT INTO estudiante(estudiante_id, curp, nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono_casa, telefono_celular, correo_electronico, passwords, dia_registro, estado) VALUES("+str(ids)+", '"+str(curp)+"', '"+str(nombre)+"', '"+str(ap_paterno)+"', '"+str(ap_materno)+"', '"+str(grado)+"', "+str(edad)+", '"+str(nombre_tutor)+"', '"+str(tel_casa)+"', '"+str(tel_cel)+"', '"+str(correo)+"', '"+str(password)+"', '"+str(dia_registro)+"', '"+str(estado)+"')")
	    	conexion.commit()	

def prof_grado():
	with open('profesor_grado.csv') as File:  
		reader = csv.reader(File)
		for row in reader:
			ids = int((row[0])) ### Clave ID INT
			curp = ((row[1])) ### CURP
			nombre = ((row[2])) ### Nombre
			ap_paterno = ((row[3])) ### Apellido paterno
			ap_materno = ((row[4])) ### Apellido materno
			edad = int((row[5])) ### edad
			telefono = ((row[6])) ### grado
			correo_electronico = (row[7])
			password = (row[8])
			estado = (row[9])
			grado = (row[10])
			cursor.execute("INSERT INTO profesor_grado(profesor_id, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords,estado, grado) VALUES("+str(ids)+", '"+str(curp)+"', '"+str(nombre)+"', '"+str(ap_paterno)+"', '"+str(ap_materno)+"', "+str(edad)+", '"+str(telefono)+"', '"+str(correo_electronico)+"', '"+str(password)+"', '"+str(estado)+"', '"+str(grado)+"')")
			conexion.commit()	

def prof_especialista():
	with open('profesor_especialista.csv') as File:  
		reader = csv.reader(File)
		for row in reader:
			ids = int((row[0])) ### Clave ID INT
			curp = ((row[1])) ### CURP
			nombre = ((row[2])) ### Nombre
			ap_paterno = ((row[3])) ### Apellido paterno
			ap_materno = ((row[4])) ### Apellido materno
			edad = int((row[5])) ### edad
			telefono = ((row[6])) ### grado
			correo_electronico = (row[7])
			password = (row[8])
			estado = (row[9])
			grado = (row[10])
			materia = (row[11])
			cursor.execute("INSERT INTO profesor_especialista(profesor_id, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords,estado, grado, nombre_materia) VALUES("+str(ids)+", '"+str(curp)+"', '"+str(nombre)+"', '"+str(ap_paterno)+"', '"+str(ap_materno)+"', "+str(edad)+", '"+str(telefono)+"', '"+str(correo_electronico)+"', '"+str(password)+"', '"+str(estado)+"', '"+str(grado)+"', '"+str(materia)+"')")
			conexion.commit()


prof_especialista()
#carga_Estudiante()	
cursor.close()
conexion.close()