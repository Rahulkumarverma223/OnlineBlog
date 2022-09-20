

package com.onlineblog.helper;
import java.sql.*;

public class ConnectionProvider {
    
    private static Connection con;
    public static Connection getConnection()
    {
        try{
           if(con == null){
               
                // driver load
            Class.forName("com.mysql.cj.jdbc.Driver");
           // create Connection
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineblog","root","India@123");
            
           }
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
