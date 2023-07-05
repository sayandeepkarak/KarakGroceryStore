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
@WebServlet(name = "updateStock", urlPatterns = {"/updateStock"})
public class updateStock extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        try{
            Crud c = new Crud("root","");
            c.dispatchOperation("UPDATE `products` SET `stock`="+stock+" WHERE `pid`="+pid);
            Helper.setAlert(false, "Stock update successfully", request);
        }catch(Exception err){
            Helper.setAlert(true, err.getMessage(), request);
        }
        response.sendRedirect("/adminPanel.jsp");
    }

}
