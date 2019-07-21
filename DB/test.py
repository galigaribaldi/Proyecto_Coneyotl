import sqlite3 as sql
con = sql.connect("baseConeyotl.db")
cursor = con.cursor()
###Alumnos
cursor.execute("SELECT * FROM estudiante where grado='6to'")
alumno = cursor.fetchall()
print(alumno)
###Profesores
cursor.execute("SELECT * FROM profesor_grado where grado='6to'")
prof = cursor.fetchall()
print(prof)
##materias
cursor.execute("SELECT m.materia_ID, e.estudiante_ID FROM materia m JOIN estudiante e ON e.grado=m.grado where e.grado='6to'")
materia = cursor.fetchall()
print("\n\n\n\nJoins entre materia y estudiante")
print(materia)
###Con join, para inscribir al alumno
#cursor.execute("SELECT e.grado, e.estudiante_ID,p.profesor_ID, m.materia_ID FROM estudiante e JOIN profesor_grado p ON e.grado=p.grado JOIN materia m ON m.grado=p.grado WHERE e.grado='6to'")
cursor.execute("SELECT e.grado, e.estudiante_ID,p.profesor_ID FROM estudiante e JOIN profesor_grado p ON e.grado=p.grado  WHERE e.grado='6to'")
join = cursor.fetchall()
print("\n\n\n\nJoins entre materia y profesor")
print(join)

cursor.execute("SELECT e.estudiante_ID, p.profesor_ID, m.materia_ID FROM estudiante e JOIN profesor_grado p ON e.grado=p.grado JOIN materia m ON m.grado=p.grado WHERE e.grado='6to' and e.estudiante_ID=16")
join = cursor.fetchall()
print("\n\n\n\nJoins entre materia, profesor y alumno")
for i in join:
    print(i[0])
    print(i[1])
    print(i[2])
    print(i)

print("Consulta dandole el ID del alumno, ID del profesor,ID de la materia ")
cursor.execute("SELECT * FROM inscripcion_grado WHERE estudiante_ID =26  and materia_ID=61 and profesor_ID=5")
con1 = cursor.fetchall()
print(con1)

print("ID del profesor")
cursor.execute("SELECT profesor_ID from profesor_grado where grado='2do'")
c = cursor.fetchall()
print(c)
print(c[0][0])

def consulta_inscrita2(est_id, prof_id,grado):
    con = sql.connect("baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("SELECT  m.nombre,ig.calificacion_B1, ig.campo1_B1, ig.campo2_B1, ig.campo3_B1, ig.campo4_B1,ig.calificacion_B2, ig.campo1_B2, ig.campo2_B2, ig.campo3_B2, ig.campo4_B2,ig.calificacion_B3, ig.campo1_B3, ig.campo2_B3, ig.campo3_B3, ig.campo4_B3,ig.calificacion_B4, ig.campo1_B4, ig.campo2_B4, ig.campo3_B4, ig.campo4_B4,ig.calificacion_B5, ig.campo1_B5, ig.campo2_B5, ig.campo3_B5, ig.campo4_B5 FROM inscripcion_grado ig JOIN materia m ON m.materia_ID=ig.materia_ID where ig.estudiante_ID=? and ig.profesor_ID=? AND m.grado=?",(est_id, prof_id ,grado,))
    datos_materia_inscrita = cursor.fetchall()
    #print(datos_estudiantes)
    con.commit()
    con.close()
    return datos_materia_inscrita
"""
b =int(input("est_id: "))
c = int(input("prof_id: "))
g = (input("grado: "))
d = consulta_inscrita2(b,c,g)
print(d)
"""
con.commit()
con.close()