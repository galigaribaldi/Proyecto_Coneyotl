import psycopg2
from urllib.parse import urlparse
import os

DATABASE_URL=os.environ.get('HEROKU_POSTGRESQL_BLUE_URL')
result = urlparse(DATABASE_URL)

def consulta_estudiantes():
    conexion = psycopg2.connect(host=result.hostname, database=result.path[1:], user=result.username, password=result.password)
    cursor = conexion.cursor()
    cursor.execute("SELECT * FROM estudiante")
    datos_estudiantes = cursor.fetchall()
    conexion.commit()
    cursor.close()
    conexion.close()
    return datos_estudiantes

print(consulta_estudiantes()[0])