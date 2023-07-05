/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package kgs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.io.PrintWriter;

/**
 *
 * @author SAYANDEEP
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("loginEmail");
        String pass = request.getParameter("loginPass");
        PrintWriter pw = response.getWriter();
        try{
            Crud c = new Crud("root","");
            ResultSet data = c.getData("SELECT `uid`,`utype` FROM `users` WHERE `email`='"+email+"' AND `password`='"+pass+"'");
            if(data.next()){
                int id = data.getInt(1);
                String uType = data.getString(2);
                Cookie userType = new Cookie("userType",uType);
                Cookie userId = new Cookie("userId",Integer.toString(id));
                response.addCookie(userType);
                response.addCookie(userId);
                if(uType.equals("user")){
                    response.sendRedirect("/");
                }else if(uType.equals("admin")){
                    response.sendRedirect("/adminPanel.jsp");
                }
            }else{
                Helper.setAlert(true, "Invalid username and password", request);
                response.sendRedirect("/");
            }
        }catch(Exception err){
            Helper.setAlert(true, "Internal server error", request);
            response.sendRedirect("/");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
