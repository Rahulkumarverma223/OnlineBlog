
package com.onlineblog.servlets;

import com.onlineblog.dao.Userdao;
import com.onlineblog.entities.User;
import com.onlineblog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rahul
 */
public class ContactServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String number=request.getParameter("number");
            String query=request.getParameter("query");
            
            User user= new User(name, email, number, query);
           
            Userdao dao=new Userdao(ConnectionProvider.getConnection());
            if(dao.Contact(user)){
                out.println("success");
                response.sendRedirect("index.jsp");
            }else{
                out.println("error");
            }
           
            
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
