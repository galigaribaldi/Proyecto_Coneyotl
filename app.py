from flask import Flask
from flask import render_template, request, flash
from flask import redirect, url_for, session
import os
###Coneccion a la base
import models as coneccion
##Generador de correos
import correo as enviar
#Generador de imagenes
import generador_img as img
##Generador de Espera
import redis
import automatizar as au
from rq import Queue
from urllib.parse import urlparse
url=urlparse(os.environ.get('REDISCLOUD_URL'))
r = redis.Redis(host=url.hostname, port=url.port, password=url.password)
##
#r = redis.Redis()
q = Queue(connection=r)

app = Flask(__name__)

# Settings Configuración del Secret Key
secret_key = os.environ.get('SECRET_KEY')
app.secret_key = secret_key

@app.route('/', methods = ['GET', 'POST']) 
def index():
    if request.method == 'POST':
        try:
            correo_electronico = str(request.form['correo_electronico'])
            curp = str(request.form['curp'])
            ids = coneccion.valida_loggin_est(curp, correo_electronico)
            ids2 = coneccion.valida_loggin_prof(curp, correo_electronico)
            ids3 = coneccion.valida_loggin_prof_es(curp, correo_electronico)
            ##Estudiante
            if ids:
                if type(ids[0][0]) == int:
                    ##Obtener el grado y el estudiante_id
                    datos = coneccion.consulta_estudiantes_id5(correo_electronico, curp)
                    grado = datos[0][1]
                    e_ID=datos[0][0]
                    coneccion.ingresos_plataforma_estudiante(e_ID)
                    coneccion.ingresos2_plataforma_estudiante(e_ID)
                    session['username'] = 'estudiante'
                    p_id = coneccion.consulta_prof_grado2(grado)
                    m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
                    est = coneccion.consulta_estudiantes_id(e_ID,grado)
                    return render_template('verCalifAlu.html', estudiante=est, materia=m_inscrita, bandera3=1 )
            ##Profesor de Grado
            if ids2:
                if type(ids2[0][0]) == int:
                    session['username'] = 'profesor_grado'
                    print("Id del profesor de grado: ",ids2[0][0])
                    coneccion.ingresos2_plataforma_profesor_grado(ids2[0][0])
                    coneccion.ingresos_plataforma_prof_grado(ids2[0][0])
                    grado = coneccion.grado_id(ids2[0][0])
                    print("Grado: ", grado[0][0])
                    estudiantes = coneccion.consulta_estudiantes(grado[0][0])
                    #print(estudiantes)
                    return render_template('veralumno.html', estu=estudiantes, bandera=1, idp=ids2[0][0] )
            ##Profesor Especialista
            if ids3:
                if type(ids3[0][0]) == int:
                    session['username'] = 'profesor_especialista'
                    print(ids3)
                    print(ids3[0][0])
                    coneccion.ingresos_plataforma_esp(ids3[0][0])
                    coneccion.ingresos2_plataforma_profesor_especialista(ids3[0][0])
                    grado = coneccion.consulta_grado_esp(ids3[0][0])
                    if grado[0][0] =='PRIMARIA':
                        print(grado[0][0])
                        return render_template('profesor_especialista.html', prof_esp=ids3[0][0], bandera=1)
                    if grado[0][0] =='KINDER-PRIMARIA':
                        print(grado[0][0])
                        return render_template('profesor_especialista.html', prof_esp=ids3[0][0], bandera=1, bandera2=1)
                    if grado[0][0] == 'KINDER':
                        print(grado[0][0])
                        return render_template('profesor_especialista.html', prof_esp=ids3[0][0], bandera2=1)
            ##Administracion        
            if correo_electronico =='19174536' and curp =='19174536':
                session['username'] = 'ADMINISTRADOR'
                return redirect(url_for('administrador'))            
            else:
                flash("¡Datos Incorrectos, intentalo de nuevo!")
                return redirect(url_for('index'))
        except ValueError:
            flash("Hubo un error con los datos, intentalo nuevamente")
            return render_template('index.html')
    else:
        return render_template('index.html')


@app.route("/salir")
def logout():
    session.pop("username", None)
    return redirect(url_for('index'))

@app.route("/avisos/<grupo>")
def avisos(grupo):
    if "username" in session and session["username"] =='ADMINISTRADOR' or "username" in session and session["username"] =='profesor_grado' or "username" in session and session["username"] =='profesor_especialista' or "username" in session and session["username"] =='estudiante':
        print(type(grupo))
        tarea = coneccion.consulta_tarea(grupo)
        print(tarea)
        return render_template("avisos.html", grupo=grupo, tarea=tarea)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/admin')
def administrador():
    if "username" in session and session["username"] =='ADMINISTRADOR':
        lista = ['K1','K2','K3','1ro','2do', '3ro', '4to', '5to', '6to']
        #print(session['username'])
        return render_template('admin.html', g=lista)
    if "username" in session and session["username"] !='ADMINISTRADOR':
        return "¡Lo sentimos! pero no puedes acceder aqui"
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/verAlumno/<grupo>')
def verAlumno(grupo):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        estudiantes = coneccion.consulta_estudiantes(grupo)
        prof=coneccion.consulta_prof_grado3(grupo)
        idp=prof[0][0]
        return render_template('veralumno.html', estu=estudiantes, bandera3=1,idp=idp)

    if "username" in session and session["username"] =='profesor_grado':
        estudiantes = coneccion.consulta_estudiantes(grupo)
        prof=coneccion.consulta_prof_grado3(grupo)
        idp=prof[0][0]        
        return render_template('veralumno.html', estu=estudiantes, bandera=1,idp=idp)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/verAlumno/<grupo>/<id_profesor>')
def verAlumno_es(grupo, id_profesor):
    if "username" in session and session["username"] =='profesor_especialista':
        estudiantes = coneccion.consulta_estudiantes(grupo)
        return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_profesor,idp=id_profesor )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/editar/actualizar/<e_ID>/<grado>/<id_profesor>')
