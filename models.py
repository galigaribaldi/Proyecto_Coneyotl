import sqlite3 as sql

###Trae todos los datos correspondientes a los estudiants
def consulta_estudiantes():
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT * FROM estudiante")
    datos_estudiantes = cursor.fetchall()
    print(datos_estudiantes)
    con.commit()
    con.close()
    return datos_estudiantes

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

def consulta_estudiantes_id(id):
    pass

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

def consulta_materias():
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT * FROM materia")
    datos_materia = cursor.fetchall()
    print(datos_materia)
    con.commit()
    con.close()
    return datos_materia