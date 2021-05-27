ALTER TABLE INVENTARIO_GENERAL
DROP CONSTRAINT FK_ID_DETALLE;

ALTER TABLE INVENTARIO_GENERAL
ADD CONSTRAINT CK_ID_DETALLE UNIQUE(ID_DETALLE);

ALTER TABLE INVENTARIO_DETALLE 
ADD CONSTRAINT FK_ID_DETALLE
FOREIGN KEY (ID_DETALLE) REFERENCES INVENTARIO_GENERAL(ID_DETALLE) ON DELETE CASCADE