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