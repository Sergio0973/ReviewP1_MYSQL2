DROP DATABASE IF EXISTS clinica_universitaria;
CREATE DATABASE clinica_universitaria;
USE clinica_universitaria;

/* PACIENTES */
CREATE TABLE pacientes (
    Paciente_ID VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20)
);

INSERT INTO pacientes (Paciente_ID, Nombre, Telefono) VALUES
('P-501', 'Juan Rivas', '600-111'),
('P-502', 'Ana Soto', '600-222'),
('P-503', 'Luis Paz', '600-333');

/* PROCEDIMIENTO ALMACENADO CRUD CON MANEJO DE ERRORES */

/* CREATE */
DROP PROCEDURE  sp_pacientes_create;
DELIMITER $$
CREATE PROCEDURE sp_pacientes_create(
    IN p_id VARCHAR(10),
    IN p_nombre VARCHAR(50),
    IN p_telefono VARCHAR(20)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('pacientes',1,'Error al insertar paciente');
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO pacientes VALUES(p_id,p_nombre,p_telefono);
    COMMIT;
END$$
DELIMITER ;

/* READ */

DROP PROCEDURE sp_pacientes_read;
DELIMITER $$
CREATE PROCEDURE sp_pacientes_read(IN p_id VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('pacientes',2,'Error al consultar paciente');
    END;

    SELECT * FROM pacientes WHERE Paciente_ID=p_id;
END$$
DELIMITER ;

/* UPDATE */

DELIMITER $$
CREATE PROCEDURE sp_pacientes_update(
    IN p_id VARCHAR(10),
    IN p_nombre VARCHAR(50),
    IN p_telefono VARCHAR(20)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('pacientes',3,'Error al actualizar paciente');
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE pacientes
       SET Nombre=p_nombre,
           Telefono=p_telefono
     WHERE Paciente_ID=p_id;
    COMMIT;
END$$
DELIMITER ;

/* DELETE */

DROP PROCEDURE sp_pacientes_delete;
DELIMITER $$
CREATE PROCEDURE sp_pacientes_delete(IN p_id VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('pacientes',4,'Error al eliminar paciente');
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM pacientes WHERE Paciente_ID=p_id;
    COMMIT;
END$$
DELIMITER ;


/* FACULTADES */

CREATE TABLE facultades (
    Facultad_ID VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Decano VARCHAR(50)
);

INSERT INTO facultades (Facultad_ID, Nombre, Decano) VALUES
('F01', 'Medicina', 'Dr. Wilson'),
('F02', 'Ciencias', 'Dr. Palmer');

/* PROCEDIMIENTO ALMACENADO CRUD CON MANEJO DE ERRORES */

/* CREATE */

DROP PROCEDURE  sp_facultades_create;
DELIMITER $$
CREATE PROCEDURE sp_facultades_create(
    IN p_id VARCHAR(10),
    IN p_nombre VARCHAR(50),
    IN p_decano VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('facultades',13,'Error al insertar facultad');
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO facultades VALUES(p_id,p_nombre,p_decano);
    COMMIT;
END$$
DELIMITER ;

/* READ */

DROP PROCEDURE sp_facultades_read;
DELIMITER $$
CREATE PROCEDURE sp_facultades_read(IN p_id VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('facultades',14,'Error al consultar facultad');
    END;

    SELECT * FROM facultades WHERE Facultad_ID=p_id;
END$$
DELIMITER ;

/* UPDATE */

DROP PROCEDURE sp_facultades_update;
DELIMITER $$
CREATE PROCEDURE sp_facultades_update(
    IN p_id VARCHAR(10),
    IN p_nombre VARCHAR(50),
    IN p_decano VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('facultades',15,'Error al actualizar facultad');
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE facultades
       SET Nombre=p_nombre,
           Decano=p_decano
     WHERE Facultad_ID=p_id;
    COMMIT;
END$$
DELIMITER ;


/* DELETE */

DROP PROCEDURE IF EXISTS sp_facultades_delete;
DELIMITER $$
CREATE PROCEDURE sp_facultades_delete(IN p_id VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('facultades',16,'Error al eliminar facultad');
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM facultades WHERE Facultad_ID=p_id;
    COMMIT;
END$$
DELIMITER ;

/* MEDICOS */

CREATE TABLE medicos (
    Medico_ID VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Especialidad VARCHAR(50)
);

INSERT INTO medicos (Medico_ID, Nombre, Especialidad) VALUES
('M-10', 'Dr. House', 'Infectología'),
('M-22', 'Dra. Grey', 'Cardiología'),
('M-30', 'Dr. Strange', 'Neurocirugía');

/* PROCEDIMIENTO ALMACENADO CRUD CON MANEJO DE ERRORES */

/* CREATE */

DROP PROCEDURE sp_medicos_create;
DELIMITER $$
CREATE PROCEDURE sp_medicos_create(
    IN p_id VARCHAR(10),
    IN p_nombre VARCHAR(50),
    IN p_especialidad VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('medicos',5,'Error al insertar medico');
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO medicos VALUES(p_id,p_nombre,p_especialidad);
    COMMIT;
END$$
DELIMITER ;

/* READ */

DROP PROCEDURE  sp_medicos_read;
DELIMITER $$
CREATE PROCEDURE sp_medicos_read(IN p_id VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('medicos',6,'Error al consultar medico');
    END;

    SELECT * FROM medicos WHERE Medico_ID=p_id;
END$$
DELIMITER ;

/* UPDATE */

DROP PROCEDURE  sp_medicos_update;
DELIMITER $$
CREATE PROCEDURE sp_medicos_update(
    IN p_id VARCHAR(10),
    IN p_nombre VARCHAR(50),
    IN p_especialidad VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('medicos',7,'Error al actualizar medico');
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE medicos
       SET Nombre=p_nombre,
           Especialidad=p_especialidad
     WHERE Medico_ID=p_id;
    COMMIT;
END$$
DELIMITER ;

/* DELETE */

DROP PROCEDURE  sp_medicos_delete;
DELIMITER $$
CREATE PROCEDURE sp_medicos_delete(IN p_id VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('medicos',8,'Error al eliminar medico');
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM medicos WHERE Medico_ID=p_id;
    COMMIT;
END$$
DELIMITER ;


/* SEDES */

CREATE TABLE sedes (
    Sede_ID VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100)
);

INSERT INTO sedes (Sede_ID, Nombre, Direccion) VALUES
('S01', 'Centro Médico', 'Calle 5 #10'),
('S02', 'Clínica Norte', 'Av. Libertador');

/* PROCEDIMIENTO ALMACENADO CRUD CON MANEJO DE ERRORES */

/* CREATE */
DROP PROCEDURE sp_sedes_create;
DELIMITER $$
CREATE PROCEDURE sp_sedes_create(
    IN p_id VARCHAR(10),
    IN p_nombre VARCHAR(50),
    IN p_direccion VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('sedes',9,'Error al insertar sede');
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO sedes VALUES(p_id,p_nombre,p_direccion);
    COMMIT;
END$$
DELIMITER ;

/* READ */

DROP PROCEDURE sp_sedes_read;
DELIMITER $$
CREATE PROCEDURE sp_sedes_read(IN p_id VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('sedes',10,'Error al consultar sede');
    END;

    SELECT * FROM sedes WHERE Sede_ID=p_id;
END$$
DELIMITER ;

/* UPDATE */

DROP PROCEDURE  sp_sedes_update;
DELIMITER $$
CREATE PROCEDURE sp_sedes_update(
    IN p_id VARCHAR(10),
    IN p_nombre VARCHAR(50),
    IN p_direccion VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('sedes',11,'Error al actualizar sede');
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE sedes
       SET Nombre=p_nombre,
           Direccion=p_direccion
     WHERE Sede_ID=p_id;
    COMMIT;
END$$
DELIMITER ;

/* DELETE */

DROP PROCEDURE sp_sedes_delete;
DELIMITER $$
CREATE PROCEDURE sp_sedes_delete(IN p_id VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('sedes',12,'Error al eliminar sede');
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM sedes WHERE Sede_ID=p_id;
    COMMIT;
END$$
DELIMITER ;

/* CITAS */

CREATE TABLE citas (
    Cod_Cita VARCHAR(10) PRIMARY KEY,
    Fecha DATE NOT NULL,
    Diagnostico VARCHAR(100),

    Paciente_ID VARCHAR(10),
    Medico_ID VARCHAR(10),
    Sede_ID VARCHAR(10),

    CONSTRAINT fk_cita_paciente
        FOREIGN KEY (Paciente_ID)
        REFERENCES pacientes(Paciente_ID),

    CONSTRAINT fk_cita_medico
        FOREIGN KEY (Medico_ID)
        REFERENCES medicos(Medico_ID),

    CONSTRAINT fk_cita_sede
        FOREIGN KEY (Sede_ID)
        REFERENCES sedes(Sede_ID)
);

INSERT INTO citas (Cod_Cita, Fecha, Diagnostico, Paciente_ID, Medico_ID, Sede_ID) VALUES
('C-001', '2024-05-10', 'Gripe Fuerte', 'P-501', 'M-10', 'S01'),
('C-002', '2024-05-11', 'Infección', 'P-502', 'M-10', 'S01'),
('C-003', '2024-05-12', 'Arritmia', 'P-501', 'M-22', 'S02'),
('C-004', '2024-05-15', 'Migraña', 'P-503', 'M-30', 'S02');

/* PROCEDIMIENTO ALMACENADO CRUD CON MANEJO DE ERRORES */

/* CREATE */

DROP PROCEDURE sp_citas_create;
DELIMITER $$
CREATE PROCEDURE sp_citas_create(
    IN p_cod VARCHAR(10),
    IN p_fecha DATE,
    IN p_diag VARCHAR(100),
    IN p_paciente VARCHAR(10),
    IN p_medico VARCHAR(10),
    IN p_sede VARCHAR(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('citas',17,'Error al insertar cita');
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO citas VALUES(p_cod,p_fecha,p_diag,p_paciente,p_medico,p_sede);
    COMMIT;
END$$
DELIMITER ;

/* READ */

DROP PROCEDURE sp_citas_read;
DELIMITER $$
CREATE PROCEDURE sp_citas_read(IN p_cod VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('citas',18,'Error al consultar cita');
    END;

    SELECT * FROM citas WHERE Cod_Cita=p_cod;
END$$
DELIMITER ;

/* UPDATE */

DROP PROCEDURE sp_citas_update;
DELIMITER $$
CREATE PROCEDURE sp_citas_update(
    IN p_cod VARCHAR(10),
    IN p_fecha DATE,
    IN p_diag VARCHAR(100),
    IN p_paciente VARCHAR(10),
    IN p_medico VARCHAR(10),
    IN p_sede VARCHAR(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('citas',19,'Error al actualizar cita');
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE citas
       SET Fecha=p_fecha,
           Diagnostico=p_diag,
           Paciente_ID=p_paciente,
           Medico_ID=p_medico,
           Sede_ID=p_sede
     WHERE Cod_Cita=p_cod;
    COMMIT;
END$$
DELIMITER ;

/* DELETE */

DROP PROCEDURE sp_citas_delete;
DELIMITER $$
CREATE PROCEDURE sp_citas_delete(IN p_cod VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('citas',20,'Error al eliminar cita');
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM citas WHERE Cod_Cita=p_cod;
    COMMIT;
END$$
DELIMITER ;

/* MEDICAMENTOS */

CREATE TABLE medicamentos (
    Cod_Cita VARCHAR(10),
    Medicamento VARCHAR(50),
    Dosis VARCHAR(20),

    PRIMARY KEY (Cod_Cita, Medicamento),

    CONSTRAINT fk_medicamento_cita
        FOREIGN KEY (Cod_Cita)
        REFERENCES citas(Cod_Cita)
        ON DELETE CASCADE
);

INSERT INTO medicamentos (Cod_Cita, Medicamento, Dosis) VALUES
('C-001', 'Paracetamol', '500mg'),
('C-001', 'Ibuprofeno', '400mg'),
('C-002', 'Amoxicilina', '875mg'),
('C-003', 'Aspirina', '100mg'),
('C-004', 'Ergotamina', '1mg');

/* PROCEDIMIENTO ALMACENADO CRUD CON MANEJO DE ERRORES */

/* CREATE */

DROP PROCEDURE sp_medicamentos_create;
DELIMITER $$
CREATE PROCEDURE sp_medicamentos_create(
    IN p_cod VARCHAR(10),
    IN p_medicamento VARCHAR(50),
    IN p_dosis VARCHAR(20)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('medicamentos',21,'Error al insertar medicamento');
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO medicamentos VALUES(p_cod,p_medicamento,p_dosis);
    COMMIT;
END$$
DELIMITER ;

/* READ */

DROP PROCEDURE sp_medicamentos_read;
DELIMITER $$
CREATE PROCEDURE sp_medicamentos_read(IN p_cod VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('medicamentos',22,'Error al consultar medicamento');
    END;

    SELECT * FROM medicamentos WHERE Cod_Cita=p_cod;
END$$
DELIMITER ;

/* UPDATE */
DROP PROCEDURE sp_medicamentos_update;
DELIMITER $$
CREATE PROCEDURE sp_medicamentos_update(
    IN p_cod VARCHAR(10),
    IN p_medicamento VARCHAR(50),
    IN p_dosis VARCHAR(20)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('medicamentos',23,'Error al actualizar medicamento');
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE medicamentos
       SET Dosis=p_dosis
     WHERE Cod_Cita=p_cod
       AND Medicamento=p_medicamento;
    COMMIT;
END$$
DELIMITER ;

/* DELETE */

DROP PROCEDURE sp_medicamentos_delete;
DELIMITER $$
CREATE PROCEDURE sp_medicamentos_delete(
    IN p_cod VARCHAR(10),
    IN p_medicamento VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('medicamentos',24,'Error al eliminar medicamento');
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM medicamentos
     WHERE Cod_Cita=p_cod
       AND Medicamento=p_medicamento;
    COMMIT;
END$$
DELIMITER ;

/* FACULTAD_MEDICOS */

CREATE TABLE facultad_medicos (
    Medico_ID VARCHAR(10),
    Facultad_ID VARCHAR(10),

    PRIMARY KEY (Medico_ID, Facultad_ID),

    CONSTRAINT fk_fm_medico
        FOREIGN KEY (Medico_ID)
        REFERENCES medicos(Medico_ID),

    CONSTRAINT fk_fm_facultad
        FOREIGN KEY (Facultad_ID)
        REFERENCES facultades(Facultad_ID)
);

INSERT INTO facultad_medicos (Medico_ID, Facultad_ID) VALUES
('M-10', 'F01'),
('M-22', 'F01'),
('M-30', 'F02');

/* PROCEDIMIENTO ALMACENADO CRUD CON MANEJO DE ERRORES */

/* CREATE */
DROP PROCEDURE sp_facultad_medicos_create;
DELIMITER $$
CREATE PROCEDURE sp_facultad_medicos_create(
    IN p_medico VARCHAR(10),
    IN p_facultad VARCHAR(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('facultad_medicos',25,'Error al insertar relacion');
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO facultad_medicos VALUES(p_medico,p_facultad);
    COMMIT;
END$$
DELIMITER ;

/* READ */

DROP PROCEDURE IF EXISTS sp_facultad_medicos_read;
DELIMITER $$
CREATE PROCEDURE sp_facultad_medicos_read(IN p_medico VARCHAR(10))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('facultad_medicos',26,'Error al consultar relacion');
    END;

    SELECT * FROM facultad_medicos WHERE Medico_ID=p_medico;
END$$
DELIMITER ;

/* UPDATE */

DROP PROCEDURE sp_facultad_medicos_update;
DELIMITER $$
CREATE PROCEDURE sp_facultad_medicos_update(
    IN p_medico_old VARCHAR(10),
    IN p_facultad_old VARCHAR(10),
    IN p_medico_new VARCHAR(10),
    IN p_facultad_new VARCHAR(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('facultad_medicos',27,'Error al actualizar relacion');
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE facultad_medicos
       SET Medico_ID=p_medico_new,
           Facultad_ID=p_facultad_new
     WHERE Medico_ID=p_medico_old
       AND Facultad_ID=p_facultad_old;
    COMMIT;
END$$
DELIMITER ;


/* DELETE */

DROP PROCEDURE sp_facultad_medicos_delete;
DELIMITER $$
CREATE PROCEDURE sp_facultad_medicos_delete(
    IN p_medico VARCHAR(10),
    IN p_facultad VARCHAR(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO errores(nombre_tabla,codigo_error,mensaje)
        VALUES('facultad_medicos',28,'Error al eliminar relacion');
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM facultad_medicos
     WHERE Medico_ID=p_medico
       AND Facultad_ID=p_facultad;
    COMMIT;
END$$
DELIMITER ;


/* ERRORES */

CREATE TABLE errores (
    id_error INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tabla VARCHAR(50),
    codigo_error INT,
    mensaje VARCHAR(200),
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);

/* FUNCIONES A RETORNAR */

/* Número de doctores por especialidad */

DROP PROCEDURE sp_doctores_por_especialidad;
DELIMITER $$

CREATE PROCEDURE sp_doctores_por_especialidad(
    IN p_especialidad VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        CALL sp_registrar_error(
            'medicos',
            201,
            'Error al calcular doctores por especialidad'
        );
    END;

    SELECT COUNT(*) AS Total_Doctor
    FROM medicos
    WHERE Especialidad = p_especialidad;
END$$

DELIMITER ;

CALL sp_doctores_por_especialidad('Cardiología');


/* Total pacientes atendidos por un médico */

DROP PROCEDURE sp_total_pacientes_por_medico;
DELIMITER $$

CREATE PROCEDURE sp_total_pacientes_por_medico(
    IN p_medico VARCHAR(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        CALL sp_registrar_error(
            'citas',
            202,
            'Error al calcular total pacientes por medico'
        );
    END;

    SELECT COUNT(DISTINCT Paciente_ID) AS Total_Pacientes
    FROM citas
    WHERE Medico_ID = p_medico;
END$$

DELIMITER ;

CALL sp_total_pacientes_por_medico('M-10');


/* Cantidad de pacientes atendidos dada una sede */

DROP PROCEDURE sp_total_pacientes_por_sede;
DELIMITER $$

CREATE PROCEDURE sp_total_pacientes_por_sede(
    IN p_sede VARCHAR(10)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        CALL sp_registrar_error(
            'citas',
            203,
            'Error al calcular total pacientes por sede'
        );
    END;

    SELECT COUNT(DISTINCT Paciente_ID) AS Total_Pacientes
    FROM citas
    WHERE Sede_ID = p_sede;
END$$

DELIMITER ;


CALL sp_total_pacientes_por_sede('S01');

/* Procedimiento general de registro de errores */

DROP PROCEDURE sp_registrar_error;
DELIMITER $$

CREATE PROCEDURE sp_registrar_error(
    IN p_nombre_tabla VARCHAR(50),
    IN p_codigo_error INT,
    IN p_mensaje VARCHAR(200)
)
BEGIN
    INSERT INTO errores(nombre_tabla, codigo_error, mensaje, fecha_hora)
    VALUES(p_nombre_tabla, p_codigo_error, p_mensaje, NOW());
END$$

DELIMITER ;

CALL sp_registrar_error('pacientes', 999, 'Prueba Error');


