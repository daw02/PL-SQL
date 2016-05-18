/* CREACIÓN DE LA TABLA */

CREATE OR REPLACE TABLE Ctrl_Empleados
	(Tabla VARCHAR2(10),
	Usuario VARCHAR2(10),
	Fecha DATE,
	Oper VARCHAR2(10));
	
/* CREACIÓN DEL TRIGGER */

CREATE OR REPLACE TRIGGER Control_Empleados 
AFTER INSERT OR DELETE OR UPDATE ON emple
BEGIN 
	IF INSERTING THEN 
		INSERT INTO Ctrl_Empleados (Tabla,Usuario,Fecha,Oper) VALUES('Emple' USER, SYSDATE, 'INSERT'); 
	ELSIF DELETING THEN
		INSERT INTO Ctrl_Empleados (Tabla,Usuario,Fecha,Oper) VALUES('Emple', USER, SYSDATE, 'DELETE'); 
	ELSIF UPDATING THEN
		INSERT INTO Ctrl_Empleados (Tabla,Usuario,Fecha,Oper) VALUES('Emple', USER, SYSDATE, 'UPDATE');
	END IF;
END Control_Empleados;

/* COMPROBACIÓN */

INSERT INTO emple VALUES(8934, 'SARRALDE', 'EMPLEADO', 7782, SYSDATE, 169000, NULL, 10);

UPDATE emple
SET salario = 100
WHERE emp_no = 8934;

DELETE FROM emple
WHERE emp_no = 9834;

SELECT *
FROM emple;