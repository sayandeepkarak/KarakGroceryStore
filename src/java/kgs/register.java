/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package kgs;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.ResultSet;

/**
 *
 * @author admin
 */
@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String name = request.getParameter("fname");
            String email = request.getParameter("email");
            String mob = request.getParameter("mobile");
            String pass = request.getParameter("password");
            String address = request.getParameter("address");
            String query = "SELECT `uid` FROM `users` WHERE `email`='"+email+"'";
            
            PrintWriter pw= response.getWriter();
            
            try{
                Crud c = new Crud("root","");
                if(!c.getData(query).next()){
                    query = "INSERT INTO `users` (`uid`, `utype`, `fname`, `email`,`password`, `mob`, `location`) VALUES (NULL, 'user', '"+name+"', '"+email+"', '"+pass+"' ,'"+mob+"', '"+address+"');";
                    c.dispatchOperation(query);
                    ResultSet data = c.getData("SELECT `uid` FROM `users`");
                    data.next();
                    int id = data.getInt(1);
                    Cookie userType = new Cookie("userType","user");
                    Cookie userId = new Cookie("userId",Integer.toString(id));
                    response.addCookie(userType);
                    response.addCookie(userId);
                    Helper.setAlert(false, "Your account is registered succesfully", request);
                }else{
                    HttpSession sess = request.getSession();
                    sess.setAttribute("isAlert",true);
                    sess.setAttribute("message","Email id already exist");
                    sess.setAttribute("isError",true);
                    Helper.setAlert(true, "Email id already exist", request);
                }
            }catch(Exception e){
                Helper.setAlert(true, "Internal server error", request);
            }
            response.sendRedirect("/");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
