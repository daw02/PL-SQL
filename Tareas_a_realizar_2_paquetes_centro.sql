/* PROCEDIMIENTO INSERTAR CENTRO */

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE insertar_centro(
  p_nombre in centros.nombre%type, 
  p_provincia in CENTROS.PROVINCIA%type
)
IS
  v_nombre CENTROS.NOMBRE%type;
  e_found exception;
BEGIN
  select nombre
  into v_nombre
  from centros 
  where nombre=p_nombre;
  
  if sql%found
    then
      raise e_found;
  end if;    
EXCEPTION
  when e_found then
    DBMS_OUTPUT.PUT_LINE('El centro que intenta insertar ya existe');
  when no_data_found then
    insert into centros (nombre, provincia) values (p_nombre, p_provincia);
END;

select * from centros;

execute insertar_centro('centro1','gipuzkoa');

DECLARE
  v_nombre CENTROS.NOMBRE%type:='centro1';
BEGIN
  insertar_centro(v_nombre,'gipuzkoa');
  DBMS_OUTPUT.PUT_LINE(v_nombre);
END;

delete from centros where nombre='centro1';

/* PROCEDIMIENTO VISUALIZAR LISTA CENTRO */

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE visualizar_lista_centro
IS
  cursor c1 is
    select *
    from centros;
  
  v_reg c1%rowtype;  
BEGIN
  open c1;
  
  fetch c1 into v_reg;
  while c1%found loop
    DBMS_OUTPUT.PUT_LINE(v_reg.id || ' ' || v_reg.nombre || ' ' || v_reg.calle || ' ' || v_reg.numero || ' ' || v_reg.cp || ' ' || v_reg.ciudad || ' ' || v_reg.provincia || ' ' || v_reg.telefono);
    fetch c1 into v_reg;
  end loop;
  
  close c1;
END visualizar_lista_centro;

execute visualizar_lista_centro;

select * from centros;



