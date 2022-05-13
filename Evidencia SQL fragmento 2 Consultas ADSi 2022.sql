/*Por cada tabla debe exixtir una consulta
por cada tabla debe haber una consulta
minimo 5 de consultas, 5 trigger y 5 procedimientos*/

SELECT * FROM cliente;
SELECT * FROM operadorsi;
SELECT * FROM gen_alertas;
SELECT * FROM prog_opsfechas;


SELECT CliIdentificacion_cliente FROM cliente;
SELECT OpeIdentificacion, OpeContraseña FROM operadorsi;
SELECT GenAvisoTipoOperacion, GenFechaVencimiento FROM gen_alertas;
SELECT ProTipoOperacion, ProFechadeEjecucion FROM prog_opsfechas;

/*Consulta multitabla*/
/*
SELECT NOMBRE_TABLA.NOMBRE_CAMPO_TABLA, NOMBRE_TABLA.NOMBRE_CAMPO_TABLA, NOMBRE_TABLA_A_ADICIONAR.NOMBRE_CAMPO_TABLA_ESTA_TABLA 
FROM NOMBRE_TABLA JOIN NOMBRE_TABLA ON NOMBRE_TABLA.LLAVE_FOR_OTRA_TABLA = NOMBRE_TABLA.NOMBRE_CAMPO_TABLA;

SELECT prog_opsfechas.ProTipoOperacion, prog_opsfechas.ProClienteSolicitante, prog_opsfechas.ProFechadeEjecucion FROM prog_opsfechas
JOIN cliente ON  prog_opsfechas.ProgClientes = cliente.CliIdentificacion_cliente;
SELECT cliente.Cliempresa, cliente.Clirepresentante FROM cliente JOIN prog_opsfechas ON cliente.CliIdentificacion_cliente = prog_opsfechas.ProgClientes;
*/

/*Pendiente intentar*/

SELECT * FROM prog_opsfechas;