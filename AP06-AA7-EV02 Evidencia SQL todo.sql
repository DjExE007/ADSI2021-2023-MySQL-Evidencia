==========================================Lineas de comandos MySQL =================================================
ADSI VR - 
Manuel Caycedo Martinez
Sara Tatiana Manrique Machado
Nicolás Sáenz Clavijo
José Humberto Bernal Corredor
Kevin Manolo Franco Lombana
Aprendices ADSi SENA-CCyS VR 2282082

==========================================================================================
==========================================================================================
create database prevensan;
use prevensan;
show tables from prevensan;
create table cliente(
idcliente int(12) not null auto_increment,
Cliempresa varchar(30) not null,
primary key (idcliente)
)auto_increment=1;
alter table cliente
add Representante varchar(50);
alter table cliente
modify column Cliempresa varchar(30);
alter table cliente
add CliTelefonos int(14),
add CliDireccion varchar(30),
add CliCorreo varchar(30),
add CliSitioWeb varchar(70),
add CliSectordelmercado varchar(15),
add CliVinculoServicios varchar(15);
ALTER TABLE cliente
CHANGE COLUMN Representante ClieRepresentante VARCHAR(50);
CREATE TABLE OperadorSi(
idOperadorSi VARCHAR(10) NOT NULL,
OpeContraseña VARCHAR(10) NOT NULL,
PRIMARY KEY (idOperadorSi));
CREATE TABLE GeneradorAlertas(
GenFechaVencimiento DATE,
GenCalendarioReal DATE,
GenAvisoTipoOperacion DATE);
CREATE TABLE ProgramadordeOperaciones(
ProgTipoOperacion VARCHAR(20),
ProIntroduccirNuevaOperacion VARCHAR(20),
ProFechadeEjecucion DATE,
ProClienteSolicitante VARCHAR(20),
ProEditarOperacion VARCHAR(20),
ProRecargadeExtintor VARCHAR(20),
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
ProVentaInsumos VARCHAR(20));
ALTER TABLE operadorsi
ADD Opecliente INT(12), 
ADD FOREIGN KEY (Opecliente) 
REFERENCES cliente(idcliente);
ALTER TABLE operadorsi
ADD Opealerta VARCHAR(300),
ADD FOREIGN KEY(Opealerta)
REFERENCES GeneradorAlertas(GenAvisoTipoOperacion);
ALTER TABLE GeneradorAlertas
MODIFY COLUMN GenAvisoTipoOperacion VARCHAR (300) NOT NULL;
ALTER TABLE GeneradorAlertas
ADD PRIMARY KEY (GenAvisoTipoOperacion);
ALTER TABLE ProgramadordeOperaciones
ADD PRIMARY KEY (ProgTipoOperacion);
ALTER TABLE operadorsi
ADD OpeOperacion VARCHAR(20),
ALTER TABLE operadorsi
ADD FOREIGN KEY(OpeOperacion)
REFERENCES ProgramadordeOperaciones(ProgTipoOperacion);
CREATE TABLE Valores_Generales(
iDValores_Generales INT(15),
VagMoneda_Colombiana INT(15));
ALTER TABLE Valores_Generales
ADD PRIMARY KEY (iDValores_Generales);
CREATE TABLE Totales_del_Mes(
idTotales_del_mes INT(15),
TotMoneda_Colombiana INT(15),
TotValores_servicios_mes INT(15),
TotSumatoria_todos_servicios_mes INT(15),
PRIMARY KEY (idTotales_del_mes));
CREATE TABLE Totales_Historicos(
idTotales_Historicos DATE,
HisMoneda_colombiana_año INT(15),
HisMoneda_colombiana_actual INT(15),
HisFiltrar_año DATE,
HisFiltrar_mes DATE,
HisSumatoria_Todos_Servicios_filtro INT(15),
PRIMARY KEY (idTotales_Historicos));
ALTER TABLE Totales_del_Mes
ADD TotValores_Generales INT(15),
ADD FOREIGN KEY(TotValores_Generales)
REFERENCES Valores_Generales(iDValores_Generales);
ALTER TABLE Totales_Historicos
ADD HisTotales_mes INT(15),
ADD FOREIGN KEY(HisTotales_mes)
REFERENCES Totales_del_Mes(idTotales_del_mes);
CREATE TABLE Valor_Servicio_o_Operacion(
idValor_Servicio_o_Operacion INT(15),
PRIMARY KEY (idValor_Servicio_o_Operacion));
ALTER TABLE Valores_Generales 
ADD VagValorServicioOP INT(15),
ADD FOREIGN KEY(VagValorServicioOP)
REFERENCES Valor_Servicio_o_Operacion(idValor_Servicio_o_Operacion);
CREATE TABLE Costo_de_Servicio_o_Operacion(
idCostos_Operacion INT(15),
CosMoneda_Colombiana INT(15),
CosCostos_Transporte INT(15),
CosValor_Insumos INT(15),
CosSumatoria_costos_insumo INT(15),
PRIMARY KEY (idCostos_Operacion));  
CREATE TABLE Margen_de_Ganancia(
idMargen_Ganancia INT(15) NOT NULL AUTO_INCREMENT,
MarValor_Operacion_Mercado INT(15),
MarMoneda_colombiana INT(15),
MarResta_Valor_Op_MercadomenosCostos_Servicio INT(15),
PRIMARY KEY (idMargen_Ganancia));
CREATE TABLE Generador_de_Documentos(
idGenerador_Documentos INT(15),
PRIMARY KEY (idGenerador_Documentos));
ALTER TABLE Generador_de_Documentos
MODIFY COLUMN idGenerador_Documentos INT(15)
NOT NULL AUTO_INCREMENT;
CREATE TABLE Remision(
idRemision INT(4)NOT NULL AUTO_INCREMENT,
RemPlantilla_diseñada VARCHAR(10) NOT NULL,
RemFecha DATE NOT NULL,
RemPais_destino VARCHAR(10) NOT NULL,
RemCiudad_de_destino VARCHAR(10) NOT NULL,
RemDatos_cliente VARCHAR(500)NOT NULL,
RemDetalles_servicio VARCHAR(300) NOT NULL,
PRIMARY KEY(idRemision));
CREATE TABLE Factura(
idFactura INT(4)NOT NULL AUTO_INCREMENT,
FacPlantilla_Diseñada VARCHAR(10) NOT NULL,
FacFecha DATE NOT NULL,
FacPais_destino VARCHAR(10)NOT NULL,
FacCiudad_destino VARCHAR(50)NOT NULL,
FacDatos_cliente VARCHAR(500)NOT NULL,
FacDetalles_cobros VARCHAR(700)NOT NULL,
FacValores_cobros_monCol INT(15)NOT NULL,
FacValor_Total INT(15)NOT NULL,
PRIMARY KEY(idFactura));
ALTER TABLE Valor_Servicio_o_Operacion 
ADD VasMargen_Ganancia INT(15),
ADD FOREIGN KEY(VasMargen_Ganancia)
REFERENCES Margen_de_Ganancia(idMargen_Ganancia);
ALTER TABLE Generador_de_Documentos 
ADD GedValor_OPS INT(15),
ADD FOREIGN KEY(GedValor_OPS)
REFERENCES Valor_Servicio_o_Operacion(idValor_Servicio_o_Operacion);
ALTER TABLE Remision 
ADD RemGen_docs INT(15),
ADD FOREIGN KEY(RemGen_docs)
REFERENCES Generador_de_Documentos(idGenerador_Documentos);
ALTER TABLE Factura
ADD FacGen_docs INT(15),
ADD FOREIGN KEY(FacGen_docs)
REFERENCES Generador_de_Documentos(idGenerador_Documentos);
ALTER TABLE cliente
ADD Numero_de_cliente INT(5) NOT NULL;
ALTER TABLE cliente
MODIFY COLUMN 
Cliempresa INT(12) NOT NULL;
ALTER TABLE cliente
MODIFY COLUMN 
ClieRepresentante VARCHAR(50) NOT NULL;
ALTER TABLE cliente
MODIFY COLUMN
CliTelefonos INT(14) NOT NULL;
ALTER TABLE cliente
MODIFY COLUMN
CliDireccion VARCHAR(30) NOT NULL;
ALTER TABLE cliente
CHANGE COLUMN ClieRepresentante
Clirepresentante VARCHAR(50) NOT NULL;
ALTER TABLE cliente
CHANGE COLUMN Numero_de_cliente
Clinumero_cliente INT(5) NOT NULL;
ALTER TABLE cliente
MODIFY COLUMN
Clinumero_cliente INT(5) NOT NULL UNIQUE;
ALTER TABLE cliente
CHANGE COLUMN Clinumero_cliente
CliIdentificacion_cliente VARCHAR(12) NOT NULL UNIQUE;
ALTER TABLE OperadorSi
MODIFY COLUMN 
idOperadorSi INT(12) NOT NULL AUTO_INCREMENT UNIQUE;
ALTER TABLE OperadorSi
ADD OpeIdentificacion INT(12) NOT NULL;
ALTER TABLE OperadorSi
MODIFY COLUMN
OpeIdentificacion INT(12) NOT NULL UNIQUE;
ALTER TABLE OperadorSi
MODIFY COLUMN
OpeContraseña VARCHAR(10) NOT NULL UNIQUE;
ALTER TABLE ProgramadordeOperaciones
CHANGE COLUMN ProgTipoOperacion
ProTipoOperacion VARCHAR(20) NOT NULL;
ALTER TABLE Costo_de_Servicio_o_Operacion
MODIFY COLUMN 
CosMoneda_Colombiana INT(15) NOT NULL;
ALTER TABLE Costo_de_Servicio_o_Operacion
MODIFY COLUMN 
CosSumatoria_costos_insumo INT(15) NOT NULL;

