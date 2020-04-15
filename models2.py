import sqlite3 as sql
def insertarcalificacion_Bimestre1(campo1_B1,campo2_B1,campo3_B1, campo4_B1,promedio, estudiante_ID, materia_ID, profesor_ID):
    con = sql.connect("DB/baseConeyotl.db")
    cursor = con.cursor()
    cursor.execute("UPDATE inscripcion_grado SET campo1_B1=? ,campo2_B1=?, campo3_B1=?, campo4_B1=?, calificacion_B1=? WHERE estudiante_ID =? AND materia_ID=? AND profesor_ID=?", (campo1_B1,campo2_B1,campo3_B1, campo4_B1,promedio, estudiante_ID, materia_ID, profesor_ID))
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