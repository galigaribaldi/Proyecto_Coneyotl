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
    cursor.execute("SELECT  m.nombre,ig.calificacion_B1, ig.campo1_B1, ig.campo2_B1, ig.campo3_B1, ig.campo4_B1,ig.calificacion_B2, ig.campo1_B2, ig.campo2_B2, ig.campo3_B2, ig.campo4_B2,ig.calificacion_B3, ig.campo1_B3, ig.campo2_B3, ig.campo3_B3, ig.campo4_B3,ig.calificacion_B4, ig.campo1_B4, ig.campo2_B4, ig.campo3_B4, ig.campo4_B4,ig.calificacion_B5, ig.campo1_B5, ig.campo2_B5, ig.campo3_B5, ig.campo4_B5 FROM inscripcion_grado ig JOIN materia m ON m.materia_ID=ig.materia_ID where ig.estudiante_ID=? and ig.profesor_ID=? AND m.grado=?",(est_id, prof_id ,grado,))
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

##Dar de Baja
def dar_baja_alumno(ids):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE estudiante SET estado = 'B' WHERE estudiante_ID = ?;",(ids,))
    datos_estudiantes = cursor.fetchall()
    con.commit()
    con.close()

##Dar de Alta
def dar_alta_alumno(ids):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE estudiante SET estado = 'A' WHERE estudiante_ID = ?;",(ids,))
    datos_estudiantes = cursor.fetchall()
    #print(datos_estudiantes)
    con.commit()
    con.close()
def inscripcion_estudiante_ID(grado, e_ID):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT e.estudiante_ID, p.profesor_ID, m.materia_ID FROM estudiante e JOIN profesor_grado p ON e.grado=p.grado JOIN materia m ON m.grado=p.grado WHERE e.grado=? and e.estudiante_ID=?", grado, e_ID)
    join = cursor.fetchall() ###TRae una lista de tupla
    for i in join:
        cursor.execute("INSERT INTO inscripcion_grado(estudiante_ID, materia_ID,profesor_ID) VALUES(?, ?, ?)", i[0],i[1], i[2])
    con.commit()
    con.close()