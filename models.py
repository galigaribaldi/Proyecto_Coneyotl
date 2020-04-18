import psycopg2

###Trae todos los datos correspondientes a los estudiants
def consulta_estudiantes(grado):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT * FROM estudiante where grado= %s",(grado,))
    datos_estudiantes = cursor.fetchall()
    #print(datos_estudiantes)
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos_estudiantes

##Consulta profesores por grado
def consulta_all_prof_grado():
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT * FROM profesor_grado")
    datos_profesor_grado = cursor.fetchall()
    #print(datos_estudiantes)
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos_profesor_grado

##Consulta profesor especialista
def consulta_all_prof_esp():
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT * FROM profesor_especialista")
    datos_profesor_especialista = cursor.fetchall()
    #print(datos_estudiantes)
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos_profesor_especialista

####Insertar datos a la tabla estudiantes
def insertarestud(estudiante_ID, curp,nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono_casa, telefono_celular,correo_electronico, passwords, dia_registro,estado):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("INSERT INTO estudiante(estudiante_ID, curp,nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono_casa, telefono_celular,correo_electronico, passwords, dia_registro,estado) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (estudiante_ID, curp,nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono_casa, telefono_celular,correo_electronico, passwords, dia_registro,estado))
    conexion.commit()
    cursor.close()
    conexion.close()

####Insertar datos a la tabla profesores
def insertarprof_grado(profesor_ID, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords,estado, grado):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("INSERT INTO profesor_grado(profesor_ID, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords,estado, grado) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (profesor_ID, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords,estado, grado))
    conexion.commit()
    cursor.close()
    conexion.close()

####Insertar datos a la tabla profesores Extracurriculares
def insertarprof_especialista(profesor_ID, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords,estado, grado, nombre_materia):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("INSERT INTO profesor_especialista(profesor_ID, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords,estado, grado, nombre_materia) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (profesor_ID, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords,estado, grado, nombre_materia))
    conexion.commit()
    cursor.close()
    conexion.close()

def insertamateria(materia_ID, nombre, estado, grado):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("INSERT INTO materia(materia_ID, nombre, estado, grado) VALUES(%s, %s, %s, %s)",(materia_ID, nombre, estado, grado))
    conexion.commit()
    cursor.close()
    conexion.close()

###Trae los datos de la materia inscrita pasandole como parametro
###El id del estudiante y el grado
def consulta_inscrita(est_id, grado):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT e.estudiante_ID, p.profesor_ID, m.materia_ID FROM estudiante e JOIN profesor_grado p ON e.grado=p.grado JOIN materia m ON m.grado=p.grado WHERE e.grado=%s and e.estudiante_ID=%s",(grado, est_id,))
    datos_materia_inscrita = cursor.fetchall()
    #print(datos_estudiantes)
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos_materia_inscrita

def consulta_inscrita2(est_id, prof_id,grado):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT  m.nombre,ig.calificacion_B1, ig.campo1_B1, ig.campo2_B1, ig.campo3_B1, ig.campo4_B1,ig.calificacion_B2, ig.campo1_B2, ig.campo2_B2, ig.campo3_B2, ig.campo4_B2,ig.calificacion_B3, ig.campo1_B3, ig.campo2_B3, ig.campo3_B3, ig.campo4_B3,ig.calificacion_B4, ig.campo1_B4, ig.campo2_B4, ig.campo3_B4, ig.campo4_B4,ig.calificacion_B5, ig.campo1_B5, ig.campo2_B5, ig.campo3_B5, ig.campo4_B5, ig.promedio, m.materia_ID, ig.profesor_ID FROM inscripcion_grado ig JOIN materia m ON m.materia_ID=ig.materia_ID where ig.estudiante_ID=%s and ig.profesor_ID=%s AND m.grado=%s",(est_id, prof_id ,grado,))
    datos_materia_inscrita = cursor.fetchall()
    #print(datos_estudiantes)
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos_materia_inscrita

###Trae el estudiante especificado en el grupo especificado
def consulta_estudiantes_id(est_id, grado):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT * FROM estudiante where estudiante_ID=%s and grado=%s",(est_id,grado,))
    datos_estudiantes = cursor.fetchall()
    #print(datos_estudiantes)
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos_estudiantes

##Trae todos lso datos correspondientes a los profesores de grado
def consulta_prof_grado():
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT * FROM profesor_grado")
    datos_prof_grado = cursor.fetchall()
    print(datos_prof_grado)
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos_prof_grado
##Trae todos los datos correspondientes a los porfesores especialistas
def consulta_prof_especialista():
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT * FROM profesor_especialista")
    datos_especialista = cursor.fetchall()
    print(datos_especialista)
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos_especialista

def consulta_prof_grado3(grado):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT * from profesor_grado where grado = %s", (grado,))
    c = cursor.fetchall()
    conexion.commit()
    cursor.close()
    conexion.close()
    return c    
def consulta_prof_grado2(grado):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT profesor_ID from profesor_grado where grado=%s", (grado,))
    c = cursor.fetchall()
    return (c[0][0])

def consulta_materias():
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT * FROM materia")
    datos_materia = cursor.fetchall()
    print(datos_materia)
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos_materia

def inscripcion_todos_estudiantes(grado):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT e.estudiante_ID, m.materia_ID , p.profesor_ID FROM estudiante e JOIN profesor_grado p ON e.grado=p.grado JOIN materia m ON m.grado=p.grado WHERE e.grado==%s", (grado,))
    join = cursor.fetchall() ###TRae una lista de tuplas
    for i in join:
        cursor.execute("INSERT INTO inscripcion_grado(estudiante_ID, materia_ID,profesor_ID) VALUES(%s, %s, %s)", (i[0],i[1], i[2],))
    conexion.commit()
    cursor.close()
    conexion.close()
####################################estudiantes
##Dar de Baja
def dar_baja_alumno(ids):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE estudiante SET estado = 'B' WHERE estudiante_ID = %s",(ids,))
    conexion.commit()
    cursor.close()
    conexion.close()

##Dar de Alta
def dar_alta_alumno(ids):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE estudiante SET estado = 'A' WHERE estudiante_ID = %s",(ids,))
    conexion.commit()
    cursor.close()
    conexion.close()

###Suspender
def suspender(ids):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE estudiante SET estado = 'S' WHERE estudiante_ID = %s",(ids,))
    conexion.commit()
    cursor.close()
    conexion.close()
#######################################################
###########################################Profesores#####################################
##Dar de Baja
def dar_baja_profesor_grado(ids):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE profesor_grado SET estado = 'B' WHERE profesor_ID = %s",(ids,))
    conexion.commit()
    cursor.close()
    conexion.close()

##Dar de Alta
def dar_alta_profesor_grado(ids):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE profesor_grado SET estado = 'A' WHERE profesor_ID = %s",(ids,))
    conexion.commit()
    cursor.close()
    conexion.close()
###Suspender
def suspender_profesor_grado(ids):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE profesor_grado SET estado = 'S' WHERE profesor_ID = %s",(ids,))
    conexion.commit()
    cursor.close()
    conexion.close()
##########################################################################################
####Profesor Especialista
##Dar de Baja
def dar_baja_profesor_es(ids):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE profesor_especialista SET estado = 'B' WHERE profesor_ID = %s",(ids,))
    conexion.commit()
    cursor.close()
    conexion.close()

##Dar de Alta
def dar_alta_profesor_es(ids):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE profesor_especialista SET estado = 'A' WHERE profesor_ID = %s",(ids,))
    conexion.commit()
    cursor.close()
    conexion.close()

###Suspender
def suspender_profesor_es(ids):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE profesor_especialista SET estado = 'S' WHERE profesor_ID = %s",(ids,))
    conexion.commit()
    cursor.close()
    conexion.close()

############################################################
def inscripcion_estudiante_ID(grado, e_ID):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT e.estudiante_ID, p.profesor_ID, m.materia_ID FROM estudiante e JOIN profesor_grado p ON e.grado=p.grado JOIN materia m ON m.grado=p.grado WHERE e.grado=%s and e.estudiante_ID=%s", (grado, e_ID,))
    join = cursor.fetchall() ###TRae una lista de tupla
    for i in join:
        cursor.execute("INSERT INTO inscripcion_grado(estudiante_ID, profesor_ID, materia_ID) VALUES(%s, %s, %s)", (i[0],i[1], i[2]),)
    conexion.commit()
    cursor.close()
    conexion.close()

def actualizar_alumno(nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono, estado, ids):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE estudiante SET nombre = %s, apellido_pat = %s, apellido_mat = %s, grado = %s, edad = %s, nombre_tutor = %s, telefono = %s, estado = %s WHERE estudiante_ID = %s",(nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor,telefono, estado, ids))
    conexion.commit()
    cursor.close()
    conexion.close()

def clave(grado):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT materia_ID FROM materia WHERE grado = %s", (grado,))
    datos = cursor.fetchall()
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos

def clave_prof_grado(grado):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("SELECT profesor_ID from profesor_grado WHERE grado= %s AND estado='A'", (grado,))
    datos = cursor.fetchall()
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos
##Calificaciones para le bimestre 1
def insertarcalificacion_Bimestre1(campo1_B1,campo2_B1,campo3_B1, campo4_B1,promedio, estudiante_ID, materia_ID, profesor_ID):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE inscripcion_grado SET campo1_B1=%s ,campo2_B1=%s, campo3_B1=%s, campo4_B1=%s, calificacion_B1=%s WHERE estudiante_ID =%s AND materia_ID=%s AND profesor_ID=%s", (campo1_B1,campo2_B1,campo3_B1, campo4_B1,promedio, estudiante_ID, materia_ID, profesor_ID))
    print("Lo hace")
    conexion.commit()
    cursor.close()
    conexion.close()

#Calificaciones para el bimestre 2
def insertarcalificacion_Bimestre2(campo1_B2,campo2_B2,campo3_B2, campo4_B2,promedio, estudiante_ID, materia_ID, profesor_ID):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE inscripcion_grado SET campo1_B2=%s ,campo2_B2=%s, campo3_B2=%s, campo4_B2=%s, calificacion_B2=%s WHERE estudiante_ID =%s AND materia_ID=%s AND profesor_ID=%s", (campo1_B2,campo2_B2,campo3_B2, campo4_B2,promedio, estudiante_ID, materia_ID, profesor_ID))
    conexion.commit()
    cursor.close()
    conexion.close()

#3Calificaciones para el bimestre 3
def insertarcalificacion_Bimestre3(campo1_B3,campo2_B3,campo3_B3, campo4_B3,promedio, estudiante_ID, materia_ID, profesor_ID):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE inscripcion_grado SET campo1_B3=%s ,campo2_B3=%s, campo3_B3=%s, campo4_B3=%s, calificacion_B3=%s WHERE estudiante_ID =%s AND materia_ID=%s AND profesor_ID=%s", (campo1_B3,campo2_B3,campo3_B3, campo4_B3,promedio, estudiante_ID, materia_ID, profesor_ID))
    conexion.commit()
    cursor.close()
    conexion.close()
##Calificaciones para el bimestre 4
def insertarcalificacion_Bimestre4(campo1_B4,campo2_B4,campo3_B4, campo4_B4,promedio, estudiante_ID, materia_ID, profesor_ID):
    conexion = psycopg2.connect(host="localhost", database="escuela", user="postgres", password="password")
    cursor = conexion.cursor()
    cursor.execute("UPDATE inscripcion_grado SET campo1_B4=%s ,campo2_B4=%s, campo3_B4=%s, campo4_B4=%s, calificacion_B4=%s WHERE estudiante_ID =%s AND materia_ID=%s AND profesor_ID=%s", (campo1_B4,campo2_B4,campo3_B4, campo4_B4,promedio, estudiante_ID, materia_ID, profesor_ID))
    conexion.commit()
    cursor.close()
    conexion.close()