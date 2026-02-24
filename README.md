INSERT INTO profesores (nombre, apellido, email, departamento) VALUES
('Carlos','Ramirez','carlos@uni.edu','Ingenieria'),
('Ana','Torres','ana@uni.edu','Matematicas'),
('Luis','Gomez','luis@uni.edu','Informatica'),
('Marta','Lopez','marta@uni.edu','Derecho'),
('Jorge','Fernandez','jorge@uni.edu','Medicina'),
('Elena','Martinez','elena@uni.edu','Arquitectura'),
('Pedro','Sanchez','pedro@uni.edu','Fisica'),
('Laura','Diaz','laura@uni.edu','Quimica'),
('Miguel','Castro','miguel@uni.edu','Historia'),
('Sofia','Herrera','sofia@uni.edu','Economia');


-- =========================================
-- INSERTAR ALUMNOS (10)
-- =========================================
INSERT INTO alumnos (nombre, apellido, email, fecha_nacimiento, fecha_inscripcion) VALUES
('Juan','Perez','juan@gmail.com','2000-05-10','2023-09-01'),
('Maria','Gomez','maria@gmail.com','1999-08-15','2023-09-01'),
('Daniel','Ruiz','daniel@gmail.com','2001-02-20','2023-09-01'),
('Lucia','Fernandez','lucia@gmail.com','2000-11-30','2023-09-01'),
('Pedro','Morales','pedro@gmail.com','1998-07-12','2023-09-01'),
('Camila','Soto','camila@gmail.com','2001-03-25','2023-09-01'),
('Andres','Vega','andres@gmail.com','2000-09-18','2023-09-01'),
('Valeria','Navarro','valeria@gmail.com','1999-12-01','2023-09-01'),
('Diego','Rojas','diego@gmail.com','2001-06-14','2023-09-01'),
('Paula','Mendez','paula@gmail.com','2000-04-22','2023-09-01');


-- =========================================
-- INSERTAR ASIGNATURAS (10)
-- =========================================
INSERT INTO asignaturas (nombre, creditos, id_profesor) VALUES
('Base de Datos',6,3),
('Calculo I',5,2),
('Programacion',6,3),
('Derecho Civil',4,4),
('Anatomia',5,5),
('Diseño Arquitectonico',6,6),
('Fisica General',5,7),
('Quimica Organica',5,8),
('Historia Universal',4,9),
('Microeconomia',5,10);


-- =========================================
-- INSERTAR MATRICULAS (10)
-- =========================================
INSERT INTO matriculas (id_alumno, id_asignatura, fecha_matricula) VALUES
(1,1,'2023-09-05'),
(2,2,'2023-09-05'),
(3,3,'2023-09-05'),
(4,4,'2023-09-05'),
(5,5,'2023-09-05'),
(6,6,'2023-09-05'),
(7,7,'2023-09-05'),
(8,8,'2023-09-05'),
(9,9,'2023-09-05'),
(10,10,'2023-09-05');


-- =========================================
-- INSERTAR EVALUACIONES (10)
-- =========================================
INSERT INTO evaluaciones (id_matricula, nota, fecha_evaluacion) VALUES
(1,8.5,'2023-12-10'),
(2,7.2,'2023-12-11'),
(3,9.0,'2023-12-12'),
(4,6.8,'2023-12-13'),
(5,8.0,'2023-12-14'),
(6,7.5,'2023-12-15'),
(7,9.2,'2023-12-16'),
(8,6.9,'2023-12-17'),
(9,8.7,'2023-12-18'),
(10,7.8,'2023-12-19');
