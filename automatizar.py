import models as coneccion
import correo as enviar
import generador_img as img

#########################Alumnos######################################
##Automatizacion de correos con imagenes a alumnos
def automatico(grado, cuerpo, asunto):
    lista = coneccion.correos_estudiante(grado)
    for i in lista:
        img.generar_imagen(i[0],i[1],i[2], cuerpo,i[3],i[4])
        print("Mensaje enviado")
        enviar.enviar_correo_img('galigaribaldi0@gmail.com', asunto)

##Automatizacion de correos solo texto a alumnos
def automatico_txt(grado, cuerpo, asunto):
    lista = coneccion.correos_estudiante(grado)
    for i in lista:
        print("Mensaje enviado")
        enviar.enviar_correo('galigaribaldi0@gmail.com',cuerpo ,asunto)    
#######################################################################

#########################Profesores######################################
##Automatizacion de correos con imagenes a profesores de grado
def automatico_prof_grado(cuerpo, asunto):
    lista = coneccion.correos_profesor_grado()
    for i in lista:
        img.generar_imagen(i[0],i[1],i[2], cuerpo,i[3],i[4])
        print("Mensaje enviado")
        enviar.enviar_correo_img('galigaribaldi0@gmail.com', asunto)        
        #enviar.enviar_correo_img(i[4], asunto)

##Automatizacion de correos con solo texto a profesores de grado
def automatico_prof_grado_txt(cuerpo, asunto):
    lista = coneccion.correos_profesor_grado()
    for i in lista:
        print("Mensaje enviado")
        enviar.enviar_correo('galigaribaldi0@gmail.com',cuerpo ,asunto)    
        #enviar.enviar_correo_img(i[4], asunto)

##Automatizacion de Correos con imahenes a profesores Especialistas
def automatico_prof_especialistas(cuerpo, asunto):
    lista = coneccion.correos_prof_especialista()
    for i in lista:
        img.generar_imagen(i[0],i[1],i[2], cuerpo,i[3],i[4])
        print("Mensaje enviado")
        enviar.enviar_correo_img('galigaribaldi0@gmail.com', asunto)        
        #enviar.enviar_correo_img(i[4], asunto)

##Automatizacion de Correos con texto a profesores Especialistas
def automatico_prof_especialistas_txt(cuerpo, asunto):
    lista = coneccion.correos_prof_especialista()
    for i in lista:
        img.generar_imagen(i[0],i[1],i[2], cuerpo,i[3],i[4])
        print("Mensaje enviado")
        enviar.enviar_correo('galigaribaldi0@gmail.com',cuerpo ,asunto)    
#######################################################################