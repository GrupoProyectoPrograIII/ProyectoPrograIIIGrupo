
  INSERT INTO MODULO(ID_MODULO,NOMBRE,DESCRIPCION,PATH,NIVEL,ORDEN,ID_MODULO_PADRE,ACTIVO) 
  VALUES (1,'MANTENIMIENTOS','MODULO DE MANTENIMIENTOS','/MANTENIMIENTOS',1,1,0,1),
  (2,'PROCESOS','MODULO DE PROCESOS','/PROCESOS',1,2,0,1),
  (3,'PEDIDOS','MODULO DE PEDIDOS','/PEDIDOS',1,3,0,1),
  (4,'REPORTES','MODULO DE REPORTES','/REPORTES',1,4,0,1),
  (5,'SEGURIDAD','MODULO DE SEGURIDAD','/SEGURIDAD',1,5,0,1),
  (6,'MODULOS','MODULO DE MODULOS','/MODULOS',2,1,5,1),
  (7,'PERMISOS','MODULO DE PERMISOS','/PERMISOS',2,2,5,1),
  (8,'ROLES','MODULO DE ROLES','/ROLES',2,3,5,1),
  (9,'USUARIOS','MODULO DE USUARIOS','/USUARIOS',2,4,5,1),
  (10,'AREAS','MODULO DE AREAS','/AREAS',2,1,1,1),
  (11,'CLIENTES','MODULO DE CLIENTES','/CLIENTES',2,2,1,1),
  (12,'MESA','MODULO DE MESA','/MESA',2,3,1,1),
  (13,'MONITOR','MODULO DE MONITOR','/MONITOR',2,4,1,1),
  (14,'PRODUCTO COMBINADO','MODULO DE PRODUCTO COMBINADO','/PRODUCTO COMBINADO',2,5,1,1),
  (15,'PRODUCTOS','MODULO DE PRODUCTOS','/PRODUCTOS',2,6,1,1),
  (16,'PROVEEDORES','MODULO DE PROVEEDORES','/PROVEEDORES',2,7,1,1),
  (17,'TIPO PRODUCTO','MODULO DE PRODUCTO','/PRODUCTO',2,8,1,1),
  (18,'DESCARGA INVENTARIO','MODULO DE DESCARGA INVENTARIO','/DESCARGA INVENTARIO',2,1,2,1),
  (19,'FACTURAS AL CREDITO','MODULO DE FACTURAS AL CREDITO','/FACTURAS AL CREDITO',2,2,2,1),
  (20,'PAGO DE PEDIDO','MODULO DE PAGO DE PEDIDO','/PAGO DE PEDIDO',2,3,2,1),
  (21,'CAJA INVENTARIO','MODULO DE CAJA INVENTARIO','/CAJA INVENTARIO',2,4,2,1),
  (22,'CORTE DE CAJA','MODULO DE CORTE DE CAJA','/CORTE DE CAJA',2,5,2,1),
  (23,'SELECCIONAR MESA','MODULO DE SELECCIONAR MESA','/SELECCIONAR MESA',2,1,3,1),
  (24,'ANULAR','MODULO DE ANULAR','/ANULAR',2,2,3,1),
  (25,'ELEJIR MONITOR','MODULO DE ELEJIR MONITOR','/ELEJIR MONITOR',2,3,3,1),
  (26,'INVENTARIO GENERAL','MODULO DE INVENTARIO GENERAL','/INVENTARIO GENERAL',2,1,4,1),
  (27,'INVENTARIO PARCIAL','MODULO DE INVENTARIO PARCIAL','/INVENTARIO PARCIAL',2,2,4,1),
  (28,'CIERRE','MODULO DE CIERRE','/CIERRE',2,3,4,1),
  (29,'MONITOR DE CAJA','MODULO DE MONITOR DE CAJA','/MONITOR DE CAJA',2,4,4,1);