def actualizar_alu_esp(e_ID,grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        m_inscrita = coneccion.consulta_inscrita(e_ID,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        return render_template('actualizarAlu.html', estudiante=est, materia=m_inscrita )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/editar/actualizar/calificaciones/<e_ID>/<grado>/<id_profesor>')
def actualizar_calificacion_esp(e_ID,grado, id_profesor):
    if "username" in session and session["username"] =='profesor_especialista':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        d = coneccion.especialista_calif(id_profesor)
        r = coneccion.obtener_Rango(grado, str(d[0][0]), str(d[0][1]))
        materia_especial = []
        if m_inscrita:
            materia_especial.append(m_inscrita[r])
        print(materia_especial)
        print(r)
        return render_template('verCalifAlu.html', estudiante=est, materia=materia_especial, bandera1=1, prof_esp=id_profesor, b=1)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/verAlumnoDatos/<e_ID>/<grupo>')
def verAlumnoDatos(e_ID,grupo):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        estudiantes = coneccion.consulta_estudiantes_id(e_ID,grupo)
        datos = coneccion.consulta_ingresos_est(e_ID)
        return render_template('verDatos.html', estu=estudiantes, d=datos)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/edit/<grado>')
def get_grado(grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        try:
            coneccion.inscripcion_todos_estudiantes(grado)
            return "Inscripcion Satisfactoria"
        except:
            return "ocurrio un error, favor de volver a intentarlo"
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/editar/actualizar/<e_ID>/<grado>')
def actualizar_au(e_ID,grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        m_inscrita = coneccion.consulta_inscrita(e_ID,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        return render_template('actualizarAlu.html', estudiante=est, materia=m_inscrita )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/editar/actualizar/calificaciones/<e_ID>/<grado>')
def actualizar_calificacion(e_ID,grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        return render_template('verCalifAlu.html', estudiante=est, materia=m_inscrita, bandera1=1 )

    if "username" in session and session["username"] =='profesor_grado':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        return render_template('verCalifAlu.html', estudiante=est, materia=m_inscrita, bandera1=1 )

    if "username" in session and session["username"] =='profesor_especialista':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        return render_template('verCalifAlu.html', estudiante=est, materia=m_inscrita, bandera2=1)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))
####################################################################################################################
####Operaciones de Dar de Baja, Alta y Suspender

@app.route('/alta/<e_id>/<grado>')
def alta_alumno(e_id,grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        alta = coneccion.dar_alta_alumno(e_id)
        estudiantes = coneccion.consulta_estudiantes(grado)
        return render_template('veralumno.html', estu=estudiantes )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/baja/<e_id>/<grado>')
def baja_alumno(e_id,grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        baja = coneccion.dar_baja_alumno(e_id)
        estudiantes = coneccion.consulta_estudiantes(grado)
        return render_template('veralumno.html', estu=estudiantes )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/suspender/<e_id>/<grado>')
def suspender_alumno(e_id,grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        suspender = coneccion.suspender(e_id)
        estudiantes = coneccion.consulta_estudiantes(grado)
        return render_template('veralumno.html', estu=estudiantes )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

##profesores grado
@app.route('/alta_prof_grado/<e_id>')
def alta_prof_Grado(e_id):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        alta = coneccion.dar_alta_profesor_grado(e_id)
        prof_grado = coneccion.consulta_prof_grado()
        prof_esp = coneccion.consulta_all_prof_esp()
        return render_template('verProfesor.html', prof_g=prof_grado, prof_e=prof_esp )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/baja_prof_grado/<e_id>')
def baja_prof_grado(e_id):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        baja = coneccion.dar_baja_profesor_grado(e_id)
        prof_grado = coneccion.consulta_prof_grado()
        prof_esp = coneccion.consulta_all_prof_esp()
        return render_template('verProfesor.html', prof_g=prof_grado, prof_e=prof_esp )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/suspender_prof_grado/<e_id>')
def suspender_prof_grado(e_id):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        suspender = coneccion.suspender_profesor_grado(e_id)
        prof_grado = coneccion.consulta_prof_grado()
        prof_esp = coneccion.consulta_all_prof_esp()
        return render_template('verProfesor.html', prof_g=prof_grado, prof_e=prof_esp )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

##profeosres Especialistas
@app.route('/alta_prof_esp/<e_id>')
def alta_prof_esp(e_id):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        alta = coneccion.dar_baja_profesor_es(e_id)
        prof_grado = coneccion.consulta_prof_grado()
        prof_esp = coneccion.consulta_all_prof_esp()
        return render_template('verProfesor.html', prof_g=prof_grado, prof_e=prof_esp )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/baja_prof_esp/<e_id>')
def baja_prof_esp(e_id):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        baja = coneccion.dar_baja_profesor_es(e_id)
        prof_grado = coneccion.consulta_prof_grado()
        prof_esp = coneccion.consulta_all_prof_esp()
        return render_template('verProfesor.html', prof_g=prof_grado, prof_e=prof_esp )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/suspender_prof_esp/<e_id>')
def suspender_prof_esp(e_id):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        suspender = coneccion.suspender_profesor_es(e_id)
        prof_grado = coneccion.consulta_prof_grado()
        prof_esp = coneccion.consulta_all_prof_esp()
        return render_template('verProfesor.html', prof_g=prof_grado, prof_e=prof_esp )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

######################################################################################################################
###Ingresar como estudiante
@app.route('/alumno')
def loggin_Estudiante():
    if "username" in session and session["username"] =='ADMINISTRADOR':
        return render_template('logginEstudiante.html')
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

###Registrar Estudiantes
@app.route('/alumno/registraralumno')
def registrar_esudiante():
    if "username" in session and session["username"] =='ADMINISTRADOR':
        return render_template('regisEstudiante.html')
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/alumno/agregar', methods =['POST'])
def registrar_esudiante2():
    if "username" in session and session["username"] =='ADMINISTRADOR':
        if request.method == 'POST':
            estudiante_ID = request.form['estudiante_ID']
            curp = request.form['curp']
            nombre = request.form['nombre']
            apellido_pat = request.form['apellido_pat']
            apellido_mat = request.form['apellido_mat']
            grado = request.form['grado']
            edad = request.form['edad']
            nombre_tutor = request.form['nombre_tutor']
            telefono_casa = request.form['telefono_casa']
            telefono_celular = request.form['telefono_celular']
            correo_electronico = request.form['correo_electronico']
            passwords = request.form['passwords']
            dia_registro = request.form['dia_registro']
            estado = request.form['estado']
            try:
                coneccion.insertarestud(estudiante_ID, curp,nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono_casa, telefono_celular,correo_electronico, passwords, dia_registro,estado)
                flash('Tu cuenta ha quedado Registrada, por favor inicia sesion')
                return redirect(url_for('registrar_esudiante'))            
            except:
                return 'Hubo un error favor de intentar de nuevo'
        else:
            return render_template('index.html')
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

###Ingresar como profesor
@app.route('/profesor')
def loggin_profesor():
    if "username" in session and session["username"] =='ADMINISTRADOR':
        return render_template('logginprofesor.html')
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

##Registrar profesores
@app.route('/profesor/registroprofesor')
def registrar_profesores():
    if "username" in session and session["username"] =='ADMINISTRADOR':
        return render_template('regisprofe.html')
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/profesor_grado/agregar', methods =['POST'])
def registrar_profesor():
    if "username" in session and session["username"] =='ADMINISTRADOR':
        if request.method == 'POST':
            profesor_ID = request.form['profesor_ID']
            curp = request.form['CURP']
            nombre = request.form['nombre']
            apellido_pat = request.form['apellido_pat']
            apellido_mat = request.form['apellido_mat']
            edad = request.form['edad']
            telefono = request.form['telefono']
            correo_electronico = request.form['correo_electronico']
            passwords = request.form['passwords']
            estado = request.form['estado']
            grado = (request.form['grado'])#.upper()
            #try:
            coneccion.insertarprof_grado(profesor_ID, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords,estado, grado)
            flash('El profesor fue registrado sattisfacotriamente')
            return redirect(url_for('registrar_profesores'))
            #except:
            flash('Hubo algun problema intetalo de nuevo')
            return "Hubo un problema"
        else:
            return render_template('index.html')
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/profesor_especialista/agregar', methods =['POST'])
def registrar_profesor_esp():
    if "username" in session and session["username"] =='ADMINISTRADOR':
        if request.method == 'POST':
            profesor_ID = request.form['profesor_ID']
            curp = request.form['CURP']
            nombre = request.form['nombre']
            apellido_pat = request.form['apellido_pat']
            apellido_mat = request.form['apellido_mat']
            edad = request.form['edad']
            telefono = request.form['telefono']
            correo_electronico = request.form['correo_electronico']
            passwords = request.form['passwords']
            estado = request.form['estado']
            grado = (request.form['grado']).upper()
            nombre_materia = request.form['nom_materia']
            try:
                coneccion.insertarprof_especialista(profesor_ID, curp, nombre, apellido_pat, apellido_mat, edad, telefono, correo_electronico, passwords,estado, grado, nombre_materia)
                flash('El profesor fue registrado sattisfacotriamente')
                return redirect(url_for('registrar_profesores'))
            except:
                flash('Hubo algun problema intetalo de nuevo')
                return redirect(url_for('registrar_profesores'))
        else:
            return render_template('index.html')
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))
####Editar datos del alumno

@app.route('/actualizardatos/alumno/<ids>', methods=['POST'])
def actualizar_datos_alumno(ids):
    if "username" in session and session["username"] =='ADMINISTRADOR':    
        if request.method == 'POST':
            curp = request.form['curp']
            nombre = request.form['nombre']
            apellido_pat = request.form['apellido_p']
            apellido_mat = request.form['apellido_m']
            grado = request.form['grado']
            edad = request.form['edad']
            nombre_tutor = request.form['nombre_tutor']
            telefono_casa = request.form['telefono_casa']
            telefono_celular = request.form['telefono_celular']
            correo_electronico = request.form['correo_electronico']
            estado = request.form['estado']
            #try:
            coneccion.actualizar_alumno(curp,nombre, apellido_pat, apellido_mat, grado, edad, nombre_tutor, telefono_casa, telefono_celular, correo_electronico, estado, ids)
            flash("Se Actualizaron los datos correctamente!")
            return redirect(url_for('administrador'))
            #except:
            flash("Hubo algún problema, intente de nuevo")
            return "Hubo un problema"
        else:
            return render_template('index.html')
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

##Vista de profesores
@app.route('/verProfesor')
def profesor():
    if "username" in session and session["username"] =='ADMINISTRADOR':
        grado = coneccion.consulta_all_prof_grado()
        especialista = coneccion.consulta_all_prof_esp()
        return render_template('verProfesor.html', prof_g = grado, prof_e = especialista)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

##Tabla con calificaciones
@app.route('/calificaciones')
def calificaciones():
    if "username" in session and session["username"] =='ADMINISTRADOR':
        calificaciones = coneccion.consulta_materias()
        return render_template('calif.html', calif = calificaciones)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

###Visualizar la materia
@app.route('/materia')
def materia2():
    if "username" in session and session["username"] =='ADMINISTRADOR':
        return render_template('regismateria.html')
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

###Registrar materia
@app.route('/registroMateria', methods = ['POST'])
def materia():
    if "username" in session and session["username"] =='ADMINISTRADOR':
        if request.method == 'POST':
            materia_ID = request.form['materia_ID']
            nombre = request.form['nombre']
            estado = request.form['estado']
            grado = request.form['grado']
            #try:
            coneccion.insertamateria(materia_ID, nombre, estado, grado)
            flash('La materia se registro sattisfacotriamente')
            return redirect(url_for('materia2'))
            #except:
            flash('Hubo algun problema intetalo de nuevo')
            return "Hubo un problema"
        else:
            return render_template('index.html')
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/inscripcionalumno/<id_alumno>/<grupo>')
def inscripcionalumno(id_alumno, grupo):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        coneccion.inscripcion_estudiante_ID(grupo, id_alumno)
        return redirect(url_for('administrador'))

    if "username" in session and session["username"] =='profesor_grado':
        coneccion.inscripcion_estudiante_ID(grupo, id_alumno)
        estudiantes = coneccion.consulta_estudiantes(grupo)
        return render_template('veralumno.html', estu=estudiantes, bandera=1 )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

###########################Cambiar calificaciones######Rutas#########################
@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>')
def cambiar_calificacion1(e_ID,grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        grados = coneccion.clave(grado)
        clave_prof_g= coneccion.clave_prof_grado(grado)
        return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='1', lista=grados, clave_prof_g=clave_prof_g, bandera=1)

    if "username" in session and session["username"] =='profesor_grado':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        grados = coneccion.clave(grado)
        clave_prof_g= coneccion.clave_prof_grado(grado)
        return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='1', lista=grados, clave_prof_g=clave_prof_g, bandera=1)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>/2')
def cambiar_calificacion2(e_ID,grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        lista = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20']
        return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='2', lista=lista )

    if "username" in session and session["username"] =='profesor_grado':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        lista = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20']
        return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='2', lista=lista )    
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>/3')
def cambiar_calificacion3(e_ID,grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        lista = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20']
        return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='3', lista=lista )

    if "username" in session and session["username"] =='profesor_grado':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        lista = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20']
        return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='3', lista=lista )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>/4')
def cambiar_calificacion4(e_ID,grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        lista = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20']
        return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='4', lista=lista )

    if "username" in session and session["username"] =='profesor_grado':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        lista = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20']
        return render_template('cambiarCalif.html', estudiante=est, materia=m_inscrita, num='4', lista=lista )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))
