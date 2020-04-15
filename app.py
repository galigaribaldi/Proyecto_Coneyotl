from flask import Flask
from flask import render_template, request, flash
from flask import redirect, url_for
import models as coneccion
import models2 as inscripciones 
#import sqlite3

app = Flask(__name__)

### Settings
app.secret_key = 'secreto'

@app.route('/') 
def index():
    return render_template('index.html')

@app.route('/admin')
def administrador():
    lista = ['K1','K2','K3','1ro','2do', '3ro', '4to', '5to', '6to']
    return render_template('admin.html', g=lista)

@app.route('/verAlumno/<grupo>')
def verAlumno(grupo):
    estudiantes = coneccion.consulta_estudiantes(grupo)
    return render_template('veralumno.html', estu=estudiantes )

@app.route('/verAlumnoDatos/<e_ID>/<grupo>')
def verAlumnoDatos(e_ID,grupo):
    estudiantes = coneccion.consulta_estudiantes_id(e_ID,grupo)
    return render_template('verDatos.html', estu=estudiantes )    

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

@app.route('/editar/actualizar/calificaciones/<e_ID>/<grado>')
def actualizar_calificacion(e_ID,grado):
    p_id = coneccion.consulta_prof_grado2(grado)
    print(p_id)
    m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
    print(m_inscrita)
    est = coneccion.consulta_estudiantes_id(e_ID,grado)
    return render_template('verCalifAlu.html', estudiante=est, materia=m_inscrita )    
####################################################################################################################
####Operaciones de Dar de Baja, Alta y Suspender

@app.route('/alta/<e_id>/<grado>')
def alta_alumno(e_id,grado):
    alta = coneccion.dar_alta_alumno(e_id)
    estudiantes = coneccion.consulta_estudiantes(grado)
    return render_template('veralumno.html', estu=estudiantes )

@app.route('/baja/<e_id>/<grado>')
def baja_alumno(e_id,grado):
    baja = coneccion.dar_baja_alumno(e_id)
    estudiantes = coneccion.consulta_estudiantes(grado)
    return render_template('veralumno.html', estu=estudiantes )

@app.route('/suspender/<e_id>/<grado>')
def suspender_alumno(e_id,grado):
    suspender = coneccion.suspender(e_id)
    estudiantes = coneccion.consulta_estudiantes(grado)
    return render_template('veralumno.html', estu=estudiantes )

##profesores grado
@app.route('/alta_prof_grado/<e_id>')
def alta_prof_Grado(e_id):
    alta = coneccion.dar_alta_profesor_grado(e_id)
    prof_grado = coneccion.consulta_prof_grado()
    prof_esp = coneccion.consulta_all_prof_esp()
    return render_template('verProfesor.html', prof_g=prof_grado, prof_e=prof_esp )

@app.route('/baja_prof_grado/<e_id>')
def baja_prof_grado(e_id):
    baja = coneccion.dar_baja_profesor_grado(e_id)
    prof_grado = coneccion.consulta_prof_grado()
    prof_esp = coneccion.consulta_all_prof_esp()
    return render_template('verProfesor.html', prof_g=prof_grado, prof_e=prof_esp )

@app.route('/suspender_prof_grado/<e_id>')
def suspender_prof_grado(e_id):
    suspender = coneccion.suspender_profesor_grado(e_id)
    prof_grado = coneccion.consulta_prof_grado()
    prof_esp = coneccion.consulta_all_prof_esp()
    return render_template('verProfesor.html', prof_g=prof_grado, prof_e=prof_esp )

##profeosres Especialistas
@app.route('/alta_prof_esp/<e_id>')
def alta_prof_esp(e_id):
    alta = coneccion.dar_baja_profesor_es(e_id)
    prof_grado = coneccion.consulta_prof_grado()
    prof_esp = coneccion.consulta_all_prof_esp()
    return render_template('verProfesor.html', prof_g=prof_grado, prof_e=prof_esp )

@app.route('/baja_prof_esp/<e_id>')
def baja_prof_esp(e_id):
    baja = coneccion.dar_baja_profesor_es(e_id)
    prof_grado = coneccion.consulta_prof_grado()
    prof_esp = coneccion.consulta_all_prof_esp()
    return render_template('verProfesor.html', prof_g=prof_grado, prof_e=prof_esp )

@app.route('/suspender_prof_esp/<e_id>')
def suspender_prof_esp(e_id):
    suspender = coneccion.suspender_profesor_es(e_id)
    prof_grado = coneccion.consulta_prof_grado()
    prof_esp = coneccion.consulta_all_prof_esp()
    return render_template('verProfesor.html', prof_g=prof_grado, prof_e=prof_esp )

