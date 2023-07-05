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
@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
public class addProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String prodName = request.getParameter("pName");
        int price = Integer.parseInt(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String img = request.getParameter("image");
        try{
            Crud c = new Crud("root","");
            c.dispatchOperation("INSERT INTO `products`(`name`,`price`,`stock`,`img`) VALUES('"+prodName+"',"+price+","+stock+",'"+img+"')");
            Helper.setAlert(false, "Successfully add product", request);
        }catch(Exception err){
            Helper.setAlert(true, err.getMessage(), request);
        }
        response.sendRedirect("/adminPanel.jsp");
    }

}
