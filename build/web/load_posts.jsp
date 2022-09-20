
<%@page import="com.onlineblog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.onlineblog.dao.PostDao"%>
<%@page import="com.onlineblog.helper.ConnectionProvider"%>

<div class="row">
<%
    PostDao d=new PostDao(ConnectionProvider.getConnection());
    int cid=Integer.parseInt(request.getParameter("cid"));
    List<Post> posts=null;
    if(cid==0){
     posts=d.getAllPosts();
    }else{
    posts=d.getPostByCatId(cid);    
    }
    if(posts.size()==0)
    {
    out.println("<h3 class='display-3 text center'>No Posts in the category. </h3>");
    }
    for(Post p:posts)
    {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pic/<%=p.getpPic() %>" alt="Card image cap">
            <div class="card-body">
                <b><%=p.getpTitle() %> </b>
                <p><%=p.getpContent() %> </p>
                
            </div>
                <div class="card-footer text-center primary-background">
                    <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-primary btn-sm text-white">Read More..</a>

                </div>
        </div>
        
    </div>
    
    
    <%
    }

%>
</div>