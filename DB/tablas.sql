CREATE TABLE estudiante(
  estudiante_id integer NOT NULL,
  curp character varying(200),
  nombre character varying(100) NOT NULL,
  apellido_pat character varying(100) NOT NULL,
  apellido_mat character varying(100),
  grado character varying(5) NOT NULL,
  edad integer NOT NULL,
  nombre_tutor character varying(50),
  telefono_casa character varying(50),
  telefono_celular character varying(50),
  correo_electronico character varying(50),
  passwords character varying(255),
  dia_registro character varying(255),
  estado character(2),
  CONSTRAINT estudiante_pkey PRIMARY KEY (estudiante_id),
  CONSTRAINT estado_ck CHECK (estado = ANY (ARRAY['A'::bpchar, 'S'::bpchar, 'B'::bpchar]))
)
;
CREATE TABLE materia(
  materia_id integer NOT NULL,
  nombre character varying(90) NOT NULL,
  estado character(2),
  grado character varying(5),
  CONSTRAINT materia_pkey PRIMARY KEY (materia_id),
  CONSTRAINT estado_ck CHECK (estado = ANY (ARRAY['A'::bpchar, 'S'::bpchar, 'B'::bpchar]))
)
;

CREATE TABLE tarea(
  tarea_id SERIAL,
  nombre_tarea character varying(90) NOT NULL,
  grado character varying(5),
  descripcion_encabezado character varying(90) NULL,
  descripcion_cuerpo character varying(90),
  link character varying(90),
  CONSTRAINT tarea_id_pkey PRIMARY KEY (tarea_id)
)
;

