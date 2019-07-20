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