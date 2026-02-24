CREATE TABLE profesores (
    id_profesor SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    departamento VARCHAR(100) NOT NULL
);

CREATE TABLE alumnos (
    id_alumno SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_nacimiento DATE,
    fecha_inscripcion DATE NOT NULL
);

CREATE TABLE asignaturas (
    id_asignatura SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos INT NOT NULL,
    id_profesor INT REFERENCES profesores(id_profesor)
);

CREATE TABLE matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_alumno INT REFERENCES alumnos(id_alumno),
    id_asignatura INT REFERENCES asignaturas(id_asignatura),
    fecha_matricula DATE NOT NULL
);

CREATE TABLE evaluaciones (
    id_evaluacion SERIAL PRIMARY KEY,
    id_matricula INT REFERENCES matriculas(id_matricula),
    nota DECIMAL(4,2) CHECK (nota >= 0 AND nota <= 10),
    fecha_evaluacion DATE NOT NULL
);
