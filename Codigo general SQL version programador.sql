                                        /*Codigos SQL*/
                                        /*version codigo*/
/CODIGOS PARA SQL/

♦♦♦♦
♣♣♣
SYSTEM CLS
♥Comando en minúsculas♥
system cls
♦♦♦♦
♣♣♣

♦♦♦♦
♣♣♣
Punto y coma
;
♣♣♣Uso obligatorio para cerrar todas las sentencias
♦♦♦♦
♣♣♣

♦♦♦♦
♣♣♣
SHOW DATABASES;
♥Comando en minúsculas♥
show databases;
♣♣♣Uso: ver las bases de datos que estan creadas en el programa
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
USE ♠nombre base de datos♠;
♥Comando en minúsculas♥
use ♠nombre base de datos♠;
♣♣♣Uso:trae la base de datos creada para trabajar en ella
♣♣♣

♦♦♦♦
♣♣♣
SHOW TABLES FROM;
♥Comando en minúsculas♥
show tables from ♠nombre base de datos♠;
♣♣♣Uso:mostrar las tablas de una base de datos
♦♦♦♦

♦♦♦♦
♣♣♣
SHOW CREATE TABLE ♠nombre table♠;
♥Comando en minúsculas♥
show create table ♠nombre tabla♠;
♣♣♣Uso: mostrar el comando completo como se creo la tabla
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
DESCRIBE ♠nombre tabla♠;
♥Comando en minúsculas♥
describe ♠nombre tabla♠;
♣♣♣Uso: el comando sirve para mostrar la la descripcion de la tabla detallada que se creo en la 
base de datos con su respectiva informacion
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
DROP DATABASE ♠nombre de la base datos♠;
♥Comando en minúsculas♥
drop database ♠nombre de la base datos♠;
♣♣♣Uso:eliminar una base de datos
♦♦♦♦
♣♣♣

♦♦♦♦
♣♣♣
SELECT * FROM ;
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣♣
SHOW ENGINES;
♥Comando en minúsculas♥
show engines;
♣♣♣
Muestra el motor con el que trabaja la tabla de datos
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
SELECT * FROM INFORMATION_SCHEMA.ENGINES;
♥Comando en minúsculas♥
select * from information_schema.engines;
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
INSERT INTO PERSONA (puede ser nombres de las columnas ejem cc, nombre)VALUES
(valores que van a ir en las columnas reales, ejemplo, 80844234,"Yulieth","jardin");
♥Comando en minúsculas♥
insert into persona (puede ser nombres de las columnas ejem cc, nombre)values
(valores que van a ir en las columnas reales, ejemplo, 80844234,"Yulieth","jardin");
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
SELECT * FROM nombre_tabla;
♥Comando en minúsculas♥
select * from nombre_tabla;
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
SELECT nombre_campo_tabla FROM nombre_tabla; 
♥Comando en minúsculas♥
select nombre_campo_tabla from nombre_tabla;
♣♣♣Uso:Muestra una consulta donde solo se vean los datos contenidos en determinado campo de una tabla
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
SELECT NOMBRE_CAMPO_TABLA , NOMBRE_CAMPO_TABLA FROM NOMBRE_TABLA;
♥Comando en minúsculas♥
select nombre_campo_tabla , nombre_campo_tabla from nombre_tabla;
♣♣♣Uso:Muestra una consulta donde solo se vean los datos contenidos en determinados 2 o mas campos de una tabla
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
SELECT nombre_campo, nombre_campo, nombre_campo FROM nombretabla WHERE nombre_campo = dato del campo;
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
SELECT nombre_campo, nombre_campo FROM nombre_tabla WHERE nombre_campo SIGNO CONDICIONAL dato de campo;
♥Comando en minúsculas♥
select nombre_campo, nombre_campo from nombre_tabla where nombre_campo signo condicional dato de campo;
♣♣♣Uso: para usar consultas condicionadas
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
SELECT * NOMBRE_TABLA.NOMBRE_CAMPO_TABLA, NOMBRE_TABLA.NOMBRE_CAMPO_TABLA, NOMBRE_TABLA_A_ADICIONAR.NOMBRE_CAMPO_TABLA_ESTA_TABLA 
JOIN NOMBRE_TABLA ON NOMBRE_TABLA.LLAVE_FOR_OTRA_TABLA = NOMBRE_TABLA.NOMBRE_CAMPO_TABLA;
♣♣♣Uso: consultas multitablas
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
UPDATE nombretabla SET nombrecampo="dato" WHERE nombrecampo =dato;
♥Comando en minúsculas♥
update nombretabla set nombrecampo="dato" where nombrecampo =dato;
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
DELETE FROM nombre_tabla WHERE nombre_campo_tabla = dato;
♣♣♣
♦♦♦♦

♦♦♦♦
♣♣♣
GROUP BY - HAVING - LIKE - ORDER BY

♣♣♣
♦♦♦♦
/*Triggers*/
/*1. Hacer copia de cada tabla, para ello crear una copia de la tabla creando una tabla nueva, usar la siguiente notacion si se quiere
cop_NOMBRE_TABLA_AI
Ejemplo:
CREATE TABLE cop_cliente_insTrigger(
    idcliente INT(12)NOT NULL,
    CliIdentificacion_cliente VARCHAR(12) NOT NULL,);
*/
CREATE TRIGGER cop_cliente_insTrigger_AI AFTER INSERT ON cliente FOR EACH ROW STAMENT
 INSERT INTO cop_NOMBRE_TABLA_AI(
    NOMBRE_CAMPO_TABLA,
    NOMBRE_CAMPO_TABLA,
    y continua con los campos de la respectiva tabla a copiar
    );  

♣♣♣Uso: Los triggers sirven para crear bitacoras de los movimientos de los datos asi como copias de los datos
se activan al hacer movimientos en la base de datos cuando son alterados  
♣♣♣
♦♦♦♦


/*Triggers como bitacoras*/
/*Estos triggers sirven mostrar los registros cuando una tabla se modifica, muestra datos viejos
1. Hay que crear una nueva tabla donde se van a llevar los registros, se recomienda las siguientes notaciones
cop_NOMBRE_TABLA_upd = copia_ Nombre de la Tabla de la que se basa la info_ update(actualizar)
nombre_tabla_BU = Nombre de la tabla que se actualizo BEFORE UPDATE (antes de actualizar)*/

CREATE TABLE cop_NOMBRE_TABLA_upd(N_NOMBRE_CAMPO_TABLA TIPO_DATO, O_NOMBRE_CAMPOTIPO_DATO);

CREATE TRIGGER nombre_tabla_BU BEFORE UPDATE ON NOMBRE_TABLA FOR EACH ROW
   INSERT INTO cop_nombre_tabla_upd (
       N_NOMBRE_CAMPO_TABLA, 
       O_NOMBRE_CAMPO)
   VALUES(
        NEW.NOMBRE_CAMPO_TABLA,
        NEW.NOMBRE_CAMPO_TABLA,
        OLD.NOMBRE_CAMPO_TABLA, 
        OLD.NOMBRE_CAMPO_TABLA
   );

/*Triggers para eliminar*/
/*Igual que los anteriores triggers se crea una tabla copia cop
y se usa segun el comando crud la sintaxis*/
CREATE TRIGGER nombre_tabla_AD/*♠AFTER DELETE♠*/ ON tipo_docum FOR EACH ROW 
INSERT INTO cop_nombre_tabla_del ( nombre_campo,nombre_campo) VALUES
(OLD.nombre_campo, 
 OLD.nombre_campo,  
); 