######################################################################################################################
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
####Editar datos del alumno

@app.route('/actualizardatos/alumno/<ids>', methods=['POST'])
def actualizar_datos_alumno(ids):
    if request.method == 'POST':
        nombre = request.form['nombre']
        apellido_pat = request.form['apellido_p']
        apellido_mat = request.form['apellido_m']
        grado = request.form['grado']
        edad = request.form['edad']
        nombre_tutor = request.form['nombre_tutor']
        telefono = request.form['telefono']
        estado = request.form['estado']
        try:
            coneccion.actualizar_alumno(nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono, estado, ids)
            flash("Se Actualizaron los datos correctamente!")
            return redirect(url_for('administrador'))
        except:
            flash("Hubo algún problema, intente de nuevo")
            return "Hubo un problema"
    else:
        return render_template('index.html')


##Vista de profesores
@app.route('/verProfesor')
def profesor():
    grado = coneccion.consulta_all_prof_grado()
    especialista = coneccion.consulta_all_prof_esp()
    return render_template('verProfesor.html', prof_g = grado, prof_e = especialista)

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

@app.route('/inscripcionalumno/<id_alumno>/<grupo>')
def inscripcionalumno(id_alumno, grupo):
    coneccion.inscripcion_estudiante_ID(grupo, id_alumno)
    return redirect(url_for('administrador'))

###########################Cambiar calificaciones######Rutas#########################
@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>')
def cambiar_calificacion1(e_ID,grado):
    p_id = coneccion.consulta_prof_grado2(grado)
    m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
    est = coneccion.consulta_estudiantes_id(e_ID,grado)
    grados = coneccion.clave(grado)
    clave_prof_g= coneccion.clave_prof_grado(grado)
    return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='1', lista=grados, clave_prof_g=clave_prof_g)    

@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>/2')
def cambiar_calificacion2(e_ID,grado):
    p_id = coneccion.consulta_prof_grado2(grado)
    m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
    est = coneccion.consulta_estudiantes_id(e_ID,grado)
    lista = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20']
    return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='2', lista=lista )    

@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>/3')
def cambiar_calificacion3(e_ID,grado):
    p_id = coneccion.consulta_prof_grado2(grado)
    m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
    est = coneccion.consulta_estudiantes_id(e_ID,grado)
    lista = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20']
    return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='3', lista=lista )    

@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>/4')
def cambiar_calificacion4(e_ID,grado):
    p_id = coneccion.consulta_prof_grado2(grado)
    m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
    est = coneccion.consulta_estudiantes_id(e_ID,grado)
    lista = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20']
    return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='4', lista=lista )    

@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>/5')
def cambiar_calificacion5(e_ID,grado):
    p_id = coneccion.consulta_prof_grado2(grado)
    m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
    est = coneccion.consulta_estudiantes_id(e_ID,grado)
    lista = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20']
    return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='5', lista=lista)
#########################################################################################

#################################Cambiar Calificaciones Coneccion a base#########################
@app.route('/guardar1/calificacion/Bimestre_1/<id_materia>/<id_estudiante>/<id_profesor>', methods = ['POST'])
def cambiar_calificacion_Bimestre1(id_materia, id_estudiante, id_profesor):
    if request.method == 'POST':
        campo1_B1 = int(request.form['campo1_B1']) ##Examenes
        campo2_B1 = int(request.form['campo2_B1']) ## Tareas
        campo3_B1 = int(request.form['campo3_B1']) ##Exposisicon
        campo4_B1 = int(request.form['campo4_B1']) ## Asistencia
        campo5_B1 = int(request.form['campo5_B1']) ##Cuaderno
        promedio = (int(campo1_B1)*.50) + (int(campo2_B1)*.15) + (int(campo3_B1)*.15) + (int(campo4_B1)*.10) + (int(campo5_B1)*.10)
        #try:
        coneccion.insertarcalificacion_Bimestre1(campo1_B1, campo2_B1, campo3_B1, campo4_B1, promedio, id_estudiante, id_materia, id_profesor)
        print(campo1_B1, campo2_B1, campo3_B1, campo4_B1, promedio, id_materia, id_estudiante, id_profesor)
        print(type(campo1_B1), type(campo2_B1), type(campo3_B1), type(campo4_B1), type(promedio))
        #flash('La materia se registro sattisfacotriamente')
        #return redirect(url_for('administrador'))
        #except:
        #return "Error"
        return "Hecho!"
    else:
        return render_template('index.html')


