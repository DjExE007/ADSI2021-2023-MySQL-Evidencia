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
