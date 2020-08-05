"""import psycopg2
import expresiones as obtener
import os
from datetime import date
import datetime
###Credenciales
##Obtener datos desde la DATABASE URL
DATABASE_URL=os.environ.get('DATABASE_URL')
if DATABASE_URL == None:
    print("Variable de entorno no definida!")
    exit()
du =str(DATABASE_URL)
print("DATABASE_URL: ", du)
host =obtener.gethost(du)
print("HOST: ", host)
database =obtener.getdbname(du)
print("DATABASE: ", database)
user =obtener.getuser(du)
print("User: ", user)
password =obtener.getpass(du)
print("Password: ", password)


def traer_calificaciones_materias_Bimestral(ids, opcion):
    conexion = psycopg2.connect(host=host, database=database, user=user, password=password)
    cursor = conexion.cursor()
    if opcion == 'B1':
        cursor.execute("select e.nombre,m.nombre,i.campo1_b1, i.campo2_b1, i.campo3_b1, i.campo4_b1, i.calificacion_b1 from inscripcion_grado i join estudiante e on e.estudiante_id=i.estudiante_id join materia m on m.materia_id=i.materia_id where e.estudiante_id=%s", (ids,))
        datos = cursor.fetchall()
    if opcion == 'B2':
        cursor.execute("select e.nombre,m.nombre,i.campo1_b2, i.campo2_b2, i.campo3_b2, i.campo4_b2, i.calificacion_b2 from inscripcion_grado i join estudiante e on e.estudiante_id=i.estudiante_id join materia m on m.materia_id=i.materia_id where e.estudiante_id=%s", (ids,))
        datos = cursor.fetchall()
    if opcion == 'B3':
        cursor.execute("select e.nombre,m.nombre,i.campo1_b3, i.campo2_b3, i.campo3_b3, i.campo4_b3, i.calificacion_b3 from inscripcion_grado i join estudiante e on e.estudiante_id=i.estudiante_id join materia m on m.materia_id=i.materia_id where e.estudiante_id=%s", (ids,))
        datos = cursor.fetchall()
    if opcion == 'B4':
        cursor.execute("select e.nombre,m.nombre,i.campo1_b4, i.campo2_b4, i.campo3_b4, i.campo4_b4, i.calificacion_b4 from inscripcion_grado i join estudiante e on e.estudiante_id=i.estudiante_id join materia m on m.materia_id=i.materia_id where e.estudiante_id=%s", (ids,))
        datos = cursor.fetchall()
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos
"""