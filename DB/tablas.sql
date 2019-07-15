CREATE TABLE IF NOT EXISTS estudiante(
    estudiante_ID NUMBER(30) PRIMARY KEY, 
    nombre VARCHAR(20) NOT NULL,
    apellido_pat VARCHAR(20) NOT NULL,
    apellido_mat VARCHAR(20),
    grado VARCHAR(20) NOT NULL,
    edad NUMBER(5) NOT NULL,
    nombre_tutor VARCHAR(50),
    telefono VARCHAR(50),
    dia_registro DATE DEFAULT SYSDATE,
    estado CHAR(2),
    CONSTRAINT estado_ck CHECK(estado IN ('A', 'S', 'B'))
)
;

CREATE TABLE IF NOT EXISTS materia(
    materia_ID NUMBER(30) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    calificacion_B1 NUMBER(5,5) DEFAULT 0,
    calificacion_B2 NUMBER(5,5) DEFAULT 0,
    calificacion_B3 NUMBER(5,5) DEFAULT 0,
    calificacion_B4 NUMBER(5,5) DEFAULT 0,
    calificacion_B5 NUMBER(5,5) DEFAULT 0,
    promedio NUMBER(5,5) DEFAULT 0,
    estado CHAR(2),
    CONSTRAINT estado_ck CHECK(estado IN ('A', 'S', 'B'))
)
;

CREATE TABLE IF NOT EXISTS profesor_grado(
    profesor_ID NUMBER(10),
    nombre VARCHAR(30) NOT NULL, 
    apellido_pat VARCHAR(30) NOT NULL,
    apellido_mat VARCHAR(30),
    edad NUMBER(2) NOT NULL,
    telefono VARCHAR(30),
    estado CHAR(2),
    grado VARCHAR(40) NOT NULL, 
    CONSTRAINT estado_ck CHECK(estado IN ('A', 'S', 'B'))
)
;
CREATE TABLE IF NOT EXISTS profesor_especialista(
    profesor_ID NUMBER(10),
    nombre VARCHAR(30) NOT NULL, 
    apellido_pat VARCHAR(30) NOT NULL,
    apellido_mat VARCHAR(30),
    edad NUMBER(2) NOT NULL,
    telefono VARCHAR(30),
    estado CHAR(2),
    grado VARCHAR(40) NOT NULL,
    nombre_materia VARCHAR(30), 
    CONSTRAINT estado_ck CHECK(estado IN ('A', 'S', 'B'))    
)
;

CREATE TABLE IF NOT EXISTS inscripcion_grado(
    estudiante_ID_fk CONSTRAINT _ID REFERENCES estudiante(estudiante_ID),
    materia_ID_fk CONSTRAINT _ID REFERENCES materia(materia_ID),
    profesor_ID_fk CONSTRAINT _ID REFERENCEs profesor_grado(profesor_ID)
)
;

CREATE TABLE IF NOT EXISTS inscripcion_especialista(
    estudiante_ID_fk CONSTRAINT _ID REFERENCES estudiante(estudiante_ID),
    materia_ID_fk CONSTRAINT _ID REFERENCES materia(materia_ID),
    profesor_ID_fk CONSTRAINT _ID REFERENCEs profesor_especialista(profesor_ID)
)
;