ALTER TABLE programadordeoperaciones RENAME TO prog_opsfechas;
ALTER TABLE prog_opsfechas 
ADD progClientes VARCHAR(60)NOT NULL;
ALTER TABLE prog_opsfechas
CHANGE progClientes ProgClientes INT(15) NOT NULL;
ALTER TABLE cliente MODIFY COLUMN Cliempresa VARCHAR (15) NOT NULL;
ALTER TABLE cliente MODIFY COLUMN  Clitelefonos VARCHAR(15) NOT NULL;
INSERT INTO cliente 
(Cliempresa, Clirepresentante, Clitelefonos, CliDireccion, CliCorreo, CliSitioWeb, CliSectordelmercado, CliVinculoServicios, CliIdentificacion_cliente)
VALUES
( "Prevensan", "Clara Martin", "3203313994", "Cr 6 # 183-45", "prevensan.col@gmail.com", "prevensancol.wixsite.com/prsancol","ambiental", "extintores", 9011860931);
ALTER TABLE cliente CHANGE Clitelefonos Clitelcel VARCHAR(15) NULL;
ALTER TABLE cliente ADD Clitelocal VARCHAR(15);
INSERT INTO operadorsi ( OpeContraseña, OpeIdentificacion ) VALUES(
"0", 80844234);
ALTER TABLE generadoralertas RENAME TO gen_alertas;
INSERT INTO gen_alertas 
(GenFechaVencimiento, GenAvisoTipoOperacion) VALUES ("2023-05-01", "Vencimiento fecha extintor");
ALTER TABLE prog_opsfechas MODIFY COLUMN ProRecargadeExtintor VARCHAR(30) NOT NULL;
INSERT INTO prog_opsfechas (ProTipoOperacion, ProRecargadeExtintor, ProgClientes) VALUES ("Recarga extintor", "ABC multiproposito 10 LB", 1);
SELECT * FROM cliente;
SELECT * FROM operadorsi;
SELECT * FROM gen_alertas;
SELECT * FROM prog_opsfechas;
SELECT CliIdentificacion_cliente FROM cliente;
SELECT OpeIdentificacion, OpeContraseña FROM operadorsi;
SELECT GenAvisoTipoOperacion, GenFechaVencimiento FROM gen_alertas;
SELECT ProTipoOperacion, ProFechadeEjecucion FROM prog_opsfechas;
SELECT * FROM prog_opsfechas;

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

/*Procedimientos para la base de datos Prevensan del sistema de informacion Prevensis*/

/*Procedimientos de tipo consulta*/
/*Requeridos para la tabla cliente*/

CREATE PROCEDURE consulCliente()
SELECT * FROM cliente;

CALL consulCliente();

/*Requeridos para la tabla operadorsi*/
CREATE PROCEDURE consultarOpeSi() 
SELECT * FROM operadorsi;

CALL consultarOpeSi();

/*Requeridos para la tabla prog_opsfechas*/
CREATE PROCEDURE consProfechas()
SELECT * FROM prog_opsfechas;

CALL consProfechas();

/*Requeridos para la tabla gen_alertas*/
CREATE PROCEDURE consGenalertas()
SELECT * FROM gen_alertas;

CALL consGenalertas();
	