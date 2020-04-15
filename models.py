import sqlite3 as sql

###Trae todos los datos correspondientes a los estudiants
def consulta_estudiantes(grado):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT * FROM estudiante where grado=?",(grado,))
    datos_estudiantes = cursor.fetchall()
    #print(datos_estudiantes)
    con.commit()
    con.close()
    return datos_estudiantes

##Consulta profesores por grado
def consulta_all_prof_grado():
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT * FROM profesor_grado")
    datos_profesor_grado = cursor.fetchall()
    #print(datos_estudiantes)
    con.commit()
    con.close()
    return datos_profesor_grado

##Consulta profesor especialista
def consulta_all_prof_esp():
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT * FROM profesor_especialista")
    datos_profesor_especialista = cursor.fetchall()
    #print(datos_estudiantes)
    con.commit()
    con.close()
    return datos_profesor_especialista

####Insertar datos a la tabla estudiantes
def insertarestud(estudiante_ID, nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono, estado):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("INSERT INTO estudiante(estudiante_ID, nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono, estado) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)", (estudiante_ID, nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono, estado))
    con.commit()
    con.close()

####Insertar datos a la tabla profesores
def insertarprof_grado(profesor_ID, nombre, apellido_pat, apellido_mat,edad, telefono, estado, grado):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("INSERT INTO profesor_grado(profesor_ID, nombre, apellido_pat, apellido_mat,edad, telefono, estado, grado) VALUES(?, ?, ?, ?, ?, ?, ?, ?)", (profesor_ID, nombre, apellido_pat, apellido_mat,edad, telefono, estado, grado))
    con.commit()
    con.close()

def insertamateria(materia_ID, nombre, estado):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("INSERT INTO materia(materia_ID, nombre, estado) VALUES(?, ?, ?)",(materia_ID, nombre, estado))
    con.commit()
    con.close()

###Trae los datos de la materia inscrita pasandole como parametro
###El id del estudiante y el grado
def consulta_inscrita(est_id, grado):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT e.estudiante_ID, p.profesor_ID, m.materia_ID FROM estudiante e JOIN profesor_grado p ON e.grado=p.grado JOIN materia m ON m.grado=p.grado WHERE e.grado=? and e.estudiante_ID=?",(grado, est_id,))
    datos_materia_inscrita = cursor.fetchall()
    #print(datos_estudiantes)
    con.commit()
    con.close()
    return datos_materia_inscrita
def consulta_inscrita2(est_id, prof_id,grado):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT  m.nombre,ig.calificacion_B1, ig.campo1_B1, ig.campo2_B1, ig.campo3_B1, ig.campo4_B1,ig.calificacion_B2, ig.campo1_B2, ig.campo2_B2, ig.campo3_B2, ig.campo4_B2,ig.calificacion_B3, ig.campo1_B3, ig.campo2_B3, ig.campo3_B3, ig.campo4_B3,ig.calificacion_B4, ig.campo1_B4, ig.campo2_B4, ig.campo3_B4, ig.campo4_B4,ig.calificacion_B5, ig.campo1_B5, ig.campo2_B5, ig.campo3_B5, ig.campo4_B5, ig.promedio, m.materia_ID, ig.profesor_ID FROM inscripcion_grado ig JOIN materia m ON m.materia_ID=ig.materia_ID where ig.estudiante_ID=? and ig.profesor_ID=? AND m.grado=?",(est_id, prof_id ,grado,))
    datos_materia_inscrita = cursor.fetchall()
    #print(datos_estudiantes)
    con.commit()
    con.close()
    return datos_materia_inscrita

###Trae el estudiante especificado en el grupo especificado
def consulta_estudiantes_id(est_id, grado):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT * FROM estudiante where estudiante_ID=? and grado=?",(est_id,grado,))
    datos_estudiantes = cursor.fetchall()
    #print(datos_estudiantes)
    con.commit()
    con.close()
    return datos_estudiantes

##Trae todos lso datos correspondientes a los profesores de grado
def consulta_prof_grado():
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT * FROM profesor_grado")
    datos_prof_grado = cursor.fetchall()
    print(datos_prof_grado)
    con.commit()
    con.close()
    return datos_prof_grado
##Trae todos los datos correspondientes a los porfesores especialistas
def consulta_prof_especialista():
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT * FROM profesor_especialista")
    datos_especialista = cursor.fetchall()
    print(datos_especialista)
    con.commit()
    con.close()
    return datos_especialista

def consulta_prof_grado3(grado):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT * from profesor_grado where grado = ?", (grado,))
    c = cursor.fetchall()
    return c    
def consulta_prof_grado2(grado):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT profesor_ID from profesor_grado where grado=?", (grado,))
    c = cursor.fetchall()
    return (c[0][0])

def consulta_materias():
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT * FROM materia")
    datos_materia = cursor.fetchall()
    print(datos_materia)
    con.commit()
    con.close()
    return datos_materia

def inscripcion_todos_estudiantes(grado):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT e.estudiante_ID, m.materia_ID , p.profesor_ID FROM estudiante e JOIN profesor_grado p ON e.grado=p.grado JOIN materia m ON m.grado=p.grado WHERE e.grado==?", (grado,))
    join = cursor.fetchall() ###TRae una lista de tuplas
    for i in join:
        cursor.execute("INSERT INTO inscripcion_grado(estudiante_ID, materia_ID,profesor_ID) VALUES(?, ?, ?)", (i[0],i[1], i[2],))
    con.commit()
    con.close()