#########################################################################################

###########################Cambiar calificaciones Especialistas######Rutas#########################
@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>/<id_profesor>')
def cambiar_calificacion1_esp(e_ID,grado, id_profesor):
    if "username" in session and session["username"] =='profesor_especialista':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        d = coneccion.especialista_calif(id_profesor)
        print(d[0][0], d[0][1],grado)
        r = coneccion.obtener_Rango(grado, str(d[0][0]), str(d[0][1]))
        print(r)
        materia_especial = []
        if m_inscrita:
            materia_especial.append(m_inscrita[r])
        print(materia_especial)
        print(r)
        return render_template('cambiarCalifEsp.html', estudiante=est, materia=materia_especial, num='1', bandera=1,clave_prof_g=id_profesor)        

    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>/<id_profesor>/2')
def cambiar_calificacion1_esp2(e_ID,grado, id_profesor):
    if "username" in session and session["username"] =='profesor_especialista':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        d = coneccion.especialista_calif(id_profesor)
        r = coneccion.obtener_Rango(grado, str(d[0][0]), str(d[0][1]))
        materia_especial = []
        if m_inscrita:
            materia_especial.append(m_inscrita[r])
        print(materia_especial)
        print(r)
        return render_template('cambiarCalifEsp.html', estudiante=est, materia=materia_especial, num='2', bandera=1,clave_prof_g=id_profesor)        

    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>/<id_profesor>/3')
