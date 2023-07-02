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
@WebServlet(name = "placeorder", urlPatterns = {"/placeorder"})
public class placeorder extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        int qty = Integer.parseInt(request.getParameter("quantity"));
        String land = request.getParameter("landmark");
        String address =request.getParameter("address");
        int zip = Integer.parseInt(request.getParameter("zip"));
        
        try{
            Crud c = new Crud("root","");
            ResultSet cartData = c.getData("SELECT c.uid,p.* FROM cart c, products p WHERE c.pid=p.pid AND c.cid="+cid);
            cartData.next();
            int pid = cartData.getInt("pid");
            int uid = cartData.getInt("uid");
            int newStock = cartData.getInt("stock") - qty;
            int amount = cartData.getInt("price")*qty;
            int discount = amount*5/100;
            int delivery = amount>500 ? 0 : qty*20;
            int totalAmount = amount - discount + delivery;
            
            String placeQuery = "INSERT INTO `orders`(`pid`,`uid`,`qty`,`delivery`,`discount`,`landmark`,`address`,`zip`,`amount`) ";
            placeQuery+="VALUES("+pid+","+uid+","+qty+","+delivery+","+discount+",'"+land+"','"+address+"',"+zip+","+totalAmount+")";
            c.dispatchOperation(placeQuery);
            c.dispatchOperation("DELETE FROM `cart` WHERE `cid`="+cid);
            c.dispatchOperation("UPDATE `products` SET `stock`="+newStock+" WHERE `pid`="+pid);
            Helper.setAlert(false, "Order placed successfully", request);
        }catch(Exception err){
            Helper.setAlert(true, "Internal server error", request);
        }
        response.sendRedirect("/");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