CREATE TABLE profesor_grado(
  profesor_id integer NOT NULL,
  curp character varying(100),
  nombre character varying(30) NOT NULL,
  apellido_pat character varying(30) NOT NULL,
  apellido_mat character varying(30),
  edad integer NOT NULL,
  telefono character varying(30),
  correo_electronico character varying(50),
  passwords character varying(255),
  estado character(2),
  grado character varying(40) NOT NULL,
  CONSTRAINT profesor_grado_pkey PRIMARY KEY (profesor_id),
  CONSTRAINT estado_ck CHECK (estado = ANY (ARRAY['A'::bpchar, 'S'::bpchar, 'B'::bpchar])
  )
;

CREATE TABLE pago_profesor_grado(
  pago_profesor_grado_id SERIAL PRIMARY KEY,
  profesor_id INTEGER NOT NULL,
  monto DECIMAL(8,8) DEFAULT 0,
  maximo DECIMAL(8,8) DEFAULT 0,
  fecha character varying(50),
  mes character varying(50),
  quincena character varying(100),
  status character(2)CHECK (status='P' OR status='SP' OR status='A'),
	CONSTRAINT profesor_id_fkey FOREIGN KEY(profesor_id)
	REFERENCES profesor_grado(profesor_id)
);
CREATE TABLE pago_profesor_especialista(
  pago_profesor_especiasialista_id SERIAL PRIMARY KEY,
  profesor_id INTEGER NOT NULL,
  monto NUMERIC(8,2) DEFAULT 0,
  maximo NUMERIC(8,2) DEFAULT 0,
  fecha character varying(50),
  mes character varying(50),
  quincena character varying(100),
  status character(2)CHECK (status='P' OR status='SP' OR status='A'),
	  CONSTRAINT profesor_id_fkey FOREIGN KEY(profesor_id)
	REFERENCES profesor_especialista(profesor_id)
);

CREATE TABLE colegiaturas(
  colegiatura_id serial PRIMARY KEY,
  estudiante_id INTEGER NOT NULL,
  monto DECIMAL(8,8) DEFAULT 0,
  maximo DECIMAL(8,8) DEFAULT 0,
  fecha character varying(50),
  mes character varying(50),
  status character(2)CHECK (status='P' OR status='SP' OR status='A'),
	CONSTRAINT estudiante_id_fkey FOREIGN KEY(estudiante_id)
	REFERENCES estudiante(estudiante_id)
);

CREATE TABLE profesor_especialista(
  profesor_id integer NOT NULL,
  curp character varying(100),
  nombre character varying(30) NOT NULL,
  apellido_pat character varying(30) NOT NULL,
  apellido_mat character varying(30),
  edad integer NOT NULL,
  telefono character varying(30),
  correo_electronico character varying(50),
  passwords character varying(50),
  estado character(2),
  grado character varying(40) NOT NULL,
  nombre_materia character varying(30),
  CONSTRAINT profesor_especialista_pkey PRIMARY KEY (profesor_id),
  CONSTRAINT estado_ck CHECK (estado = ANY (ARRAY['A'::bpchar, 'S'::bpchar, 'B'::bpchar])
  )
;


CREATE TABLE inscripcion_grado(
  estudiante_id integer NOT NULL,
  materia_id integer NOT NULL,
  profesor_id integer NOT NULL,
  calificacion_b1 decimal(4,2) DEFAULT 0,
  campo1_b1 decimal(4,2) DEFAULT 0,
  campo2_b1 decimal(4,2) DEFAULT 0,
  campo3_b1 decimal(4,2) DEFAULT 0,
  campo4_b1 decimal(4,2) DEFAULT 0,
  campo5_b1 decimal(4,2) DEFAULT 0,
  calificacion_b2 decimal(4,2) DEFAULT 0,
  campo1_b2 decimal(4,2) DEFAULT 0,
  campo2_b2 decimal(4,2) DEFAULT 0,
  campo3_b2 decimal(4,2) DEFAULT 0,
  campo4_b2 decimal(4,2) DEFAULT 0,
  campo5_b2 decimal(4,2) DEFAULT 0,
  calificacion_b3 decimal(4,2) DEFAULT 0,
  campo1_b3 decimal(4,2) DEFAULT 0,
  campo2_b3 decimal(4,2) DEFAULT 0,
  campo3_b3 decimal(4,2) DEFAULT 0,
  campo4_b3 decimal(4,2) DEFAULT 0,
  campo5_b3 decimal(4,2) DEFAULT 0,
  calificacion_b4 decimal(4,2) DEFAULT 0,
  campo1_b4 decimal(4,2) DEFAULT 0,
  campo2_b4 decimal(4,2) DEFAULT 0,
  campo3_b4 decimal(4,2) DEFAULT 0,
  campo4_b4 decimal(4,2) DEFAULT 0,
  campo5_b4 decimal(4,2) DEFAULT 0,
  promedio decimal(4,2) DEFAULT 0,
  CONSTRAINT inscripcion_grado_pkey PRIMARY KEY (estudiante_id, materia_id, profesor_id),
  CONSTRAINT inscripcion_grado_estudiante_id_fkey FOREIGN KEY (estudiante_id)
      REFERENCES public.estudiante (estudiante_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT inscripcion_grado_materia_id_fkey FOREIGN KEY (materia_id)
      REFERENCES public.materia (materia_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT inscripcion_grado_profesor_id_fkey FOREIGN KEY (profesor_id)
      REFERENCES public.profesor_grado (profesor_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
;

CREATE TABLE inscripcion_especialista(
  estudiante_id integer NOT NULL,
  materia_id integer NOT NULL,
  profesor_id integer NOT NULL,
    calificacion_B1 decimal(4,2) DEFAULT 0,
    campo1_B1 decimal(4,2) DEFAULT 0,
    campo2_B1 decimal(4,2) DEFAULT 0,
    campo3_B1 decimal(4,2) DEFAULT 0,
    campo4_B1 decimal(4,2) DEFAULT 0,
    campo5_B1 decimal(4,2) DEFAULT 0,
    calificacion_B2 decimal(4,2) DEFAULT 0,
    campo1_B2 decimal(4,2) DEFAULT 0,
    campo2_B2 decimal(4,2) DEFAULT 0,
    campo3_B2 decimal(4,2) DEFAULT 0,
    campo4_B2 decimal(4,2) DEFAULT 0,
    campo5_B2 decimal(4,2) DEFAULT 0,
    calificacion_B3 decimal(4,2) DEFAULT 0,
    campo1_B3 decimal(4,2) DEFAULT 0,
    campo2_B3 decimal(4,2) DEFAULT 0,
    campo3_B3 decimal(4,2) DEFAULT 0,
    campo4_B3 decimal(4,2) DEFAULT 0,
    campo5_B3 decimal(4,2) DEFAULT 0,
    calificacion_B4 decimal(4,2) DEFAULT 0,
    campo1_B4 decimal(4,2) DEFAULT 0,
    campo2_B4 decimal(4,2) DEFAULT 0,
    campo3_B4 decimal(4,2) DEFAULT 0,
    campo4_B4 decimal(4,2) DEFAULT 0,
    campo5_B4 decimal(4,2) DEFAULT 0,
    calificacion_B5 decimal(4,2) DEFAULT 0,
    promedio decimal(4,2) DEFAULT 0,
  CONSTRAINT inscripcion_especialista_pkey PRIMARY KEY (estudiante_id, materia_id, profesor_id),
  CONSTRAINT inscripcion_especialista_estudiante_id_fkey FOREIGN KEY (estudiante_id)
      REFERENCES public.estudiante (estudiante_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT inscripcion_especialista_materia_id_fkey FOREIGN KEY (materia_id)
      REFERENCES public.materia (materia_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT inscripcion_especialista_profesor_id_fkey FOREIGN KEY (profesor_id)
      REFERENCES public.profesor_especialista (profesor_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
;
CREATE TABLE ingreso_plataforma_estudiante(
	ingreso_plataforma_estudiante_id SERIAL PRIMARY KEY, 
	estudiante_id INTEGER NOT NULL,
	num_ing INTEGER NOT NULL,
	fecha_ingreso character varying(90),
	CONSTRAINT estudiante_id_fkey FOREIGN KEY(estudiante_id)
	REFERENCES estudiante(estudiante_id)
);

CREATE TABLE ingreso_plataforma_prof_g(
	ingreso_plataforma_prof_g_id SERIAL PRIMARY KEY, 
	profesor_id INTEGER NOT NULL,
	num_ing INTEGER NOT NULL,
	fecha_ingreso character varying(90),
	CONSTRAINT profesor_id_fkey FOREIGN KEY(profesor_id)
	REFERENCES profesor_grado(profesor_id)
);
CREATE TABLE promedio(
  promedio_id SERIAL PRIMARY KEY,
  estudiante_id INTEGER NOT NULL,
  grado character varying(5),
  promedio_b1 decimal(4,2) DEFAULT 0,
  promedio_b2 decimal(4,2) DEFAULT 0,
  promedio_b3 decimal(4,2) DEFAULT 0,
  promedio_b4 decimal(4,2) DEFAULT 0,
  promedio_toal decimal(4,2) DEFAULT 0,
  CONSTRAINT estudiante_id_fkey FOREIGN KEY(estudiante_id)
	REFERENCES estudiante(estudiante_id)
);
CREATE TABLE ingreso_plataforma_prof_especialista(
	ingreso_plataforma_prof_e_id SERIAL PRIMARY KEY, 
	profesor_id INTEGER NOT NULL,
	num_ing INTEGER NOT NULL,
	fecha_ingreso character varying(90),
	CONSTRAINT profesor_id_fkey FOREIGN KEY(profesor_id)
	REFERENCES profesor_especialista(profesor_id)
);