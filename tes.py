import models as coneccion
""""
d = coneccion.valida_loggin_est("CUCD161223HDFRRGA0", "NULL")
print(d[0][0])
f = coneccion.valida_loggin_prof("CACI730227MDFRRM05", "mamey.c.c@hotmail.com")
print(f[0][0])
SACA870526HDFLRB07
eduardo_salazar@hotmail.com

K1=
mamey.c.c@hotmail.com
CACI730227MDFRRM05
1ro=
wonderwoman.h@hotmail.com
CARC880808MDFSML07
3ro=
magdaibaco@gmail.com
IACM640915MDFBLG00
5to=
jaff_any@hotmail.com
MEZJ800407MDFZNF02

"""
d = coneccion.grado_id(9000)
print(d)
def obtener_Rango(grado, nombre_materia, grado_profesor):
    if nombre_materia == "EDUCACIÓN FÍSICA":
        if grado_profesor== "KINDER":
            if grado == "K1":
                return 4
            if grado == "K2":
                return 4
            if grado == "K3":
                return 4
        if grado_profesor == "PRIMARIA":
            if grado == "1ro":
                return 5
            if grado == "2do":
                return 5
            if grado == "3ro":
                return 5
            if grado == "4to":
                return 5
            if grado == "5to":
                return 5
            if grado == "6to":
                return 5
        if grado_profesor== "KINDER-PRIMARIA":        
            if grado == "K1":
                return 4
            if grado == "K2":
                return 4
            if grado == "K3":
                return 4
            if grado == "1ro":
                return 5
            if grado == "2do":
                return 5
            if grado == "3ro":
                return 5
            if grado == "4to":
                return 5
            if grado == "5to":
                return 5
            if grado == "6to":
                return 5

    if nombre_materia == "MÚSICA":
        if grado_profesor== "KINDER":
            if grado == "K1":
                return 3
            if grado == "K2":
                return 3
            if grado == "K3":
                return 3
        if grado_profesor == "PRIMARIA":
            if grado == "1ro":
                return 6
            if grado == "2do":
                return 6
            if grado == "3ro":
                return 6
            if grado == "4to":
                return 6
            if grado == "5to":
                return 6
            if grado == "6to":
                return 6
        if grado_profesor== "KINDER-PRIMARIA":   
            if grado == "K1":
                return 3
            if grado == "K2":
                return 3
            if grado == "K3":
                return 3
            if grado == "1ro":
                return 6
            if grado == "2do":
                return 6
            if grado == "3ro":
                return 6
            if grado == "4to":
                return 6
            if grado == "5to":
                return 6
            if grado == "6to":
                return 6
    if nombre_materia == "ARTES PLÁSTICAS":
        if grado_profesor== "KINDER":
            if grado == "K1":
                return 3
            if grado == "K2":
                return 3
            if grado == "K3":
                return 3
        if grado_profesor == "PRIMARIA":
            if grado == "1ro":
                return 6
            if grado == "2do":
                return 6
            if grado == "3ro":
                return 6
            if grado == "4to":
                return 6
            if grado == "5to":
                return 6
            if grado == "6to":
                return 6
        if grado_profesor== "KINDER-PRIMARIA":   
            if grado == "K1":
                return 3
            if grado == "K2":
                return 3
            if grado == "K3":
                return 3
            if grado == "1ro":
                return 6
            if grado == "2do":
                return 6
            if grado == "3ro":
                return 6
            if grado == "4to":
                return 6
            if grado == "5to":
                return 6
            if grado == "6to":
                return 6
    if nombre_materia == "COMPUTACIÓN":
        if grado_profesor== "KINDER":
            if grado == "K1":
                return 5
            if grado == "K2":
                return 5
            if grado == "K3":
                return 5
        if grado_profesor == "PRIMARIA":
            if grado == "1ro":
                return 7
            if grado == "2do":
                return 7
            if grado == "3ro":
                return 8
            if grado == "4to":
                return 9
            if grado == "5to":
                return 9
            if grado == "6to":
                return 9
        if grado_profesor== "KINDER-PRIMARIA":        
            if grado == "K1":
                return 5
            if grado == "K2":
                return 5
            if grado == "K3":
                return 5
            if grado == "1ro":
                return 7
            if grado == "2do":
                return 7
            if grado == "3ro":
                return 8
            if grado == "4to":
                return 9
            if grado == "5to":
                return 9
            if grado == "6to":
                return 9
    if nombre_materia == "INGLÉS":
        if grado_profesor== "KINDER-PRIMARIA":        
            if grado == "K1":
                return 5
            if grado == "K2":
                return 5
            if grado == "K3":
                return 5
            if grado == "1ro":
                return 4
            if grado == "2do":
                return 4
            if grado == "3ro":
                return 4
            if grado == "4to":
                return 4
            if grado == "5to":
                return 4
            if grado == "6to":
                return 4
        if grado_profesor== "KINDER":
            if grado == "K3":
                return 5
        if grado_profesor == "PRIMARIA":
            if grado == "1ro":
                return 4
            if grado == "2do":
                return 4
            if grado == "3ro":
                return 4
            if grado == "4to":
                return 4
            if grado == "5to":
                return 4
            if grado == "6to":
                return 4
"""
d = coneccion.especialista_calif(124)
print(str(d[0][0]), str(d[0][1]))
obtener_Rango("K3", str(d[0][0]), str(d[0][1]))

datos = coneccion.consulta_estudiantes_id5("NULL", "CUCD161223HDFRRGA0")
print(datos[0][0])
print(datos[0][1])"""
print(obtener_Rango("1ro", "ARTES PLÁSTICAS", "KINDER-PRIMARIA"))