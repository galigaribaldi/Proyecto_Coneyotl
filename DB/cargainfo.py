# -*- coding: utf-8 -*-
import sqlite3
con = sqlite3.connect('baseConeyotl.db')
cursor = con.cursor()

carga = open("cargaCalifgrado.sql",'r') ##abrimos nuestro archivo en modo lectura

for i in carga:
    print(i)
    cursor.execute(i)

#linea = carga.readline()
#print(linea)
#cursor.execute('''INSERT INTO estudiante VALUES(10000, 'Dafne Cabrera Garibaldi', 'Su casa', 10, '4to primaria')''')
con.commit()
con.close()
carga.close()