####################################estudiantes
##Dar de Baja
def dar_baja_alumno(ids):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE estudiante SET estado = 'B' WHERE estudiante_ID = ?",(ids,))
    con.commit()
    con.close()

##Dar de Alta
def dar_alta_alumno(ids):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE estudiante SET estado = 'A' WHERE estudiante_ID = ?",(ids,))
    con.commit()
    con.close()

###Suspender
def suspender(ids):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE estudiante SET estado = 'S' WHERE estudiante_ID = ?",(ids,))
    con.commit()
    con.close()
#######################################################
###########################################Profesores#####################################
##Dar de Baja
def dar_baja_profesor_grado(ids):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE profesor_grado SET estado = 'B' WHERE profesor_ID = ?",(ids,))
    con.commit()
    con.close()

##Dar de Alta
def dar_alta_profesor_grado(ids):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE profesor_grado SET estado = 'A' WHERE profesor_ID = ?",(ids,))
    con.commit()
    con.close()

###Suspender
def suspender_profesor_grado(ids):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE profesor_grado SET estado = 'S' WHERE profesor_ID = ?",(ids,))
    con.commit()
    con.close()
##########################################################################################
####Profesor Especialista
##Dar de Baja
def dar_baja_profesor_es(ids):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE profesor_especialista SET estado = 'B' WHERE profesor_ID = ?",(ids,))
    con.commit()
    con.close()

##Dar de Alta
def dar_alta_profesor_es(ids):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE profesor_especialista SET estado = 'A' WHERE profesor_ID = ?",(ids,))
    con.commit()
    con.close()

###Suspender
def suspender_profesor_es(ids):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE profesor_especialista SET estado = 'S' WHERE profesor_ID = ?",(ids,))
    con.commit()
    con.close()

############################################################
def inscripcion_estudiante_ID(grado, e_ID):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT e.estudiante_ID, p.profesor_ID, m.materia_ID FROM estudiante e JOIN profesor_grado p ON e.grado=p.grado JOIN materia m ON m.grado=p.grado WHERE e.grado=? and e.estudiante_ID=?", (grado, e_ID,))
    join = cursor.fetchall() ###TRae una lista de tupla
    for i in join:
        cursor.execute("INSERT INTO inscripcion_grado(estudiante_ID, profesor_ID, materia_ID) VALUES(?, ?, ?)", (i[0],i[1], i[2]),)
    con.commit()
    con.close()

def actualizar_alumno(nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono, estado, ids):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE estudiante SET nombre = ?, apellido_pat = ?, apellido_mat = ?, grado = ?, edad = ?, nombre_tutor = ?, telefono = ?, estado = ? WHERE estudiante_ID = ?",(nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor,telefono, estado, ids))
    con.commit()
    con.close()

def clave(grado):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT materia_ID FROM materia WHERE grado = ?", (grado,))
    datos = cursor.fetchall()
    con.commit()
    con.close()
    return datos

def clave_prof_grado(grado):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT profesor_ID from profesor_grado WHERE grado= ? AND estado='A'", (grado,))
    datos = cursor.fetchall()
    con.commit()
    con.close()
    return datos
##Calificaciones para le bimestre 1
def insertarcalificacion_Bimestre1(campo1_B1,campo2_B1,campo3_B1, campo4_B1,promedio, estudiante_ID, materia_ID, profesor_ID):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE inscripcion_grado SET campo1_B1=? ,campo2_B1=?, campo3_B1=?, campo4_B1=?, calificacion_B1=? WHERE estudiante_ID =? AND materia_ID=? AND profesor_ID=?", (campo1_B1,campo2_B1,campo3_B1, campo4_B1,promedio, estudiante_ID, materia_ID, profesor_ID))
    print("Lo hace")
    con.commit()
    con.commit()
    con.close()

#Calificaciones para el bimestre 2
def insertarcalificacion_Bimestre2(campo1_B2,campo2_B2,campo3_B2, campo4_B2,promedio, estudiante_ID, materia_ID, profesor_ID):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE inscripcion_grado SET campo1_B2=? ,campo2_B2=?, campo3_B2=?, campo4_B2=?, calificacion_B2=? WHERE estudiante_ID =? AND materia_ID=? AND profesor_ID=?", (campo1_B2,campo2_B2,campo3_B2, campo4_B2,promedio, estudiante_ID, materia_ID, profesor_ID))
    con.commit()
    con.close()

#3Calificaciones para el bimestre 3
def insertarcalificacion_Bimestre3(campo1_B3,campo2_B3,campo3_B3, campo4_B3,promedio, estudiante_ID, materia_ID, profesor_ID):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE inscripcion_grado SET campo1_B3=? ,campo2_B3=?, campo3_B3=?, campo4_B3=?, calificacion_B3=? WHERE estudiante_ID =? AND materia_ID=? AND profesor_ID=?", (campo1_B3,campo2_B3,campo3_B3, campo4_B3,promedio, estudiante_ID, materia_ID, profesor_ID))
    con.commit()
    con.close()
##Calificaciones para el bimestre 4
def insertarcalificacion_Bimestre4(campo1_B4,campo2_B4,campo3_B4, campo4_B4,promedio, estudiante_ID, materia_ID, profesor_ID):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE inscripcion_grado SET campo1_B4=? ,campo2_B4=?, campo3_B4=?, campo4_B4=?, calificacion_B4=? WHERE estudiante_ID =? AND materia_ID=? AND profesor_ID=?", (campo1_B4,campo2_B4,campo3_B4, campo4_B4,promedio, estudiante_ID, materia_ID, profesor_ID))
    con.commit()
    con.close()