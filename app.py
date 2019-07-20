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

@app.route('/admin')
def administrador():
    return render_template('admin.html')

@app.route('/verAlumno')
def verAlumno():
    estudiantes = coneccion.consulta_estudiantes('6to')
    return render_template('veralumno.html', estu=estudiantes )

@app.route('/edit/<grado>')
def get_grado(grado):
    try:
        coneccion.inscripcion_todos_estudiantes(grado)
        return "Inscripcion Satisfactoria"
    except:
        return "ocurrio un error, favor de volver a intentarlo"

@app.route('/editar/actualizar/<e_ID>/<grado>')
def actualizar_au(e_ID,grado):
    m_inscrita = coneccion.consulta_inscrita(e_ID,grado)
    est = coneccion.consulta_estudiantes_id(e_ID,grado)
    print(est)
    print(m_inscrita)
    return render_template('actualizarAlu.html', estudiante=est, materia=m_inscrita )

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
        try:
            coneccion.insertarestud(estudiante_ID, nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono, estado)
            flash('Tu cuenta ha quedado Registrada, por favor inicia sesion')
            return redirect(url_for('registrar_esudiante'))            
        except:
            return 'Hubo un error favor de intentar de nuevo'
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
            return redirect(url_for('registrar_profesores'))
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

###Visualizar la materia
@app.route('/materia')
def materia2():
    return render_template('regismateria.html')

###Registrar materia
@app.route('/registroMateria', methods = ['POST'])
def materia():
    if request.method == 'POST':
        materia_ID = request.form['materia_ID']
        nombre = request.form['nombre']
        estado = request.form['estado']
        try:
            coneccion.insertamateria(materia_ID, nombre, estado)
            flash('La materia se registro sattisfacotriamente')
            return redirect(url_for('index'))
        except:
            flash('Hubo algun problema intetalo de nuevo')
            return "Hubo un problema"
    else:
        return render_template('index.html')

@app.route('/edit/<id>')
def get_data(id):
    return id

if __name__ == '__main__':
    app.run(debug = True)