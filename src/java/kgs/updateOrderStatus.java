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
@WebServlet(name = "updateOrderStatus", urlPatterns = {"/updateOrderStatus"})
public class updateOrderStatus extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int oid = Integer.parseInt(request.getParameter("oid"));
        int newStatus = Integer.parseInt(request.getParameter("status"));
        String[] statusText = {"Shipped","Out for deliver","Delivered"};
        String text = statusText[newStatus-2];
        try{
            Crud c = new Crud("root","");
            c.dispatchOperation("UPDATE `orders` SET `status`="+newStatus+" WHERE `oid`="+oid);
            Helper.setAlert(false, "Successfully "+text+" order", request);
        }catch(Exception err){
            Helper.setAlert(true, "Internal server error", request);
        }
        response.sendRedirect("/");
    }

}
