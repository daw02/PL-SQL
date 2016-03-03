/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 1gprog02
 */
public class GenericBD {
    private static Connection conexion;
    
    public static boolean connect(){
        try{
            //indicamos el driver, el tipo de base de datos.
            //para oracle, es la unica linea que cambia si cambia el tipo de bases de datos (mySql, Access).
            Class.forName("oracle.jdbc.OracleDriver");
            String user = "daw02";
            String pass = "daw02";
            String url = "jdbc:oracle:thin:@SrvOracle:1521:orcl";
            conexion = DriverManager.getConnection(url, user, pass); 
            return true;
        }
        catch(Exception e){
            return false;
        }
    }
    
    public static Connection conexion(){
        return conexion;
    }
    
    public static boolean disconnect(){
        try {
            // cerrar conexion
            conexion.close();
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }
}
