/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package kgs;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SAYANDEEP
 */
@WebServlet(name = "changeAccess", urlPatterns = {"/changeAccess"})
public class changeAccess extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uid = request.getParameter("userId");
        String accessValue = request.getParameter("accessvalue");
        try{
            Crud c = new Crud("root","");
            c.dispatchOperation("UPDATE `users` SET isVerified="+accessValue+" WHERE `uid`="+uid);
            Helper.setAlert(false, "Successfully Change access", request);
        }catch(Exception e){
            Helper.setAlert(true, "Internal server error", request);
        }
        response.sendRedirect("/adminPanel.jsp");
    }

}
