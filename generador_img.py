from PIL import Image, ImageDraw, ImageFont
import time
def generar_imagen(nombre, apellido_p, apellido_m,mensaje, curp, correo):
    ##Abrir Imagen - Plantilla
    img=Image.open("static/img/plantilla.jpeg")
    draw = ImageDraw.Draw(img)
    ###Definir la uente
    font = ImageFont.truetype("static/fonts/LiberationSerif-Bold2.ttf",43)#('/app/.heroku/python/lib/python3.7/site-packages/PIL/LiberationSerif-Bold.ttf', 50) #ImageFont.load_default()
    font2= ImageFont.truetype("static/fonts/LiberationSerif-Bold2.ttf",35)#('/app/.heroku/python/lib/python3.7/site-packages/PIL/LiberationSerif-Bold.ttf', 35) #ImageFont.load_default()
    font3= ImageFont.truetype('static/fonts/LiberationSerif-Bold2.ttf',30)#('/app/.heroku/python/lib/python3.7/site-packages/PIL/LiberationSerif-Bold.ttf', 30) #ImageFont.load_default()
    font4= ImageFont.truetype('static/fonts/LiberationSerif-Bold2.ttf',30)#('/app/.heroku/python/lib/python3.7/site-packages/PIL/LiberationSerif-Bold.ttf', 30) #ImageFont.load_default()
    ###Definir la posición en la cual se escribe
    cadena = "Holasadsadadasdasdasdsadasdadasdasdasdadadsaddasdsdasdadasdsadsadasdasdasdsads12"
    pie = "Este es un mensaje generado automáticamente por coneyotl.herokuapp.com"
    pie2 = "Para mas información mande correo a coneyotl.plataforma@gmail.com"
    encabezado = "Nombre del alumno: " + nombre+ " " + apellido_p + " " +apellido_m
    ###Fecha
    #formatoFecha = time.ctime()
    ###Encabezado
    draw.text((70,190), encabezado, fill="white", font=font)
    #draw.text((70,250), formatoFecha, fill="white", font=font)
    draw.text((80,240), curp, fill="white", font=font4)
    draw.text((80,280), correo, fill="white", font=font4)
    tam = 350
    ###Mensaje
    if len(mensaje) <= 60:
        draw.text((50,tam), mensaje[0:60], fill="white", font=font2)
    if len(mensaje) > 60:
        draw.text((50,tam), mensaje[0:75], fill="white", font=font2)
        draw.text((50,tam + 40), mensaje[75:150], fill="white", font=font2)
        draw.text((50,tam + 80), mensaje[150:225], fill="white", font=font2)
        draw.text((50,tam + 120), mensaje[225:300], fill="white", font=font2)
        draw.text((50,tam + 160), mensaje[300:375], fill="white", font=font2)
        draw.text((50,tam + 200), mensaje[375:450], fill="white", font=font2)
        draw.text((50,tam + 240), mensaje[525:600], fill="white", font=font2)                
        draw.text((50,tam + 280), mensaje[600:675], fill="white", font=font2)                
    #draw.text((50,500), cadena, fill="white", font=font)
    #draw.text((50,540), cadena, fill="white", font=font)
    ##Pide de página
    draw.text((30,840), pie, fill="white", font=font3)
    draw.text((30,880), pie2, fill="white", font=font3)
    #img.show()
    img.save('nuevo.png')
cade = "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Rem quod eum corporis hic veritatis fugiat minima animi reprehenderit nobis? Commodi sunt cupiditate consequatur aperiam doloribus non consectetur, et voluptatum laudantium." 
generar_imagen('Hol','','',cade,'Curp', 'Correo')