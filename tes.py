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
                print("Es el profesor de " +str(nombre_materia)+" dando K1")            
            if grado == "K2":
                print("Es el profesor de " +str(nombre_materia)+" dando K2")            
            if grado == "K3":
                print("Es el profesor de " +str(nombre_materia)+" dando K3")
        if grado_profesor == "PRIMARIA":
            if grado == "1ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 1ro")
            if grado == "2do":
                print("Es el profesor de " +str(nombre_materia)+" dando 2do")
            if grado == "3ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 3ro")
            if grado == "4to":
                print("Es el profesor de " +str(nombre_materia)+" dando 4to")
            if grado == "5to":
                print("Es el profesor de " +str(nombre_materia)+" dando 5to")
            if grado == "6to":
                print("Es el profesor de " +str(nombre_materia)+" dando 6to")        
        if grado_profesor== "KINDER-PRIMARIA":        
            if grado == "K1":
                print("Es el profesor de " +str(nombre_materia)+" dando K1")
            if grado == "K2":
                print("Es el profesor de " +str(nombre_materia)+" dando K2")        
            if grado == "K3":
                print("Es el profesor de " +str(nombre_materia)+" dando K3")
            if grado == "1ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 1ro")
            if grado == "2do":
                print("Es el profesor de " +str(nombre_materia)+" dando 2do")
            if grado == "3ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 3ro")
            if grado == "4to":
                print("Es el profesor de " +str(nombre_materia)+" dando 4to")
            if grado == "5to":
                print("Es el profesor de " +str(nombre_materia)+" dando 5to")
            if grado == "6to":
                print("Es el profesor de " +str(nombre_materia)+" dando 6to")

    if nombre_materia == "MÚSICA":
        if grado_profesor== "KINDER":
            if grado == "K1":
                print("Es el profesor de " +str(nombre_materia)+" dando K1")            
            if grado == "K2":
                print("Es el profesor de " +str(nombre_materia)+" dando K2")            
            if grado == "K3":
                print("Es el profesor de " +str(nombre_materia)+" dando K3")
        if grado_profesor == "PRIMARIA":
            if grado == "1ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 1ro")
            if grado == "2do":
                print("Es el profesor de " +str(nombre_materia)+" dando 2do")
            if grado == "3ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 3ro")
            if grado == "4to":
                print("Es el profesor de " +str(nombre_materia)+" dando 4to")
            if grado == "5to":
                print("Es el profesor de " +str(nombre_materia)+" dando 5to")
            if grado == "6to":
                print("Es el profesor de " +str(nombre_materia)+" dando 6to")        
        if grado_profesor== "KINDER-PRIMARIA":   
            if grado == "K1":
                print("Es el profesor de " +str(nombre_materia)+" dando K1")
            if grado == "K2":
                print("Es el profesor de " +str(nombre_materia)+" dando K2")        
            if grado == "K3":
                print("Es el profesor de " +str(nombre_materia)+" dando K3")
            if grado == "1ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 1ro")
            if grado == "2do":
                print("Es el profesor de " +str(nombre_materia)+" dando 2do")
            if grado == "3ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 3ro")
            if grado == "4to":
                print("Es el profesor de " +str(nombre_materia)+" dando 4to")
            if grado == "5to":
                print("Es el profesor de " +str(nombre_materia)+" dando 5to")
            if grado == "6to":
                print("Es el profesor de " +str(nombre_materia)+" dando 6to")

    if nombre_materia == "COMPUTACIÓN":
        if grado_profesor== "KINDER":
            if grado == "K1":
                print("Es el profesor de " +str(nombre_materia)+" dando K1")            
            if grado == "K2":
                print("Es el profesor de " +str(nombre_materia)+" dando K2")            
            if grado == "K3":
                print("Es el profesor de " +str(nombre_materia)+" dando K3")
        if grado_profesor == "PRIMARIA":
            if grado == "1ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 1ro")
            if grado == "2do":
                print("Es el profesor de " +str(nombre_materia)+" dando 2do")
            if grado == "3ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 3ro")
            if grado == "4to":
                print("Es el profesor de " +str(nombre_materia)+" dando 4to")
            if grado == "5to":
                print("Es el profesor de " +str(nombre_materia)+" dando 5to")
            if grado == "6to":
                print("Es el profesor de " +str(nombre_materia)+" dando 6to")        
        if grado_profesor== "KINDER-PRIMARIA":        
            if grado == "K1":
                print("Es el profesor de " +str(nombre_materia)+" dando K1")
            if grado == "K2":
                print("Es el profesor de " +str(nombre_materia)+" dando K2")        
            if grado == "K3":
                print("Es el profesor de " +str(nombre_materia)+" dando K3")
            if grado == "1ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 1ro")
            if grado == "2do":
                print("Es el profesor de " +str(nombre_materia)+" dando 2do")
            if grado == "3ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 3ro")
            if grado == "4to":
                print("Es el profesor de " +str(nombre_materia)+" dando 4to")
            if grado == "5to":
                print("Es el profesor de " +str(nombre_materia)+" dando 5to")
            if grado == "6to":
                print("Es el profesor de " +str(nombre_materia)+" dando 6to")
    if nombre_materia == "INGLÉS":
        if grado_profesor== "KINDER-PRIMARIA":        
            if grado == "K1":
                print("Es el profesor de " +str(nombre_materia)+" dando K1")
            if grado == "K2":
                print("Es el profesor de " +str(nombre_materia)+" dando K2")        
            if grado == "K3":
                print("Es el profesor de " +str(nombre_materia)+" dando K3")
            if grado == "1ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 1ro")
            if grado == "2do":
                print("Es el profesor de " +str(nombre_materia)+" dando 2do")
            if grado == "3ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 3ro")
            if grado == "4to":
                print("Es el profesor de " +str(nombre_materia)+" dando 4to")
            if grado == "5to":
                print("Es el profesor de " +str(nombre_materia)+" dando 5to")
            if grado == "6to":
                print("Es el profesor de " +str(nombre_materia)+" dando 6to")        
        if grado_profesor== "KINDER":
            if grado == "K3":
                print("Es el profesor de " +str(nombre_materia)+" dando K3")
        if grado_profesor == "PRIMARIA":
            if grado == "1ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 1ro")
            if grado == "2do":
                print("Es el profesor de " +str(nombre_materia)+" dando 2do")
            if grado == "3ro":
                print("Es el profesor de " +str(nombre_materia)+" dando 3ro")
            if grado == "4to":
                print("Es el profesor de " +str(nombre_materia)+" dando 4to")
            if grado == "5to":
                print("Es el profesor de " +str(nombre_materia)+" dando 5to")
            if grado == "6to":
                print("Es el profesor de " +str(nombre_materia)+" dando 6to")

d = coneccion.especialista_calif(124)
print(str(d[0][0]), str(d[0][1]))
obtener_Rango("K3", str(d[0][0]), str(d[0][1]))

datos = coneccion.consulta_estudiantes_id5("NULL", "CUCD161223HDFRRGA0")
print(datos[0][0])
print(datos[0][1])