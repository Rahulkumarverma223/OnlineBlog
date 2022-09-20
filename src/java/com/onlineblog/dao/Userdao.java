
package com.onlineblog.dao;
import com.onlineblog.entities.User;
import static java.lang.reflect.Array.set;
import java.sql.*;

public class Userdao {
    private Connection con;

    public Userdao(Connection con) {
        this.con = con;
    }
    //method  to insert user into database
    boolean f=false;

    public Userdao() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public boolean saveUser(User user){
        
        try{
            //user database
            String query="insert into user(name,email,password,number,gender)values(?,?,?,?,?)";
           PreparedStatement psmt= this.con.prepareStatement(query);
           psmt.setString(1, user.getName());
           psmt.setString(2, user.getEmail());
           psmt.setString(3, user.getNumber());
           psmt.setString(4, user.getGender());
           psmt.setString(5, user.getPassword());
           
           psmt.executeUpdate();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    //get user by email & password
    public User getuserByEmailAndPassword(String email,String password){
    User user=null;
    
    try{
        String query="select * from user where email=? and password=?";
        PreparedStatement psmt=con.prepareStatement(query);
        psmt.setString(1, email);
        psmt.setString(2, password);
        
        ResultSet set=psmt.executeQuery();
        
        if(set.next()){
            user=new User();
            
//            data from database
          String name=set.getString("name");
           
//           set to user object
         user.setName(name);
         
         user.setId(set.getInt("id"));
         user.setName(set.getString("name"));
         user.setEmail(set.getString("email"));
         user.setPassword(set.getString("password"));
         user.setNumber(set.getString("number"));
         user.setGender(set.getString("gender"));
         user.setDataTime(set.getTimestamp("rdate"));
         
         
        }
        
    }catch(Exception e)
    {
       e.printStackTrace();
    }
            
     return user;       
}
    
    public boolean updateUser(User user){
        boolean f=false;
        try{
            
            String query="update user set name=?,email=?,number=?,password=? where id=?";
            PreparedStatement p=con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getNumber());
            p.setString(4, user.getPassword());
            p.setInt(5, user.getId());
            
            p.executeUpdate();
            f=true;
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public boolean Contact(User user){
        boolean f=false;
        
        try{
            String query="insert into contact(name,email,number,query)values(?,?,?,?)";
            PreparedStatement ps=this.con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getNumber());
            ps.setString(4, user.getQuery());
            
            ps.executeUpdate();
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    
}
