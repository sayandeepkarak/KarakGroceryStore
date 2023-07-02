/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package kgs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author SAYANDEEP
 */
@WebServlet(name = "cancelOrder", urlPatterns = {"/cancelOrder"})
public class cancelOrder extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int oid = Integer.parseInt(request.getParameter("orderId"));
        try{
            Crud c = new Crud("root","");
            ResultSet data = c.getData("SELECT `qty`,`pid` FROM `orders` WHERE `oid`="+oid);
            data.next();
            int pid = data.getInt("pid");
            int qty = data.getInt("qty");
            ResultSet pData = c.getData("SELECT `stock` FROM `products` WHERE `pid`="+pid);
            pData.next();
            int stock = pData.getInt("stock");
            int newStock = stock+qty;
            c.dispatchOperation("UPDATE `products` SET `stock`="+newStock+" WHERE `pid`="+pid);
            c.dispatchOperation("DELETE FROM `orders` WHERE `oid`="+oid);
            Helper.setAlert(false, "Order cancelled successfully", request);
        }catch(Exception err){
            Helper.setAlert(true, err.getMessage(), request);
        }
        response.sendRedirect("/");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
