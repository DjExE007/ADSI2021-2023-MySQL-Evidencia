/*Triggers ADSi SENA 2021-2022 2282082*/
CREATE TABLE cop_cliente_insTrigger(
    idcliente INT(12)NOT NULL,
    CliIdentificacion_cliente VARCHAR(12) NOT NULL,
    Cliempresa VARCHAR(30)NOT NULL,
    Clirepresentante VARCHAR(50) NULL,
    Clitelcel VARCHAR(15) NULL,
    CliDireccion VARCHAR(30) NULL,
    CliCorreo VARCHAR(30) NULL,
    CliSitioWeb VARCHAR(70) NULL,
    CliSectordelmercado VARCHAR(15) NULL,
    CliVinculoServicios VARCHAR(15) NULL,
    Clitelocal VARCHAR(15)
 );

 /*Trigger cop_cliente_insTrigger*/
 CREATE TRIGGER cop_cliente_insTrigger_AI AFTER INSERT ON cliente FOR EACH ROW 
 INSERT INTO cop_cliente_insTrigger(
    idcliente, 
    CliIdentificacion_cliente,
    Cliempresa, 
    Clirepresentante, 
    Clitelcel, 
    CliDireccion, 
    CliCorreo, 
    CliSitioWeb, 
    CliSectordelmercado, 
    CliVinculoServicios, 
    Clitelocal
 )  
 VALUES(NEW.idcliente, NEW.CliIdentificacion_cliente, NEW.Cliempresa,
  NEW.Clirepresentante, NEW.Clitelcel, NEW.CliDireccion, NEW.CliCorreo,
  NEW.CliSitioWeb, NEW.CliSectordelmercado, NEW.CliVinculoServicios,
  NEW.Clitelocal
  );

/*comprobacion del trigger*/
SELECT * FROM cop_cliente_insTrigger;

INSERT INTO cliente 
(Cliempresa, Clirepresentante, Clitelcel, CliDireccion, CliCorreo, 
CliSitioWeb, CliSectordelmercado, CliVinculoServicios, CliIdentificacion_cliente)
VALUES
( "Nintendo", "Shigeru Miyamoto", "3203315469", "Av japan 345", 
"Nintendocorp@hotmail.com", "https://www.nintendo.com",
"tecnologia", "videojuegos", 9011860621);

SELECT * FROM cop_cliente_insTrigger;

/*Trigger de 2da tabla*/

CREATE TABLE cop_genalertas_instrg(
    GenFechaVencimiento DATE NULL,
    GenCalendarioReal DATE NULL,
    GenAvisoTipoOperacion VARCHAR(300)
);

CREATE TRIGGER cop_genalertas_instrg_AI AFTER INSERT ON gen_alertas FOR EACH ROW
INSERT INTO cop_genalertas_instrg ( 
GenFechaVencimiento,
GenCalendarioReal,
GenAvisoTipoOperacion
  ) VALUES(
     NEW.GenFechaVencimiento, NEW.GenCalendarioReal, NEW.GenAvisoTipoOperacion
    );

/*Trigger de 3ra tabla*/

CREATE TABLE cop_operadorsi_instrg(
    idOperadorSi INT NOT NULL,
    OpeContraseña VARCHAR(10) NOT NULL,
    Opecliente INT NULL,
    OpeIdentificacion INT NOT NULL
);

CREATE TRIGGER cop_operadorsi_insTrigger_AI AFTER INSERT ON operadorsi FOR EACH ROW 
 INSERT INTO cop_operadorsi_instrg(
    idOperadorSi,
    OpeContraseña,
    Opecliente,
    OpeIdentificacion
    )  VALUES(
     NEW.idOperadorSi,
     NEW.OpeContraseña,
     NEW.Opecliente,
     NEW.OpeIdentificacion
    );


/*triger con la actualizacion*/
/*El objetivo es llevar una bitacora*/ 
Se debe crear una tabla, se usa la notacion upd si se quiere para explicar que es UPDATE o actualizado
CREATE TABLE gen_alertas_upd (
    N_GenFechaVencimiento DATE,
    N_GenCalendarioReal DATE, 
    N_GenAvisoTipoOperacion VARCHAR(300) NOT NULL,
    O_GenFechaVencimiento DATE,
    O_GenCalendarioReal DATE,
    O_GenAvisoTipoOperacion VARCHAR(300) NOT NULL);

