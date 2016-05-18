CREATE OR REPLACE TRIGGER trigg_aumentarSalario
BEFORE UPDATE OF salario ON emple
FOR EACH ROW
BEGIN
	IF :new.salario > :old.salario*1.20 THEN 
		RAISE_APPLICATION_ERROR(-20600, 'El salario ' :new.salario || ' no se puede aumentar el salario más de un 20%');
	END IF;
END trigg_aumentarSalario;