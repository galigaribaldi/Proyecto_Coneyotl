from PIL import Image, ImageDraw, ImageFont
import time
def generar_imagen(nombre, apellido_p, apellido_m,mensaje, curp, correo):
    ##Abrir Imagen - Plantilla
    img=Image.open("static/img/plantilla.jpeg")
    draw = ImageDraw.Draw(img)
    ###Definir la uente
    font = ImageFont.truetype("static/fonts/LiberationSerif-Bold2.ttf",45)#('/app/.heroku/python/lib/python3.7/site-packages/PIL/LiberationSerif-Bold.ttf', 50) #ImageFont.load_default()
    font2= ImageFont.truetype("static/fonts/LiberationSerif-Bold2.ttf",35)#('/app/.heroku/python/lib/python3.7/site-packages/PIL/LiberationSerif-Bold.ttf', 35) #ImageFont.load_default()
    font3= ImageFont.truetype('static/fonts/LiberationSerif-Bold2.ttf',30)#('/app/.heroku/python/lib/python3.7/site-packages/PIL/LiberationSerif-Bold.ttf', 30) #ImageFont.load_default()
    font4= ImageFont.truetype('static/fonts/LiberationSerif-Bold2.ttf',30)#('/app/.heroku/python/lib/python3.7/site-packages/PIL/LiberationSerif-Bold.ttf', 30) #ImageFont.load_default()
    ###Definir la posición en la cual se escribe
    cadena = "Holasadsadadasdasdasdsadasdadasdasdasdadadsaddasdsdasdadasdsadsadasdasdasdsads12"
    pie = "Este es un mensaje generado automáticamente por coneyotl.herokuapp.com"
    pie2 = "Para mas información mande correo a coneyotl.plataforma@gmail.com"
    encabezado = "Nombre del alumno: " + nombre+ " " + apellido_p + " " +apellido_m
    ###Fecha
    formatoFecha = time.ctime()
    ###Encabezado
    draw.text((70,190), encabezado, fill="white", font=font)
    draw.text((70,250), formatoFecha, fill="white", font=font)
    draw.text((70,290), curp, fill="white", font=font4)
    draw.text((70,330), correo, fill="white", font=font4)
    tam = 380
    ###Mensaje
    if len(mensaje) <= 60:
        draw.text((50,420), mensaje[0:60], fill="white", font=font2)
    if len(mensaje) > 60:
        draw.text((50,tam), mensaje[0:65], fill="white", font=font2)
        draw.text((50,tam + 40), mensaje[65:130], fill="white", font=font2)
        draw.text((50,tam + 80), mensaje[130:195], fill="white", font=font2)
        draw.text((50,tam + 120), mensaje[195:260], fill="white", font=font2)
        draw.text((50,tam + 160), mensaje[260:325], fill="white", font=font2)
        draw.text((50,tam + 200), mensaje[325:390], fill="white", font=font2)
        draw.text((50,tam + 240), mensaje[390:455], fill="white", font=font2)                
        draw.text((50,tam + 280), mensaje[455:520], fill="white", font=font2)                
    #draw.text((50,500), cadena, fill="white", font=font)
    #draw.text((50,540), cadena, fill="white", font=font)
    ##Pide de página
    draw.text((30,840), pie, fill="white", font=font3)
    draw.text((30,880), pie2, fill="white", font=font3)
    #img.show()
    img.save('nuevo.png')
#generar_imagen('Hol','','','asdasdsadasdasdasdasdasdsa','Curp', 'Correo')