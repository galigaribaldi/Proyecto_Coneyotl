#from reportlab.pdfgen import canvas
#c = canvas.Canvas("hola-mundo.pdf")
#c.drawString(50, 50, "¡Hola, mundo!")
#c.save()
import time
from reportlab.lib.enums import TA_JUSTIFY
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch

def generar_nuevo_pdf(tupla):
    doc = SimpleDocTemplate("Datos"+str(tupla[0])+".pdf", pagesize=letter, rightMargin=72, leftMargin=72, topMargin=72, bottomMargin=18)
    Story = []
    logotipo = "img/Logo2.png"
    formatoFecha = time.ctime()
    nombreCompleto = "Colegio Coneyotl - Piltzintli"
    partesDeDireccion = [""]
    nombrePersona=str(tupla[0]+" "+tupla[1]+" "+tupla[2])
    imagen = Image(logotipo, 1 * inch, 1 * inch)
    Story.append(imagen)
    estilos = getSampleStyleSheet()
    estilos.add(ParagraphStyle(name='Justify', alignment=TA_JUSTIFY))
    texto = '%s' % formatoFecha
    Story.append(Paragraph(texto, estilos["Normal"]))
    Story.append(Spacer(1, 12))
    # Se construye la dirección
    texto = '%s' % nombreCompleto
    Story.append(Paragraph(texto, estilos["Normal"]))
    for part in partesDeDireccion:
        texto = '%s' % part.strip()
        Story.append(Paragraph(texto, estilos["Normal"]))
        Story.append(Spacer(1, 12))
        texto = 'Estimad@ %s:' % nombrePersona #.split()[0].strip()
        Story.append(Paragraph(texto, estilos["Normal"]))
        Story.append(Spacer(1, 12))
        texto = "Sea bienvenido a este ciclo escolar 2020 – 2021, por indicaciones de la SEP y la pandemia mundial <br /> \
            ocasionada por el virus Covid-19 este año escolar será híbrido, por ello el colegio ofrecerá <br />\
            materiales de apoyo educativo en línea en la siguiente plataforma: <br />\
            <br />https://coneyotl.herokuapp.com . <br />\
            <br />En esta plataforma podrá consultar las calificaciones de su hijo/a, así como ver y acceder a las <br />\
            actividades que cada profesor preparará al inicio de cada semana. <br />\
            Este correo es de uso personal, a continuación, se le darán los siguientes datos de ingreso: <br />\
            <br />Nombre del Padre o Tutor: %s %s %s. <br />\
            <br />Claves de acceso = CURP: %s <br />\
            <br />Correo Electrónico: %s <br />\
            <br />Le agradecemos su atención, compromiso y apoyo, le dejamos a su disposición el siguiente correo <br />\
            para apoyo técnico: coneyotl.plataforma@gmail.com. <br />\
            " %tupla
    Story.append(Paragraph(texto, estilos["Justify"]))
    Story.append(Spacer(1, 12))
    #texto = 'Le agradecemos su Atención y dejamos a su disposición el siguiente correo: '
    #Story.append(Paragraph(texto, estilos["Justify"]))
    #Story.append(Spacer(1, 12))
    #texto = 'coneyotl.plataforma@gmail.com, atte: Colegio Coneyotl Kinder y Primaria Coneyotl Piltzintli'
    #Story.append(Paragraph(texto, estilos["Normal"]))
    #Story.append(Spacer(1, 48))
    #texto = 'NOTA: La plataforma se actualizará cada domingo por la noche, actulizando las nuevas actividades de la semana.'
    #Story.append(Paragraph(texto, estilos["Normal"]))
    #Story.append(Spacer(1, 12))
    doc.build(Story)
##Nombre, apellido_paterno, apellido_materno, Curp, Correoelectronico
generar_nuevo_pdf(('Nombre1','Nombre2','Nombre3','Nombre4','Nombre5'))