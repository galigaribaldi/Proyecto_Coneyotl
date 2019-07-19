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
con.commit()
con.close()