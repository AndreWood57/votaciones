/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Configuration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author andre
 */
public class Conexion {

    private static Conexion UnicaConexion = null;
    private Connection conexion;

    private Conexion() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String urlConnection = "jdbc:mysql://localhost:3306/votantes_2020_afhr";
        conexion = DriverManager.getConnection(urlConnection, "root", "");
    }

    public synchronized static Conexion GetConexion() throws ClassNotFoundException, SQLException {
        if (UnicaConexion == null) {
            UnicaConexion = new Conexion();
        }
        return UnicaConexion;
    }

    public Connection getCon() {
        return this.conexion;
    }
    
    public void Destroy() throws SQLException{
        conexion.close();
    }
}
