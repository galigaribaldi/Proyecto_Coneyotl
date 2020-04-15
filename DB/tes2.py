import sqlite3 as sql
def insertarcalificacion_Bimestre1(campo1_B1,campo2_B1,campo3_B1, campo4_B1,promedio, estudiante_ID, materia_ID, profesor_ID):
    con = sql.connect("baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE inscripcion_grado SET campo1_B1=? ,campo2_B1=?, campo3_B1=?, campo4_B1=?, calificacion_B1=? WHERE estudiante_ID =? AND materia_ID=? AND profesor_ID=?", (campo1_B1,campo2_B1,campo3_B1, campo4_B1,promedio, estudiante_ID, materia_ID, profesor_ID))
    con.commit()
    con.close()
