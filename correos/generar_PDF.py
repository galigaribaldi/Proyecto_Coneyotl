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
    doc = SimpleDocTemplate(tupla[0], pagesize=letter, rightMargin=72, leftMargin=72, topMargin=72, bottomMargin=18)
    Story = []
    logotipo = "/img/logo.jpeg"
    formatoFecha = time.ctime()
    nombreCompleto = "Colegio Coneyotl - Piltzintli"
    partesDeDireccion = ["Calle Independencia sin Número", "San Pedro Atocpan - Milpa Alta, Código Postal 12200"]
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
        texto = "Con Motivo de la pandemia ocasionada por el Virus Covid-19, nos hemos dado la tarea de ofrecer materiales en línea. \
            Por lo que ponemos a su disposición la siguiente Plataforma https://coneyotl.herokuapp.com/. En esta plataforma podrá consultar las calificaciones de su niñ@ y podrá ver las\
            acctividades que cada profesor irá preparando semana con semana. Este Correo es personal, ya que se le darán los siguientes datos de ingreso \
            Nombre del Padre o Tutor: %s %s %s. Claves de acceso = CURP: %s Correo Electronico %s." %tupla
    Story.append(Paragraph(texto, estilos["Justify"]))
    Story.append(Spacer(1, 12))
    texto = 'Le agradecemos su Atención y dejamos a su disposición el siguiente correo: '
    Story.append(Paragraph(texto, estilos["Justify"]))
    Story.append(Spacer(1, 12))
    texto = 'coneyotl.plataforma@gmail.com, atte: Colegio Coneyotl Kinder y Primaria Coneyotl Piltzintli'
    Story.append(Paragraph(texto, estilos["Normal"]))
    Story.append(Spacer(1, 48))
    texto = 'NOTA: La plataforma se actualizará cada domingo por la noche, actulizando las nuevas actividades de la semana.'
    Story.append(Paragraph(texto, estilos["Normal"]))
    Story.append(Spacer(1, 12))
    doc.build(Story)

generar_nuevo_pdf(('','','','',''))