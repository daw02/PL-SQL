/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejemplo;

/**
 *
 * @author 1gprog02
 */

import java.sql.*;

public class Ejemplo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //abrir conexion
        
        try{
            //indicamos el driver, el tipo de base de datos.
            //para oracle, es la unica linea que cambia si cambia el tipo de bases de datos (mySql, Access).
            Class.forName("oracle.jdbc.OracleDriver");
            
            String login = "nieves";
            String pass = "nieves";
            String url = "jdbc:oracle:thin:@SrvOracle:1521:orcl";
            Connection con = DriverManager.getConnection(url, login, pass);
            
            // insert, update, delete
            Statement sentencia = con.createStatement();
            sentencia.executeUpdate("insert into empleados values('13', 'Pepe')");
            sentencia.executeUpdate("insert into empleados values('14', 'Juan')");
            
            //consulta, select
            ResultSet resultado = sentencia.executeQuery("select * from empleados");
            
            /* columnas empiezan por 1
            
            clase PreparedStatement : para ejecutar sentencias sql con parametros (where dni = ? select)
            String plantilla = "select * from prueba where nombre = ?";
            PreparedStatement ps = conexion.prepareStatement(plantilla);
            ps.setString(1, "Elena Sanchez");
            
            CallableStatement : procedimientos, cursores, triggers 
            
            
            */
            
            //si la consulta devuleve n filas; si devuleve 1 fila seria un if
            String mensaje = "";
            while(resultado.next()){
                //identificacion por nombre de columna, pero tambien se podria por la posicion de la columna
                mensaje += resultado.getString("dni");
                mensaje += resultado.getString("nombre");
                mensaje += "\n";
            }
            javax.swing.JOptionPane.showMessageDialog(null, mensaje);
            
            // cerrar conexion
            con.close();
        }
        catch(ClassNotFoundException e){
            
        }
        catch(Exception e){
            javax.swing.JOptionPane.showMessageDialog(null, "Problemas");
        }
    }
    
}
