--
-- ER/Studio 8.0 SQL Code Generation
-- Project :      Base_Coneyotl.DM1
--
-- Date Created : Monday, April 13, 2020 02:23:46
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: Estudiante 
--

CREATE TABLE Estudiante(
    Estudiante_ID       NUMBER(10, 0)    NOT NULL,
    Nombre              VARCHAR2(10),
    Apellido_Paterno    VARCHAR2(10),
    Apellido_Materno    VARCHAR2(10),
    Grado               VARCHAR2(10),
    Edad                VARCHAR2(10),
    Nombre_Tutor        VARCHAR2(10),
    Telefono            NUMBER(20, 0),
    Status              CHAR(10),
    CONSTRAINT PK1 PRIMARY KEY (Estudiante_ID)
)
;



-- 
-- TABLE: Inscripcion 
--

CREATE TABLE Inscripcion(
    Estudiante_ID    NUMBER(10, 0)    NOT NULL,
    Materia_ID       NUMBER(10, 0)    NOT NULL,
    Profesor_ID      NUMBER(10, 0),
    CONSTRAINT PK4 PRIMARY KEY (Estudiante_ID, Materia_ID)
)
;



-- 
-- TABLE: Materia 
--

CREATE TABLE Materia(
    Materia_ID                 NUMBER(10, 0)    NOT NULL,
    Nombre                     VARCHAR2(10),
    Calificacion_Bimestre_1    NUMBER(10, 0),
    Calificacion_Bimestre_2    NUMBER(10, 0),
    Calificacion_Bimestre_3    NUMBER(10, 0),
    Calificacion_Bimestre_4    NUMBER(10, 0),
    Estatus_materia            CHAR(10),
    CONSTRAINT PK2 PRIMARY KEY (Materia_ID)
)
;



-- 
-- TABLE: Profesor 
--

CREATE TABLE Profesor(
    Profesor_ID         NUMBER(10, 0)    NOT NULL,
    Nombre              VARCHAR2(10),
    Apellido_Paterno    VARCHAR2(10),
    Edad                NUMBER(10, 0),
    Telefono            NUMBER(10, 0),
    Status              CHAR(10),
    CONSTRAINT PK3 PRIMARY KEY (Profesor_ID)
)
;



-- 
-- TABLE: Profesor_Especialista 
--

CREATE TABLE Profesor_Especialista(
    Profesor_ID       NUMBER(10, 0)    NOT NULL,
    Nombre_Materia    VARCHAR2(10),
    Grupo             VARCHAR2(10),
    CONSTRAINT PK6 PRIMARY KEY (Profesor_ID)
)
;



-- 
-- TABLE: Profesor_Grado 
--

CREATE TABLE Profesor_Grado(
    Profesor_ID      NUMBER(10, 0)    NOT NULL,
    "Grado ó Grupo"  VARCHAR2(10),
    CONSTRAINT PK5 PRIMARY KEY (Profesor_ID)
)
;



-- 
-- TABLE: Inscripcion 
--

ALTER TABLE Inscripcion ADD CONSTRAINT RefMateria2 
    FOREIGN KEY (Materia_ID)
    REFERENCES Materia(Materia_ID)
;

ALTER TABLE Inscripcion ADD CONSTRAINT RefProfesor4 
    FOREIGN KEY (Profesor_ID)
    REFERENCES Profesor(Profesor_ID)
;

ALTER TABLE Inscripcion ADD CONSTRAINT RefEstudiante1 
    FOREIGN KEY (Estudiante_ID)
    REFERENCES Estudiante(Estudiante_ID)
;


-- 
-- TABLE: Profesor_Especialista 
--

ALTER TABLE Profesor_Especialista ADD CONSTRAINT RefProfesor6 
    FOREIGN KEY (Profesor_ID)
    REFERENCES Profesor(Profesor_ID)
;


-- 
-- TABLE: Profesor_Grado 
--

ALTER TABLE Profesor_Grado ADD CONSTRAINT RefProfesor5 
    FOREIGN KEY (Profesor_ID)
    REFERENCES Profesor(Profesor_ID)
;


