/*MejorasCambios de nombres base de datos proyecto si Prevensis*/

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