def cambiar_calificacion1_esp3(e_ID,grado, id_profesor):
    if "username" in session and session["username"] =='profesor_especialista':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        d = coneccion.especialista_calif(id_profesor)
        r = coneccion.obtener_Rango(grado, str(d[0][0]), str(d[0][1]))
        materia_especial = []
        if m_inscrita:
            materia_especial.append(m_inscrita[r])
        print(materia_especial)
        print(r)
        return render_template('cambiarCalifEsp.html', estudiante=est, materia=materia_especial, num='3', bandera=1,clave_prof_g=id_profesor)        
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/editar/cambiar/calificaciones/<e_ID>/<grado>/<id_profesor>/4')
def cambiar_calificacion1_esp4(e_ID,grado, id_profesor):
    if "username" in session and session["username"] =='profesor_especialista':
        p_id = coneccion.consulta_prof_grado2(grado)
        m_inscrita = coneccion.consulta_inscrita2(int(e_ID), p_id,grado)
        est = coneccion.consulta_estudiantes_id(e_ID,grado)
        d = coneccion.especialista_calif(id_profesor)
        r = coneccion.obtener_Rango(grado, str(d[0][0]), str(d[0][1]))
        materia_especial = []
        if m_inscrita:
            materia_especial.append(m_inscrita[r])
        print(materia_especial)
        print(r)
        return render_template('cambiarCalifEsp.html', estudiante=est, materia=materia_especial, num='4', bandera=1,clave_prof_g=id_profesor)        

    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))
#################################Cambiar Calificaciones Coneccion a base#########################
@app.route('/guardar1/calificacion/Bimestre_1/<id_materia>/<id_estudiante>/<id_profesor>/<grado>', methods = ['POST'])
def cambiar_calificacion_Bimestre1(id_materia, id_estudiante, id_profesor,grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        if request.method == 'POST':
            campo1_B1 = float(request.form['campo1_B1']) ##Examenes
            campo2_B1 = float(request.form['campo2_B1']) ## Tareas
            campo3_B1 = float(request.form['campo3_B1']) ##Exposisicon
            campo4_B1 = float(request.form['campo4_B1']) ## Asistencia
            campo5_B1 = float(request.form['campo5_B1']) ##Cuaderno
            promedio = (float(campo1_B1)*.50) + ((campo2_B1)*.15) + ((campo3_B1)*.15) + ((campo4_B1)*.10) + ((campo5_B1)*.10)
            try:
                coneccion.insertarcalificacion_Bimestre1(campo1_B1,campo2_B1,campo3_B1, campo4_B1,campo5_B1 ,promedio, id_estudiante, id_materia, id_profesor)
                flash('La Calificacion se Actualizó correctamente')
                return redirect(url_for('administrador'))
            except:
                flash('La materia no se pudo actualizar')
                return redirect(url_for('administrador'))
        else:
            return render_template('index.html')

    if "username" in session and session["username"] =='profesor_grado':
        if request.method == 'POST':
            campo1_B1 = float(request.form['campo1_B1']) ##Examenes
            campo2_B1 = float(request.form['campo2_B1']) ## Tareas
            campo3_B1 = float(request.form['campo3_B1']) ##Exposisicon
            campo4_B1 = float(request.form['campo4_B1']) ## Asistencia
            campo5_B1 = float(request.form['campo5_B1']) ##Cuaderno
            promedio = (float(campo1_B1)*.50) + ((campo2_B1)*.15) + ((campo3_B1)*.15) + ((campo4_B1)*.10) + ((campo5_B1)*.10)
            try:
                coneccion.insertarcalificacion_Bimestre1(campo1_B1,campo2_B1,campo3_B1, campo4_B1,campo5_B1 ,promedio, id_estudiante, id_materia, id_profesor)
                flash('La Calificacion se Actualizó correctamente')
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera=1)
            except:
                flash('La materia no se pudo actualizar')
                return render_template('veralumno.html', estu=estudiantes, bandera=1)
        else:
            return render_template('index.html')

    if "username" in session and session["username"] =='profesor_especialista':
        if request.method == 'POST':
            campo1_B1 = float(request.form['campo1_B1']) ##Examenes
            campo2_B1 = float(request.form['campo2_B1']) ## Tareas
            campo3_B1 = float(request.form['campo3_B1']) ##Exposisicon
            campo4_B1 = float(request.form['campo4_B1']) ## Asistencia
            campo5_B1 = float(request.form['campo5_B1']) ##Cuaderno
            promedio = (float(campo1_B1)*.50) + ((campo2_B1)*.15) + ((campo3_B1)*.15) + ((campo4_B1)*.10) + ((campo5_B1)*.10)
            try:

                coneccion.insertarcalificacion_Bimestre1(campo1_B1,campo2_B1,campo3_B1, campo4_B1,campo5_B1 ,promedio, id_estudiante, id_materia, id_profesor)
                flash('La Calificacion se Actualizó correctamente')
                estudiantes = coneccion.consulta_estudiantes(grupo)
                return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_profesor )
            except:
                flash('La materia no se pudo actualizar')
                return "Algo fallo"
        else:
            return render_template('index.html')

    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/guardar/calificacion/Bimestre_2/<id_materia>/<id_estudiante>/<id_profesor>/<grado>', methods = ['POST', 'GET'])
