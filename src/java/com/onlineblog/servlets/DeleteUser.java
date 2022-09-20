/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.onlineblog.servlets;

import com.onlineblog.dao.AdminDao;
import com.onlineblog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rahul
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserDeleteServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            int id=Integer.parseInt(request.getParameter("id"));
            AdminDao dao=new AdminDao(ConnectionProvider.getConnection());
            boolean f=dao.deleteUser(id);
             HttpSession session=request.getSession();
             if(f==true){
                 session.setAttribute("sucess", "user data delete succesfully");
                 response.sendRedirect("admin_userdetail.jsp");
             }else{
                 session.setAttribute("error", "Something went wrong");
                 response.sendRedirect("admin_userdetail.jsp");
             }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    
}
