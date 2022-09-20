
package com.onlineblog.dao;

import com.onlineblog.entities.User;
import java.sql.*;
import java.util.*;

/**
 *
 * @author rahul
 */
public class AdminDao {
    
    private Connection con;

    public AdminDao(Connection con) {
        this.con = con;
    }
    
    public List<User> selectAllUsers(){
     List<User> user=new ArrayList<>();
        
        try{
            String query="select * from user";
           PreparedStatement  st=this.con.prepareStatement(query);
           ResultSet rs=st.executeQuery();
           
           while(rs.next()){
            int id=   rs.getInt("id");
            String name=   rs.getString("name");
            String email=   rs.getString("email");
            String password=   rs.getString("password");
            String  number= rs.getString("number");
            Timestamp dataTime=rs.getTimestamp("rdate");
            String gender=  rs.getString("gender");
               
              user.add(new User(id, name, email, password, number, gender, dataTime));
           }
            
            
        }catch(Exception e){
        e.printStackTrace();
    }
        return user;
       
    }
    
    //delete row from user
    public boolean deleteUser(int id){
        boolean f=false;
        try{
            String query="delete from user where id=?";
           PreparedStatement  pmst=this.con.prepareStatement(query);
             pmst.setInt(1, id);    
           int i= pmst.executeUpdate();
            if(i==1)
            {
            f=true;
            }
        }catch(Exception e){
            e.printStackTrace();    
        }
        return f;
    }
    
    //get All Query from user
    public List<User> SelectAllQuery(){
        List<User> user=new ArrayList<>();
        
        try{
            
               PreparedStatement psmt=this.con.prepareStatement("select* from contact");
               ResultSet rs=psmt.executeQuery();
               
               while(rs.next()){
                   int id=rs.getInt("Idquery");
                   String name=rs.getString("name");
                   String email=rs.getString("email");
                   String number=rs.getString("number");
                   String query=rs.getString("query");
                   
                   user.add(new User(id, name, email, number, query));
                   
               }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
}
