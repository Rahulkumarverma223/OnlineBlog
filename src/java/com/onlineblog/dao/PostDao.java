
package com.onlineblog.dao;
import com.onlineblog.entities.Category;
import com.onlineblog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
     
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList<>();
        
        try{
            String query="select * from categories";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(query);
            
            while(set.next()){
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Category c=new Category(cid,name,description);
                list.add(c);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
     return list;   
    }
    
    public boolean savePost(Post p){
        boolean f=false;
        
        try{
            String query="insert into posts(pTitle,pContent,pCode,pPic,catID,userId)values(?,?,?,?,?,?)";
            PreparedStatement psmt=con.prepareStatement(query);
            psmt.setString(1, p.getpTitle());
            psmt.setString(2, p.getpContent());
            psmt.setString(3,p.getpCode());
            psmt.setString(4, p.getpPic());
            psmt.setInt(5, p.getCatID());
            psmt.setInt(6, p.getUserId());
            psmt.executeUpdate();
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
//    get all the posts
    public List<Post> getAllPosts(){
        List<Post> list=new ArrayList<>();
        //fetch all posts
        try{
            PreparedStatement p=con.prepareStatement("select * from posts");
            ResultSet rs=p.executeQuery();
            while(rs.next()){
                
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp pDate=rs.getTimestamp("pDate");
                int catID=rs.getInt("catID");
                int userId=rs.getInt("userId");
                
                Post post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catID, userId);
                
                list.add(post);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    public List<Post> getPostByCatId(int catID){
        List<Post> list=new ArrayList<>();
//        fetch all by id
try{
            PreparedStatement p=con.prepareStatement("select * from posts where catID=?");
            p.setInt(1, catID);
            ResultSet rs=p.executeQuery();
            while(rs.next()){
                
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp pDate=rs.getTimestamp("pDate");
                
                int userId=rs.getInt("userId");
                
                Post post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catID, userId);
                
                list.add(post);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }

        
        return list;
    }
    
    public Post getPostByPostId(int postId)
    {
        Post post=null;
        try{
            String query="select * from posts where pid=?";
            PreparedStatement set=this.con.prepareStatement(query);
            set.setInt(1, postId);
            
            ResultSet rs=set.executeQuery();
            if(rs.next()){
                int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp pDate=rs.getTimestamp("pDate");
                int catID=rs.getInt("catID");
                int userId=rs.getInt("userId");
                
                 post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catID, userId);
                
                
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return post;
    }
    
    public List<Post> getPostByUserId( int userId){
        List<Post> list=new ArrayList<>();
        
        
        try{
            String query="select * from posts where userId=?";
            PreparedStatement psmt=this.con.prepareStatement(query);
           
                psmt.setInt(1, userId);
                ResultSet rs=psmt.executeQuery();
                while(rs.next()){
                
                 int pid=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                Timestamp pDate=rs.getTimestamp("pDate");
                int catID=rs.getInt("catID");
               // int userId=rs.getInt("userId");
                
                 Post post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catID, userId);
                
                list.add(post);
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
}
