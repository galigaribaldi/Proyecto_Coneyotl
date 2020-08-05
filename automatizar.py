import models as coneccion
import correo as enviar
import generador_img as img
import generar_PDF as PDF
import os
#########################################Alumnos#############################################
##Automatizacion de correos con imagenes a alumnos
def automatico(grado, cuerpo, asunto):
    lista = coneccion.correos_estudiante(grado)
    for i in lista:
        img.generar_imagen(i[0],i[1],i[2], cuerpo,i[3],i[4])
        print("Mensaje enviado")
        #enviar.enviar_correo_img('galigaribaldi0@gmail.com', asunto)
        enviar.enviar_correo_img(i[4], asunto)

##Automatizacion de correos solo texto a alumnos
def automatico_txt(grado, cuerpo, asunto):
    lista = coneccion.correos_estudiante(grado)
    for i in lista:
        print("Mensaje enviado")
        #enviar.enviar_correo('galigaribaldi0@gmail.com',cuerpo ,asunto)
        enviar.enviar_correo(i[4], cuerpo ,asunto)
##Envio de correo Electronico con el PDF de Datos a alumno de un grado de la escuela #####
def automatico_Correo_PDF_grado_kid(grado, asunto):
    lista = coneccion.correos_estudiante(grado)
    for i in lista:
        PDF.generar_nuevo_pdf((i[0], i[1], i[2], i[3], i[4]))
        #enviar.enviar_correo_PDF('galigaribaldi0@gmail.com', asunto, "Datos"+str(i[0])+".pdf")
        enviar.enviar_correo_PDF(i[4], asunto, "Datos"+str(i[0])+".pdf")
        print("PDF enviado")
    os.system('rm *.pdf')

##########################################################################################

#########################Profesores#######################################
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
        #enviar.enviar_correo('galigaribaldi0@gmail.com',cuerpo ,asunto)    
        enviar.enviar_correo(i[4],cuerpo ,asunto)

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
        #enviar.enviar_correo('galigaribaldi0@gmail.com',cuerpo ,asunto)
        enviar.enviar_correo(i[4],cuerpo ,asunto)    
#######################################################################

########## Envio de correo Electronico con el PDF de Datos ##########
def automatico_Correo_PDF_individual(Nombre, ap_pat, ap_mat,Curp,correo, asunto):
    PDF.generar_nuevo_pdf((Nombre, ap_pat, ap_mat,Curp,correo))
    #enviar.enviar_correo_PDF('galigaribaldi0@gmail.com', asunto, "Datos"+str(Nombre)+".pdf")
    enviar.enviar_correo_PDF(i[4], asunto, "Datos"+str(i[0])+".pdf")
    print("PDF enviado")
    os.system('rm *.pdf')
###########

def automatico_Correo_PDF_grado_kid(grado, asunto):
    lista = coneccion.correos_estudiante(grado)
    for i in lista:
        PDF.generar_nuevo_pdf((i[0], i[1], i[2], i[3], i[4]))
        #enviar.enviar_correo_PDF('galigaribaldi0@gmail.com', asunto, "Datos"+str(i[0])+".pdf")
        enviar.enviar_correo_PDF(i[4], asunto, "Datos"+str(i[0])+".pdf")
        print("PDF enviado")
    os.system('rm *.pdf')

########## Envio de correo Electronico con el PDF de Datos a profesores Especialistas##########
def automatico_Correo_PDF_prof_especialistas(asunto):
    lista = coneccion.correos_prof_especialista()
    for i in lista:
        PDF.generar_nuevo_pdf((i[0], i[1], i[2], i[3], i[4]))
        #enviar.enviar_correo_PDF('galigaribaldi0@gmail.com', asunto, "Datos"+str(i[0])+".pdf")
        enviar.enviar_correo_PDF(i[4], asunto, "Datos"+str(i[0])+".pdf")
        print("PDF enviado")
    os.system('rm *.pdf')
###########

########## Envio de correo Electronico con el PDF de Datos a Profesores de Grado##########
def automatico_Correo_PDF_prof_grado(asunto):
    lista = coneccion.correos_profesor_grado()
    for i in lista:
        PDF.generar_nuevo_pdf((i[0], i[1], i[2], i[3], i[4]))
        #enviar.enviar_correo_PDF('galigaribaldi0@gmail.com', asunto, "Datos"+str(i[0])+".pdf")
        enviar.enviar_correo_PDF(i[4], asunto, "Datos"+str(i[0])+".pdf")
        print("PDF enviado")
    os.system('rm *.pdf')
    
###########
#automatico_Correo_PDF_grado_kid('1ro', 'Asunto')
#automatico_Correo_PDF_prof_grado('Asunto')