@app.route('/guardar/calificacion/Bimestre_2/<id_materia>/<id_estudiante>/<id_profesor>', methods = ['POST'])
def cambiar_calificacion_Bimestre2(id_materia, id_estudiante, id_profesor):
    if request.method == 'POST':
        campo1_B2 = request.form['campo1_B2'] ##Examenes
        campo2_B2 = request.form['campo2_B2'] ## Tareas
        campo3_B2 = request.form['campo3_B2'] ##Exposisicon
        campo4_B2 = request.form['campo4_B2'] ## Asistencia
        campo5_B2 = request.form['campo5_B2'] ##Cuaderno
        promedio = (int(campo1_B2)*.50) + (int(campo2_B2)*.15) + (int(campo3_B2)*.15) + (int(campo4_B2)*.10) + (int(campo5_B2)*.10)
        try:
            coneccion.insertarcalificacion_Bimestre1(campo1_B2, campo2_B2, campo3_B2, campo4_B2, promedio, id_estudiante, id_materia, id_profesor)
            flash('La materia se registro sattisfacotriamente')
            return "Done!"
        except:
            return "Error"

@app.route('/guardar/calificacion/Bimestre_3/<id_materia>/<id_estudiante>/<id_profesor>', methods = ['POST'])
def cambiar_calificacion_Bimestre3(id_materia, id_estudiante, id_profesor):
    if request.method == 'POST':
        campo1_B3 = request.form['campo1_B3'] ##Examenes
        campo2_B3 = request.form['campo2_B3'] ## Tareas
        campo3_B3 = request.form['campo3_B3'] ##Exposisicon
        campo4_B3 = request.form['campo4_B3'] ## Asistencia
        campo5_B3 = request.form['campo5_B3'] ##Cuaderno
        promedio = (int(campo1_B3)*.50) + (int(campo2_B3)*.15) + (int(campo3_B3)*.15) + (int(campo4_B3)*.10) + (int(campo5_B3)*.10)
        try:
            inscripciones.insertarcalificacion_Bimestre1(campo1_B3, campo2_B3, campo3_B3, campo4_B3, promedio, id_estudiante, id_materia, id_profesor)
            flash('La materia se registro sattisfacotriamente')
            return "Done!"
        except:
            return "Error"

@app.route('/guardar/calificacion/Bimestre_4/<id_materia>/<id_estudiante>/<id_profesor>', methods = ['POST'])
def cambiar_calificacion_Bimestre4(id_materia, id_estudiante, id_profesor):
    if request.method == 'POST':
        campo1_B4 = request.form['campo1_B4'] ##Examenes
        campo2_B4 = request.form['campo2_B4'] ## Tareas
        campo3_B4 = request.form['campo3_B4'] ##Exposisicon
        campo4_B4 = request.form['campo4_B4'] ## Asistencia
        campo5_B4 = request.form['campo5_B4'] ##Cuaderno
        promedio = (int(campo1_B4)*.50) + (int(campo2_B4)*.15) + (int(campo3_B4)*.15) + (int(campo4_B4)*.10) + (int(campo5_B4)*.10)
        try:
            inscripciones.insertarcalificacion_Bimestre1(campo1_B4, campo2_B4, campo3_B4, campo4_B4, promedio, id_estudiante, id_materia, id_profesor)
            flash('La materia se registro sattisfacotriamente')
            return "Done!"
        except:
            return "Error"

@app.route('/guardar/calificacion/Bimestre_5/<id_materia>/<id_estudiante>/<id_profesor>', methods = ['POST'])
def cambiar_calificacion_Bimestre5(id_materia, id_estudiante, id_profesor):
    if request.method == 'POST':
        campo1_B1 = request.form['campo1_B5'] ##Examenes
        campo2_B1 = request.form['campo2_B5'] ## Tareas
        campo3_B1 = request.form['campo3_B5'] ##Exposisicon
        campo4_B1 = request.form['campo4_B5'] ## Asistencia
        campo5_B1 = request.form['campo5_B5'] ##Cuaderno
        promedio = (int(campo1_B1)*.50) + (int(campo2_B1)*.15) + (int(campo3_B1)*.15) + (int(campo4_B1)*.10) + (int(campo5_B1)*.10)
    return str(promedio)
#################################################################################################

if __name__ == '__main__':
    app.run(debug = True)