CREATE TRIGGER gen_alertas_BU BEFORE UPDATE ON gen_alertas FOR EACH ROW
   INSERT INTO gen_alertas_upd(
       N_GenFechaVencimiento,
       N_GenCalendarioReal,
       N_GenAvisoTipoOperacion,
       O_GenFechaVencimiento,
       O_GenCalendarioReal,
       O_GenAvisoTipoOperacion)
    VALUES(
        NEW.GenFechaVencimiento, 
        NEW.GenCalendarioReal, 
        NEW.GenAvisoTipoOperacion,
        OLD.GenFechaVencimiento,
        OLD.GenCalendarioReal,
        OLD.GenAvisoTipoOperacion
    );

SELECT * FROM gen_alertas;

UPDATE gen_alertas SET GenAvisoTipoOperacion = "Lavado Tanque" WHERE 
GenFechaVencimiento = "2023-05-01";

UPDATE nombretabla SET nombrecampo="dato" WHERE nombrecampo =dato;

SELECT * FROM gen_alertas;
SELECT * FROM gen_alertas_upd;

/*Trigger 4ta tabla*/

CREATE TABLE cop_prog_opsfechas_instrg(
    ProTipoOperacion VARCHAR(20) NOT NULL,
    ProIntroduccirNuevaOperacion VARCHAR(20) NULL,
    ProFechadeEjecucion DATE,
    ProClienteSolicitante VARCHAR(20),
    ProEditarOperacion VARCHAR(20),
    ProRecargadeExtintor VARCHAR(20)NOT NULL,
    ProPinturaExtintor VARCHAR(20),
    ProResuministroExtintor VARCHAR(20),
    ProMantenimientoExtintor VARCHAR(20),
    ProDesinfexion VARCHAR(20),
    ProFumigacion VARCHAR(20),
    ProPlandeSaneamiento VARCHAR(20),
    ProLavadodeTanques VARCHAR(20),
    ProCapacitacionSeguridad VARCHAR(20),
    ProManipulacionAlimentos VARCHAR(20),
    ProCarnetizacion VARCHAR(20),
    ProVentaInsumos VARCHAR(20),
    ProClientes INT
);

ALTER TABLE cop_prog_opsfechas_instrg MODIFY COLUMN ProClientes INT NOT NULL;
ALTER TABLE cop_prog_opsfechas_instrg MODIFY COLUMN ProRecargadeExtintor VARCHAR(30) NOT NULL;
ALTER TABLE cop_prog_opsfechas_instrg ADD FOREIGN KEY (ProClientes) REFERENCES cliente(idcliente);
SHOW TABLES;

DESCRIBE cop_prog_opsfechas_instrg;

CREATE TRIGGER cop_prog_opsfechas_instrg_AI AFTER INSERT ON prog_opsfechas FOR EACH ROW
INSERT INTO cop_prog_opsfechas_instrg(
    ProTipoOperacion,
    ProIntroduccirNuevaOperacion,
    ProFechadeEjecucion,
    ProClienteSolicitante,
    ProEditarOperacion,
    ProRecargadeExtintor,
    ProPinturaExtintor,
    ProResuministroExtintor,
    ProMantenimientoExtintor,
    ProDesinfexion,
    ProFumigacion,
    ProPlandeSaneamiento,
    ProLavadodeTanques,
    ProCapacitacionSeguridad,
    ProManipulacionAlimentos,
    ProCarnetizacion,
    ProVentaInsumos
    )
VALUES(
    NEW.ProTipoOperacion,
    NEW.ProIntroduccirNuevaOperacion,
    NEW.ProFechadeEjecucion,
    NEW.ProClienteSolicitante,
    NEW.ProEditarOperacion,
    NEW.ProRecargadeExtintor,
    NEW.ProPinturaExtintor,
    NEW.ProResuministroExtintor,
    NEW.ProMantenimientoExtintor,
    NEW.ProDesinfexion,
    NEW.ProFumigacion,
    NEW.ProPlandeSaneamiento,
    NEW.ProLavadodeTanques,
    NEW.ProCapacitacionSeguridad,
    NEW.ProManipulacionAlimentos,
    NEW.ProCarnetizacion,
    NEW.ProVentaInsumos
    );

SELECT * FROM cop_prog_opsfechas_instrg;

INSERT INTO prog_opsfechas (ProTipoOperacion, ProRecargadeExtintor, ProClientes) VALUES ("Fumigacion", "N/A", 2);