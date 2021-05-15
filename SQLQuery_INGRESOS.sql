INSERT INTO MODULO(ID_MODULO,NOMBRE,DESCRIPCION,PATH,NIVEL,ORDEN,ID_MODULO_PADRE,ACTIVO)  VALUES 
	--(1,'VENTAS','MODULO PARA VENTAS','VENTAS/',1,1,1,1),
	(2,'PEDIDOS','MODULO PARA PEDIDOS','PEDIDOS/',2,2,2,1),
	(3,'REPORTES','MODULO PARA REPORTES','REPORTES/',2,2,3,1),
	(4,'SEGURIDAD','MODULO PARA SEGURIDAD','SEGURIDAD/',1,4,1,1)
GO

INSERT INTO USUARIO(ID_USUARIO,NOMBRE,APELLIDO,USUARIO,PASSW,ID_ROL,ACTIVO) VALUES 
	--(1,'Administrator','System','Admin','12345678',1,1),
	(2,'Edgar','Sandoval','esandoval','123',2,1),
	(3,'Byron','Blanco','bblanco','456',2,1),
	(4,'Lester','Carrillo','lcarrillo','1234',3,1),
	(5,'Julio','Lopez','jlopez','5678',3,1)
GO

INSERT INTO ROL(ID_ROL,NOMBRE,DESCRIPCION,ACTIVO) VALUES
	--(1,'Administracion','Rol para administracion del sistema',1),
	(2,'Gerencia','Rol para gerentes del sistema',1),
	(3,'Empleados','Rol para empleados del sistema',1)
GO

INSERT INTO PERMISO(ID_PERMISO,ID_MODULO,ID_ROL,ACTIVO) VALUES
	--(1,1,1,1),
	(2,2,2,1),
	(3,3,3,1)
GO