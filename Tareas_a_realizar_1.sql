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

SET SERVEROUTPUT ON;

DECLARE
  /*numero de variables = numero de columnas:
  v_max_id centros.id%type;
  */
  
  consulta number(2);
BEGIN
  /*solo puedo usar sentencias DML*/
   select max(id)
   into consulta 
   from centros;
   
   if (consulta is null) THEN
      DBMS_OUTPUT.PUT_LINE('La tabla no tiene datos');
   else
      DBMS_OUTPUT.PUT_LINE('El ultimo identificador de centro es:' || consulta);
  end if;
END;

/* EJERCICIO 3 */

DECLARE
  consulta centros.nombre%type;
BEGIN
   select nombre
   into consulta 
   from centros
   where id = 3;
   
   if (consulta is not null) 
    then
      DBMS_OUTPUT.PUT_LINE('El ultimo identificador de centro es:' || consulta);
   end if;
EXCEPTION
   when no_data_found then
      DBMS_OUTPUT.PUT_LINE('La tabla no tiene datos E');
   when others then
       DBMS_OUTPUT.PUT_LINE('Error inesperado');
END;

desc centros;

/* EJERCICIO 4 */

select * from centros;

select * from centros
where lower(nombre) = 'abrera';

DECLARE
  v_nombre centros.nombre%type;
BEGIN
  select nombre 
  into v_nombre
  from centros
  where lower(nombre) = 'abrera';
  
  if sql%found
    then
      DBMS_OUTPUT.PUT_LINE('Ya hay un centro con el nombre Abrera');
  end if;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    insert into centros(nombre) values ('Abrera');
    
    -- comprobamos la insercion
    if sql%notfound
      then
        DBMS_OUTPUT.PUT_LINE('Ningun registro insertado');
      else
        DBMS_OUTPUT.PUT_LINE('Centro insertado');
        commit;
    end if;
  when too_many_rows then
    DBMS_OUTPUT.PUT_LINE('Hay mas de un centro con el nombre abrera');
END;

/* EJERCICIO 5 */

SET SERVEROUTPUT ON;

DECLARE
  v_idcentro centros.id%type:=1;
BEGIN
  update centros
  set provincia = 'alava'
  where id = v_idcentro;
  
  if sql%found
    then
      dbms_output.put_line('Centro ' || to_char (v_idcentro) || ' actualizado');
      commit;
    else
      dbms_output.put_line('No existe el centro ' || to_char (v_idcentro));
  end if; 
END;

/* EJERCICIO 6 */

/*

Declarar el cursor

CURSOR name_cursor IS
  select *
  from emple;

Abrir el cursor

OPEN name_cursor;

Leer el cursos

FETCH

*/

SET SERVEROUTPUT ON;

DESC TRABAJADORES

CREATE OR REPLACE PROCEDURE ver_trabajador 
IS
  cursor c_trabajadores IS
    select apellido1, fechanac
    from trabajadores
    order by apellido1;
  
  reg_trabajador c_trabajadores%rowtype;
BEGIN
  open c_trabajadores;
  loop
    fetch c_trabajadores into reg_trabajador;
    DBMS_OUTPUT.PUT_LINE(reg_trabajador.apellido1 || ' ' || to_char(reg_trabajador.fechanac));
    exit when c_trabajadores%notfound;
  end loop;
  
  close c_trabajadores;
END;

execute ver_tabajador;

