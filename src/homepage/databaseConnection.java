/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package StudentMangment;

import javax.swing.JOptionPane;
import java.sql.Connection;
import java.sql.DriverManager;        
import java.sql.SQLException;
/**
 *
 * @author ASUS
 */
public class databaseConnection {
    
    final static String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    final static String DB_URL = "jdbc:mysql://localhost:3306/learningmangmentsystem" ;
    final static String USER = "root";
    final static String PASS = "" ;
     public static Connection connection() throws ClassNotFoundException{
    
         try{
              Class.forName(JDBC_DRIVER);
             
             Connection conn =DriverManager.getConnection( DB_URL , USER , PASS) ;
             
             return conn ;
         }catch(SQLException e){
             JOptionPane.showMessageDialog(null , e);
             return null ;
         }
     
     }
}