def cambiar_calificacion_Bimestre2(id_materia, id_estudiante, id_profesor, grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':    
        if request.method == 'POST':
            campo1_B2 = float(request.form['campo1_B2']) ##Examenes
            campo2_B2 = float(request.form['campo2_B2'])## Tareas
            campo3_B2 = float(request.form['campo3_B2']) ##Exposisicon
            campo4_B2 = float(request.form['campo4_B2']) ## Asistencia
            campo5_B2 = float(request.form['campo5_B2']) ##Cuaderno
            promedio = (float((campo1_B2)*.50) + ((campo2_B2)*.15) + ((campo3_B2)*.15) + ((campo4_B2)*.10) + ((campo5_B2)*.10))
            try:
                coneccion.insertarcalificacion_Bimestre2(campo1_B2, campo2_B2, campo3_B2, campo4_B2, campo5_B2,promedio, id_estudiante, id_materia, id_profesor)
                flash('La Calificacion se Actualizó correctamente')
                return redirect(url_for('administrador'))
            except:
                flash('La materia no se pudo actualizar')
                return redirect(url_for('administrador'))

    if "username" in session and session["username"] =='profesor_grado':    
        if request.method == 'POST':
            campo1_B2 = float(request.form['campo1_B2']) ##Examenes
            campo2_B2 = float(request.form['campo2_B2'])## Tareas
            campo3_B2 = float(request.form['campo3_B2']) ##Exposisicon
            campo4_B2 = float(request.form['campo4_B2']) ## Asistencia
            campo5_B2 = float(request.form['campo5_B2']) ##Cuaderno
            promedio = (float((campo1_B2)*.50) + ((campo2_B2)*.15) + ((campo3_B2)*.15) + ((campo4_B2)*.10) + ((campo5_B2)*.10))
            try:
                coneccion.insertarcalificacion_Bimestre2(campo1_B2, campo2_B2, campo3_B2, campo4_B2, campo5_B2,promedio, id_estudiante, id_materia, id_profesor)
                flash('La Calificacion se Actualizó correctamente')
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera=1)
            except:
                flash('La materia no se pudo actualizar')
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera=1)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/guardar/calificacion/Bimestre_3/<id_materia>/<id_estudiante>/<id_profesor>/<grado>', methods = ['POST'])
def cambiar_calificacion_Bimestre3(id_materia, id_estudiante, id_profesor, grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        if request.method == 'POST':
            campo1_B3 = float(request.form['campo1_B3']) ##Examenes
            campo2_B3 = float(request.form['campo2_B3']) ## Tareas
            campo3_B3 = float(request.form['campo3_B3']) ##Exposisicon
            campo4_B3 = float(request.form['campo4_B3']) ## Asistencia
            campo5_B3 = float(request.form['campo5_B3']) ##Cuaderno
            promedio = float((campo1_B3)*.50) + ((campo2_B3)*.15) + ((campo3_B3)*.15) + ((campo4_B3)*.10) + ((campo5_B3)*.10)
            try:
                coneccion.insertarcalificacion_Bimestre3(campo1_B3, campo2_B3, campo3_B3, campo4_B3, campo5_B3,promedio, id_estudiante, id_materia, id_profesor)
                flash('La Calificacion se Actualizó correctamente')
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera=1)
            except:
                flash('La materia no se pudo actualizar')
                return redirect(url_for('administrador'))

    if "username" in session and session["username"] =='profesor_grado':
        if request.method == 'POST':
            campo1_B3 = float(request.form['campo1_B3']) ##Examenes
            campo2_B3 = float(request.form['campo2_B3']) ## Tareas
            campo3_B3 = float(request.form['campo3_B3']) ##Exposisicon
            campo4_B3 = float(request.form['campo4_B3']) ## Asistencia
            campo5_B3 = float(request.form['campo5_B3']) ##Cuaderno
            promedio = float((campo1_B3)*.50) + ((campo2_B3)*.15) + ((campo3_B3)*.15) + ((campo4_B3)*.10) + ((campo5_B3)*.10)
            try:
                coneccion.insertarcalificacion_Bimestre3(campo1_B3, campo2_B3, campo3_B3, campo4_B3, campo5_B3,promedio, id_estudiante, id_materia, id_profesor)
                flash('La Calificacion se Actualizó correctamente')
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera=1)
            except:
                flash('La materia no se pudo actualizar')
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera=1)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))    

@app.route('/guardar/calificacion/Bimestre_4/<id_materia>/<id_estudiante>/<id_profesor>/<grado>', methods = ['POST'])
def cambiar_calificacion_Bimestre4(id_materia, id_estudiante, id_profesor, grado):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        if request.method == 'POST':
            campo1_B4 = float(request.form['campo1_B4']) ##Examenes
            campo2_B4 = float(request.form['campo2_B4']) ## Tareas
            campo3_B4 = float(request.form['campo3_B4']) ##Exposisicon
            campo4_B4 = float(request.form['campo4_B4']) ## Asistencia
            campo5_B4 = float(request.form['campo5_B4']) ##Cuaderno
            promedio = float((campo1_B4)*.50) + ((campo2_B4)*.15) + ((campo3_B4)*.15) + ((campo4_B4)*.10) + ((campo5_B4)*.10)
            try:
                coneccion.insertarcalificacion_Bimestre4(campo1_B4, campo2_B4, campo3_B4, campo4_B4, campo5_B4,promedio, id_estudiante, id_materia, id_profesor)
                flash('La Calificacion se Actualizó correctamente')
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera=1)
            except:
                flash('La materia no se pudo actualizar')
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera=1)

    if "username" in session and session["username"] =='profesor_grado':
        if request.method == 'POST':
            campo1_B4 = float(request.form['campo1_B4']) ##Examenes
            campo2_B4 = float(request.form['campo2_B4']) ## Tareas
            campo3_B4 = float(request.form['campo3_B4']) ##Exposisicon
            campo4_B4 = float(request.form['campo4_B4']) ## Asistencia
            campo5_B4 = float(request.form['campo5_B4']) ##Cuaderno
            promedio = float((campo1_B4)*.50) + ((campo2_B4)*.15) + ((campo3_B4)*.15) + ((campo4_B4)*.10) + ((campo5_B4)*.10)
            #try:
            coneccion.insertarcalificacion_Bimestre4(campo1_B4, campo2_B4, campo3_B4, campo4_B4, campo5_B4,promedio, id_estudiante, id_materia, id_profesor)
            flash('La Calificacion se Actualizó correctamente')
            estudiantes = coneccion.consulta_estudiantes(grado)
            return render_template('veralumno.html', estu=estudiantes, bandera=1)
            """except:
                flash('La materia no se pudo actualizar')
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera=1)"""
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))
#################################################################################################

