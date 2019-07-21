--Archivo con scripts de consultas

--Consulta que te trae la clave del estudiante, la clave del profesor y la clave de la materia
--Se le tiene que pasar de parametro el grado y el ID del estudiante
CREATE OR REPLACE VIEW consulta1 
    SELECT e.estudiante_ID, p.profesor_ID, m.materia_ID
    FROM estudiante e
    JOIN profesor_grado p ON e.grado=p.grado
    JOIN materia m ON m.grado=p.grado
    WHERE e.grado='6to' and e.estudiante_ID=16;


---Consulta 2
CREATE OR REPLACE VIEW consulta2
    SELECT e.grado, e.estudiante_ID,p.profesor_ID
    FROM estudiante e
    JOIN profesor_grado p ON e.grado=p.grado 
    WHERE e.grado='6to'


--Consulta 3
CREATE OR REPLACE VIEW consulta3
    SELECT m.materia_ID, e.estudiante_ID
    FROM materia m
    JOIN estudiante e ON e.grado=m.grado
    where e.grado='6to'

--Consulta 4
--Trae los datos de la materia inscrita indicandole las 3 claves 
--ID del alumno, ID del profesor, ID de la materia
CREATE OR REPLACE VIEW consulta4
    SELECT calificacion_B1, campo1_B1, campo2_B1, campo3_B1, campo4_B1,calificacion_B2, campo1_B2, campo2_B2, campo3_B2, campo4_B2,calificacion_B3, campo1_B3, campo2_B3, campo3_B3, campo4_B3,calificacion_B4, campo1_B4, campo2_B4, campo3_B4, campo4_B4,calificacion_B5, campo1_B5, campo2_B5, campo3_B5, campo4_B5 FROM inscripcion_grado WHERE estudiante_ID =26  and materia_ID=5 and profesor_ID=61

--Consulta la cual trae el nombre y calificaciones de los alumnos
CREATE OR REPLACE VIEW consulta5
    SELECT  m.nombre, ig.calificacion_B1, ig.calificacion_B2, ig.calificacion_B3, ig.calificacion_B4, ig.calificacion_B4
    FROM inscripcion_grado ig
    JOIN materia m ON m.materia_ID=ig.materia_ID
    where ig.estudiante_ID=16 and ig.profesor_ID=5 AND m.grado='6to';

