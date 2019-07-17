from flask import Flask
from flask import render_template, request, flash
from flask import redirect, url_for
import models as coneccion
#import sqlite3

app = Flask(__name__)

### Settings
app.secret_key = 'secreto'

@app.route('/')
def index():
    return render_template('index.html')

###Ingresar como estudiante
@app.route('/alumno')
def loggin_Estudiante():
    return render_template('logginEstudiante.html')

###Registrar Estudiantes
@app.route('/alumno/registraralumno')
def registrar_esudiante():
    return render_template('regisEstudiante.html')

@app.route('/alumno/agregar', methods =['POST'])
def registrar_esudiante2():
    if request.method == 'POST':
        estudiante_ID = request.form['estudiante_ID']
        nombre = request.form['nombre']
        apellido_pat = request.form['apellido_pat']
        apellido_mat = request.form['apellido_mat']
        grado = request.form['grado']
        edad = request.form['edad']
        nombre_tutor = request.form['nombre_tutor']
        telefono = request.form['telefono']
        estado = request.form['estado']
        print(estudiante_ID) ; print(nombre) ; print(apellido_pat) ; print(apellido_mat)
        print(grado) ; print(edad) ; print(nombre_tutor)
        try:
            coneccion.insertarestud(estudiante_ID, nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono, estado)
            flash('El estudiante fue registrado sattisfacotriamente')
            return redirect(url_for('index'))
        except:
            flash('Hubo algun problema intetalo de nuevo')
            return redirect(url_for('index'))
    else:
        return render_template('index.html')




###Ingresar como profesor
@app.route('/profesor')
def loggin_profesor():
    return render_template('logginprofesor.html')

##Registrar profesores
@app.route('/profesor/registroprofesor')
def registrar_profesores():
    return render_template('regisprofe.html')

@app.route('/profesor/agregar', methods =['POST'])
def registrar_profesor():
        if request.method == 'POST':
            profesor_ID = request.form['profesor_ID']
            nombre = request.form['nombre']
            apellido_pat = request.form['apellido_pat']
            apellido_mat = request.form['apellido_mat']
            edad = request.form['edad']
            telefono = request.form['telefono']
            estado = request.form['estado']
            grado = request.form['grado']
            print(profesor_ID)
            print(nombre)
            print(apellido_mat)

            try:
                coneccion.insertarprof_grado(profesor_ID, nombre, apellido_pat, apellido_mat, edad, telefono, estado, grado)
                flash('El profesor fue registrado sattisfacotriamente')
                return redirect(url_for('index'))
            except:
                flash('Hubo algun problema intetalo de nuevo')
                return "Hubo un problema"
        else:
            return render_template('index.html')


##Tabla con calificaciones
@app.route('/calificaciones')
def calificaciones():
    calificaciones = coneccion.consulta_materias()
    return render_template('calif.html', calif = calificaciones)

###Registrar materia
@app.route('/registroMateria')
def materia():
    pass

@app.route('/edit/<id>')
def get_data(id):
    return id

if __name__ == '__main__':
    app.run(debug = True)