########################################################################################################
@app.route('/guardar1/calificacion/Bimestre_1/<id_materia>/<id_estudiante>/<id_profesor>/<grado>/<id_esp>', methods = ['POST'])
def cambiar_calificacion_Bimestre1_esp(id_materia, id_estudiante, id_profesor,grado,id_esp):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        if request.method == 'POST':
            campo1_B1 = float(request.form['campo1_B1']) ##Examenes
            campo2_B1 = float(request.form['campo2_B1']) ## Tareas
            campo3_B1 = float(request.form['campo3_B1']) ##Exposisicon
            campo4_B1 = float(request.form['campo4_B1']) ## Asistencia
            campo5_B1 = float(request.form['campo5_B1']) ##Cuaderno
            promedio = (float(campo1_B1)*.50) + ((campo2_B1)*.15) + ((campo3_B1)*.15) + ((campo4_B1)*.10) + ((campo5_B1)*.10)
            #try:
            coneccion.insertarcalificacion_Bimestre1(campo1_B1,campo2_B1,campo3_B1, campo4_B1,campo5_B1 ,promedio, id_estudiante, id_materia, id_profesor)
            flash('La Calificacion se Actualizó correctamente')
            estudiantes = coneccion.consulta_estudiantes(grado)
            return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_esp )
            #except:
            flash('La materia no se pudo actualizar')
            return "Algo fallo"
        else:
            return render_template('index.html')        
    if "username" in session and session["username"] =='profesor_especialista':
        if request.method == 'POST':
            campo1_B1 = float(request.form['campo1_B1']) ##Examenes
            campo2_B1 = float(request.form['campo2_B1']) ## Tareas
            campo3_B1 = float(request.form['campo3_B1']) ##Exposisicon
            campo4_B1 = float(request.form['campo4_B1']) ## Asistencia
            campo5_B1 = float(request.form['campo5_B1']) ##Cuaderno
            promedio = (float(campo1_B1)*.50) + ((campo2_B1)*.15) + ((campo3_B1)*.15) + ((campo4_B1)*.10) + ((campo5_B1)*.10)
            #try:
            coneccion.insertarcalificacion_Bimestre1(campo1_B1,campo2_B1,campo3_B1, campo4_B1,campo5_B1 ,promedio, id_estudiante, id_materia, id_profesor)
            flash('La Calificacion se Actualizó correctamente')
            estudiantes = coneccion.consulta_estudiantes(grado)
            return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_esp )
            #except:
            flash('La materia no se pudo actualizar')
            return "Algo fallo"
        else:
            return render_template('index.html')

    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/guardar/calificacion/Bimestre_2/<id_materia>/<id_estudiante>/<id_profesor>/<grado>/<id_esp>', methods = ['POST', 'GET'])
def cambiar_calificacion_Bimestre2_esp(id_materia, id_estudiante, id_profesor, grado,id_esp):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        if request.method == 'POST':
            campo1_B2 = float(request.form['campo1_B2']) ##Examenes
            campo2_B2 = float(request.form['campo2_B2'])## Tareas
            campo3_B2 = float(request.form['campo3_B2']) ##Exposisicon
            campo4_B2 = float(request.form['campo4_B2']) ## Asistencia
            campo5_B2 = float(request.form['campo5_B2']) ##Cuaderno
            promedio = (float((campo1_B2)*.50) + ((campo2_B2)*.15) + ((campo3_B2)*.15) + ((campo4_B2)*.10) + ((campo5_B2)*.10))
            #try:
            coneccion.insertarcalificacion_Bimestre2(campo1_B2, campo2_B2, campo3_B2, campo4_B2, campo5_B2,promedio, id_estudiante, id_materia, id_profesor)
            flash('La Calificacion se Actualizó correctamente')
            estudiantes = coneccion.consulta_estudiantes(grado)
            return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_esp )
            #except:
            flash('La materia no se pudo actualizar')
            return redirect(url_for('administrador'))
                
    if "username" in session and session["username"] =='profesor_especialista':    
        if request.method == 'POST':
            campo1_B2 = float(request.form['campo1_B2']) ##Examenes
            campo2_B2 = float(request.form['campo2_B2'])## Tareas
            campo3_B2 = float(request.form['campo3_B2']) ##Exposisicon
            campo4_B2 = float(request.form['campo4_B2']) ## Asistencia
            campo5_B2 = float(request.form['campo5_B2']) ##Cuaderno
            promedio = (float((campo1_B2)*.50) + ((campo2_B2)*.15) + ((campo3_B2)*.15) + ((campo4_B2)*.10) + ((campo5_B2)*.10))
            #try:
            coneccion.insertarcalificacion_Bimestre2(campo1_B2, campo2_B2, campo3_B2, campo4_B2, campo5_B2,promedio, id_estudiante, id_materia, id_profesor)
            flash('La Calificacion se Actualizó correctamente')
            estudiantes = coneccion.consulta_estudiantes(grado)
            return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_esp )
            #except:
            flash('La materia no se pudo actualizar')
            return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_esp )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route('/guardar/calificacion/Bimestre_3/<id_materia>/<id_estudiante>/<id_profesor>/<grado>/<id_esp>', methods = ['POST'])
def cambiar_calificacion_Bimestre3_esp(id_materia, id_estudiante, id_profesor, grado,id_esp):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        if request.method == 'POST':
            campo1_B3 = float(request.form['campo1_B3']) ##Examenes
            campo2_B3 = float(request.form['campo2_B3']) ## Tareas
            campo3_B3 = float(request.form['campo3_B3']) ##Exposisicon
            campo4_B3 = float(request.form['campo4_B3']) ## Asistencia
            campo5_B3 = float(request.form['campo5_B3']) ##Cuaderno
            promedio = float((campo1_B3)*.50) + ((campo2_B3)*.15) + ((campo3_B3)*.15) + ((campo4_B3)*.10) + ((campo5_B3)*.10)
            try:
                coneccion.insertarcalificacion_Bimestre3(campo1_B3, campo2_B3, campo3_B3, campo4_B3, campo5_B3,promedio, id_estudiante, id_materia, id_profesor)
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_esp )
            except:
                flash('La materia no se pudo actualizar')
                return redirect(url_for('administrador'))
            
    if "username" in session and session["username"] =='profesor_especialista':
        if request.method == 'POST':
            campo1_B3 = float(request.form['campo1_B3']) ##Examenes
            campo2_B3 = float(request.form['campo2_B3']) ## Tareas
            campo3_B3 = float(request.form['campo3_B3']) ##Exposisicon
            campo4_B3 = float(request.form['campo4_B3']) ## Asistencia
            campo5_B3 = float(request.form['campo5_B3']) ##Cuaderno
            promedio = float((campo1_B3)*.50) + ((campo2_B3)*.15) + ((campo3_B3)*.15) + ((campo4_B3)*.10) + ((campo5_B3)*.10)
            try:
                coneccion.insertarcalificacion_Bimestre3(campo1_B3, campo2_B3, campo3_B3, campo4_B3, campo5_B3,promedio, id_estudiante, id_materia, id_profesor)
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_esp )
            except:
                flash('La materia no se pudo actualizar')
                return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_esp )

