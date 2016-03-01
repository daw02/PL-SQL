/* EJERCICIO 1 */

SET SERVEROUTPUT ON;

BEGIN
  DBMS_OUTPUT.PUT_LINE('hola mundo');
END;


DECLARE
  nombre varchar2(10) := 'Alejandra';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hola mundo ' || UPPER(nombre));
END;

/* EJERCICIO 2 */

DECLARE
  consulta number(2);
BEGIN
   select max(id)
   into consulta 
   from centros;
   
   if (consulta is null) THEN
      DBMS_OUTPUT.PUT_LINE('La tabla no tiene datos');
   else
      DBMS_OUTPUT.PUT_LINE('El ultimo identificador de centro es:' || consulta);
  end if;
END;


