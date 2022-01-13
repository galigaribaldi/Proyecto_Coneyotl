import Old.models as coneccion
#promedio1 = coneccion.promedio_b1(1106,'5to')
#promedio2 = coneccion.promedio_b2(1106,'5to')
##promedio3 = coneccion.promedio_b3(1106,'5to')
#promedio4 = coneccion.promedio_b4(1106,'5to')
#promedio_t = coneccion.promedio_total(1106, '5to')
import util.correo as correos

def sacar1(b):
    res = 0
    contador = 0
    for i in b:
        #print(i[0])
        res = i[0] + res
        contador = contador+1
    #print(res+10)
    #print(contador)
    print("Promedio: ", (res)/contador)

def sacar2(b):
    res = 0
    contador = 0
    for i in b:
        #print(i[0])
        res = i[0] + res
        contador = contador+1
    #print(res+10)
    #print(contador)
    print("Promedio:", (res+10)/contador)
#sacar1(promedio4)
#sacar1(promedio2)
#sacar1(promedio1)
#sacar1(promedio3)
#sacar1(promedio_t)
#print(promedio1)
#f = coneccion.sacar_promedio(coneccion.promedio_b1(1106,'5to'))
#print(f)
"""
coneccion.actualiza_promedio(1106,'5to', 1, coneccion.sacar_promedio(coneccion.promedio_b1(1106,'5to')))
coneccion.actualiza_promedio(1106,'5to', 2, coneccion.sacar_promedio(coneccion.promedio_b2(1106,'5to')))
coneccion.actualiza_promedio(1106,'5to', 3, coneccion.sacar_promedio(coneccion.promedio_b3(1106,'5to')))
coneccion.actualiza_promedio(1106,'5to', 4, coneccion.sacar_promedio(coneccion.promedio_b4(1106,'5to')))
coneccion.actualiza_promedio(1106,'5to', 5, coneccion.sacar_promedio(coneccion.promedio_total(1106,'5to')))
"""

#job = q.enqueue(coneccion.actualiza_promedios_All,id_estudiante, grado, coneccion.sacar_promedio(coneccion.promedio_b1(id_estudiante, grado)),coneccion.sacar_promedio(coneccion.promedio_b2(id_estudiante, grado)), coneccion.sacar_promedio(coneccion.promedio_b3(id_estudiante, grado)), coneccion.sacar_promedio(coneccion.promedio_b4(id_estudiante, grado)), coneccion.sacar_promedio(coneccion.promedio_total(id_estudiante, grado)))

def inscribe():
    uno = coneccion.ejecuta()
    #print(len(uno))
    for i in range(len(uno)):
        id_estudiante=(uno[i][0]) #Clave interna
        grado=(uno[i][1]) #grado
        print(id_estudiante, grado)
        if id_estudiante==9000011:
            print("Prueba")
        else:
            coneccion.actualiza_promedios_All(id_estudiante, grado, coneccion.sacar_promedio(coneccion.promedio_b1(id_estudiante, grado)),coneccion.sacar_promedio(coneccion.promedio_b2(id_estudiante, grado)), coneccion.sacar_promedio(coneccion.promedio_b3(id_estudiante, grado)), coneccion.sacar_promedio(coneccion.promedio_b4(id_estudiante, grado)), coneccion.sacar_promedio(coneccion.promedio_total(id_estudiante, grado)))
        print("Actualizado")
#inscribe()