@app.route('/guardar/calificacion/Bimestre_4/<id_materia>/<id_estudiante>/<id_profesor>/<grado>/<id_esp>', methods = ['POST'])
def cambiar_calificacion_Bimestre4_esp(id_materia, id_estudiante, id_profesor, grado,id_esp):
    if "username" in session and session["username"] =='ADMINISTRADOR':
        if request.method == 'POST':
            campo1_B4 = float(request.form['campo1_B4']) ##Examenes
            campo2_B4 = float(request.form['campo2_B4']) ## Tareas
            campo3_B4 = float(request.form['campo3_B4']) ##Exposisicon
            campo4_B4 = float(request.form['campo4_B4']) ## Asistencia
            campo5_B4 = float(request.form['campo5_B4']) ##Cuaderno
            promedio = float((campo1_B4)*.50) + ((campo2_B4)*.15) + ((campo3_B4)*.15) + ((campo4_B4)*.10) + ((campo5_B4)*.10)
            try:
                coneccion.insertarcalificacion_Bimestre4(campo1_B4, campo2_B4, campo3_B4, campo4_B4, campo5_B4,promedio, id_estudiante, id_materia, id_profesor)
                flash('La Calificacion se Actualizó correctamente')
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_esp )
            except:
                flash('La materia no se pudo actualizar')
                return redirect(url_for('administrador'))        
    if "username" in session and session["username"] =='profesor_especialista':
        if request.method == 'POST':
            campo1_B4 = float(request.form['campo1_B4']) ##Examenes
            campo2_B4 = float(request.form['campo2_B4']) ## Tareas
            campo3_B4 = float(request.form['campo3_B4']) ##Exposisicon
            campo4_B4 = float(request.form['campo4_B4']) ## Asistencia
            campo5_B4 = float(request.form['campo5_B4']) ##Cuaderno
            promedio = float((campo1_B4)*.50) + ((campo2_B4)*.15) + ((campo3_B4)*.15) + ((campo4_B4)*.10) + ((campo5_B4)*.10)
            try:
                coneccion.insertarcalificacion_Bimestre4(campo1_B4, campo2_B4, campo3_B4, campo4_B4, campo5_B4,promedio, id_estudiante, id_materia, id_profesor)
                flash('La Calificacion se Actualizó correctamente')
                estudiantes = coneccion.consulta_estudiantes(grado)
                return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_esp )
            except:
                flash('La materia no se pudo actualizar')
                return render_template('veralumno.html', estu=estudiantes, bandera2=1,prof_esp=id_esp )
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))
#######################################################################################################3
##Correos
@app.route("/correos")
def correos():
    if "username" in session and session["username"] =='ADMINISTRADOR':    
        return render_template("correos.html")
#@app.route("/correos/Enviar")
@app.route("/Correos/1")
def correos_1():
    if "username" in session and session["username"] =='ADMINISTRADOR':        
        return render_template("correos.html", opcion1=1)

@app.route("/correos/Enviar", methods=['POST'])
def enviar_correos():
    if "username" in session and session["username"] =='ADMINISTRADOR':    
        if request.method == 'POST':
            direccion = request.form['correo_destinatario']
            asunto = request.form['asunto']
            cuerpo = request.form['cuerpo']
            opcion = request.form['opcion']
            #### Obtenemos el grado
            grado = request.form['grado']
            ###Correo individual
            if grado =='000':
                if opcion == '0':
                    enviar.enviar_correo(direccion,cuerpo, asunto)
                if opcion == '1':
                    img.generar_imagen(direccion,'', '', cuerpo,'', direccion)
                    enviar.enviar_correo_img(direccion, asunto)
            ###Correos para niños###############################################33                
        #try:
            ##Correos para kinder 1
            if grado =='001':
                if opcion == '0':
                    job = q.enqueue(au.automatico_txt, 'K1', cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico, 'K1', cuerpo, asunto)
            ##Correos para kinder 2
            if grado == '002':
                if opcion == '0':
                    job = q.enqueue(au.automatico_txt, 'K2', cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico, 'K2', cuerpo, asunto)
            ##Correos para kinder 3
            if grado == '003':
                if opcion == '0':
                    job = q.enqueue(au.automatico_txt, 'K3', cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico, 'K3', cuerpo, asunto)
            ##Correos para Primero de Primaria
            if grado == '1':
                lista = coneccion.correos_estudiante('1ro')
                if opcion == '0':
                    job = q.enqueue(au.automatico_txt, '1ro', cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico, '1ro', cuerpo, asunto)
            ##Correos para Segundo de Primaria
            if grado == '2':
                if opcion == '0':
                    job = q.enqueue(au.automatico_txt, '2do', cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico, '2do', cuerpo, asunto)
            ##Correos para Tercero de Primaria
            if grado == '3':
                if opcion == '0':
                    job = q.enqueue(au.automatico_txt, '3ro', cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico, '3ro', cuerpo, asunto)
            ##Correos para Cuarto de Primaria
            if grado == '4':
                if opcion == '0':
                    job = q.enqueue(au.automatico_txt, '4to', cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico, '4to', cuerpo, asunto)
            ##Correos para quinto de Primaria
            if grado == '5':
                if opcion == '0':
                    job = q.enqueue(au.automatico_txt, '5to', cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico, '5to', cuerpo, asunto)
            ##Correos para sexto de Primaria
            if grado == '6':
                if opcion == '0':
                    job = q.enqueue(au.automatico_txt, '6to', cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico, '6to', cuerpo, asunto)
            ###Correos para toda la escuela
            if grado =='1021':
                if opcion == '0':
                    job = q.enqueue(au.automatico_txt, 'K1', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, 'K2', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, 'K3', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, '1ro', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, '2do', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, '3ro', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, '4to', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, '5to', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, '6to', cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico, 'K1', cuerpo, asunto)
                    job = q.enqueue(au.automatico, 'K2', cuerpo, asunto)
                    job = q.enqueue(au.automatico, 'K3', cuerpo, asunto)
                    job = q.enqueue(au.automatico, '1ro', cuerpo, asunto)
                    job = q.enqueue(au.automatico, '2do', cuerpo, asunto)
                    job = q.enqueue(au.automatico, '3ro', cuerpo, asunto)
                    job = q.enqueue(au.automatico, '4to', cuerpo, asunto)
                    job = q.enqueue(au.automatico, '5to', cuerpo, asunto)
                    job = q.enqueue(au.automatico, '6to', cuerpo, asunto)
            ###Correos para toda Primaria
            if grado =='1022':
                if opcion == '0':
                    job = q.enqueue(au.automatico_txt, '1ro', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, '2do', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, '3ro', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, '4to', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, '5to', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, '6to', cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico, '1ro', cuerpo, asunto)
                    job = q.enqueue(au.automatico, '2do', cuerpo, asunto)
                    job = q.enqueue(au.automatico, '3ro', cuerpo, asunto)
                    job = q.enqueue(au.automatico, '4to', cuerpo, asunto)
                    job = q.enqueue(au.automatico, '5to', cuerpo, asunto)
                    job = q.enqueue(au.automatico, '6to', cuerpo, asunto)
            ###Correos para todo Kinder
            if grado =='1023':
                if opcion == '0':
                    job = q.enqueue(au.automatico_txt, 'K1', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, 'K2', cuerpo, asunto)
                    job = q.enqueue(au.automatico_txt, 'K3', cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico, 'K1', cuerpo, asunto)
                    job = q.enqueue(au.automatico, 'K2', cuerpo, asunto)
                    job = q.enqueue(au.automatico, 'K3', cuerpo, asunto)
            ##Profesores Grado Primaria y Kinder
            if grado =='100':
                if opcion == '0':
                    job = q.enqueue(au.automatico_prof_grado_txt, cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico_prof_grado, cuerpo, asunto)
            ##Profesores especialsitas
            if grado =='1000':
                if opcion == '0':
                    job = q.enqueue(au.automatico_prof_especialistas_txt, cuerpo, asunto)
                if opcion == '1':
                    job = q.enqueue(au.automatico_prof_especialistas, cuerpo, asunto)
            flash("Mensaje Enviado Por favor espere 3 minutos para enviar otro correo ")
            return redirect(url_for("correos"))
