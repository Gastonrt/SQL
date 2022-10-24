DROP database IF EXISTS tutoriasgrt;
CREATE DATABASE IF NOT EXISTS tutoriasgrt;
-- DB Privada de Alumnos/as que pasaron por
-- mis tutorías en Coderhouse durante los
-- años 2021 y 2022 datos inventados

USE TutoriasGRT ;

-- Table: ALUMNOS
CREATE TABLE if not exists alumnos (
	-- primero cargo datos y luego paso al FK: idCurso INT NOT NULL,
    -- primero cargo datos id_alumnos y luego paso al FK: idProfes int not null,
    id_alumno int NOT NULL auto_increment,
    nombre_alumno text (20) NOT NULL,
    apellido_alumno text (20) NOT NULL,
    direccion varchar (20) NULL,
    ciudad varchar (20) NULL,
    email varchar (30) NOT NULL,
    curso text (50) NULL,
    edad int,
    CONSTRAINT PK_ALUMNOS PRIMARY KEY (id_alumno)
);

-- Table: TIPO_ALUMNO (CoderBeca o Pro)
CREATE TABLE if not exists tipo_alumno (
    id_tipo_alumno int,
    descripcion varchar(20) NOT NULL,
    id_alumno int NOT NULL,
    CONSTRAINT PK_ALUMNO PRIMARY KEY (id_tipo_alumno)
);

-- Table: CURSO (Marketing Digital, Wordpress, E-Commerce)
CREATE TABLE if not exists curso (
	id_curso int NOT NULL,
    nombre_del_curso varchar (20) NOT NULL,
    comision varchar (5) NOT NULL,
    institucion text (10) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    id_alumno int NOT NULL,
    CONSTRAINT PK_CURSO PRIMARY KEY (id_curso)
    );
    
  -- Table: RUBRO (Emprendimiento o Proyecto: Inmobiliaria, etc.)
CREATE TABLE if not exists rubro (
	id_rubro int NOT NULL,
    nombre_rubro varchar (20) NOT NULL,
    institucion text (10) NOT NULL,
    comision varchar (5) NOT NULL,
    CONSTRAINT PK_RUBRO PRIMARY KEY (id_rubro)
    );  

-- Table: PROFES (Distintos Profes con los que cursé)
-- PROFES para relacionar con Alumnos según comisión asignada por Coderhouse
CREATE TABLE if not exists profes (
	id_profes int NOT NULL,
    nombre_profe text (20) NOT NULL,
    apellido_profe text (20) NOT NULL,
    email varchar (30) NOT NULL,
    nombre_del_curso varchar (20) NOT NULL,
    comision varchar (5) NOT NULL,
    id_alumno int NOT NULL,
    CONSTRAINT PK_PROFES PRIMARY KEY (id_profes)
    );
    
    -- foreign keys
-- Reference: FK_CURSO (table: alumnos)
-- -- primero cargo datos y luego paso al FK: ALTER TABLE ALUMNOS ADD CONSTRAINT FK_CURSO FOREIGN KEY FK_CURSO (idCurso) 
-- primero cargo datos y luego paso al FK:    REFERENCES CURSO (id_CURSO);

-- Reference: FK_PROFES (table: alumnos)
-- primero cargo datos y luego paso al FK: ALTER TABLE ALUMNOS ADD CONSTRAINT FK_PROFES FOREIGN KEY FK_PROFES (idProfes)
-- primero cargo datos y luego paso al FK:    REFERENCES PROFES (id_profes);