################3

@app.route("/tarea/<ids>/<grupo>", methods=['GET','POST'])
def tarea(ids, grupo):
    if "username" in session and session["username"] =='ADMINISTRADOR' or "username" in session and session["username"] =='profesor_grado' or "username" in session and session["username"] =='profesor_especialista':    
        print(ids)
        return render_template("crear_tarea.html",idp=ids, grupo=grupo, bandera=1)

@app.route("/tarea_act/<ids>/<grupo>/<id_tarea>", methods=['GET','POST'])
def tarea_act(ids, grupo,id_tarea):
    if "username" in session and session["username"] =='ADMINISTRADOR' or "username" in session and session["username"] =='profesor_grado' or "username" in session and session["username"] =='profesor_especialista':
        if request.method == 'POST':
            nombre_materia = request.form['nombre_materia']
            grado = request.form['grado']
            desc_enc = request.form['desc_enc']
            desc_cuerpo = request.form['desc_cuerpo']
            link = request.form['link']
            link2 = request.form['link2']
            coneccion.actualizar_tarea(nombre_materia, grado, desc_enc, desc_cuerpo, link, link2, id_tarea)
            flash("La Tarea ha actualizado correctamente")
            print(nombre_materia, grado, desc_enc, desc_cuerpo, link, link2)
            return render_template("crear_tarea.html", idp=ids, grupo=grupo, bandera=1)    
        else:
            print(ids)
            return render_template("crear_tarea.html",idp=ids, grupo=grupo, bandera=1)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))
        


@app.route("/verTareas/<ids>/<grupo>", methods = ['POST'])
def verTareas(ids, grupo):
    if "username" in session and session["username"] =='ADMINISTRADOR' or "username" in session and session["username"] =='profesor_grado' or "username" in session and session["username"] =='profesor_especialista':
        if request.method == 'POST':
            if request.form['submit'] =='Solo Guardar':
                nombre_materia = request.form['nombre_materia']
                grado = request.form['grado']
                desc_enc = request.form['desc_enc']
                desc_cuerpo = request.form['desc_cuerpo']
                link = request.form['link']
                link2 = request.form['link2']
                coneccion.insertar_tarea(nombre_materia, grado, desc_enc, desc_cuerpo, link, link2)
                flash("La Tarea se guardó correctamente")
                return render_template("crear_tarea.html", idp=ids, grupo=grupo, bandera=1)
        
            elif request.form['submit'] =='Guardar y Notificar':
                dpe = coneccion.obtener_datos_prof_especialista(ids)
                dpg = coneccion.obtener_datos_prof_grado(ids)
                nombre_materia = request.form['nombre_materia']
                grado = request.form['grado']
                desc_enc = request.form['desc_enc']
                desc_cuerpo = request.form['desc_cuerpo']
                link = request.form['link']
                link2 = request.form['link']
                if len(dpe) == 0:
                    df = dpg ## Profesor de grado
                else:
                    df = dpe ## Profesor Especialista
                cuerpo = "El profesor "+str(df[0][0])+" "+str(df[0][1])+" "+str(df[0][2]) + " ha actualizado una nueva tarea, por favor, visita la plataforma https://coneyotl.herokuapp.com para saber cual es"
                asunto = "ACTUALIZACION de tareas grupo: "+str(df[0][3])
                print(cuerpo)
                print(asunto)
                coneccion.insertar_tarea(nombre_materia, grado, desc_enc, desc_cuerpo, link, link2)
                job = q.enqueue(au.automatico_txt, str(df[0][3]), cuerpo, asunto)
                flash("La Tarea se guardó correctamente y se notifico los cambios al grupo")
                return render_template("crear_tarea.html", idp=ids, grupo=grupo, bandera=1)

@app.route("/visualizarTareas/<grupo>/<idp>")
def visualizarTareas(grupo, idp):
    if "username" in session and session["username"] =='ADMINISTRADOR' or "username" in session and session["username"] =='profesor_grado' or "username" in session and session["username"] =='profesor_especialista':
        tarea = coneccion.consulta_tarea(grupo)
        return render_template("verTareas.html", tareas=tarea, idp=idp)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route("/cambiarTarea/<ids>/<grupo>/<idp>")
def cambiarTarea(ids, grupo, idp):
    if "username" in session and session["username"] =='ADMINISTRADOR' or "username" in session and session["username"] =='profesor_grado' or "username" in session and session["username"] =='profesor_especialista':
        tarea = coneccion.obtener_tarea_id(ids)
        return render_template("crear_tarea.html", bandera2=1, grupo=grupo, tarea=tarea, idp=idp)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))

@app.route("/eliminarTarea/<ids>")
def eliminarTarea(ids):
    if "username" in session and session["username"] =='ADMINISTRADOR' or "username" in session and session["username"] =='profesor_grado' or "username" in session and session["username"] =='profesor_especialista':
        grupo = coneccion.obtener_grupo_tarea(ids)
        coneccion.eliminar_tarea(ids)
        print(grupo)
        tarea = coneccion.consulta_tarea(grupo[0])
        print(tarea)
        flash("La tarea fue borrada con éxito")
        return render_template("avisos.html", grupo=grupo[0][0], tarea=tarea)
    else:
        flash("Inicia Sesion Primero")
        return redirect(url_for("index"))
    
if __name__ == '__main__':
    app.run(debug=True)
