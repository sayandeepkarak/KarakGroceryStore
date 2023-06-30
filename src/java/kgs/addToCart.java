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
import java.sql.*;
/**
 *
 * @author SAYANDEEP
 */
@WebServlet(name = "addToCart", urlPatterns = {"/addToCart"})
public class addToCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uid = request.getParameter("userId");
        String pid = request.getParameter("productId");
        PrintWriter pw = response.getWriter();
        try{
            Crud c = new Crud("root","");
            ResultSet findData = c.getData("SELECT * FROM `cart` WHERE `uid`="+uid+" AND `pid`="+pid+"");
            if(!findData.next()){
                ResultSet userData = c.getData("SELECT `uid` FROM `users` WHERE `uid`="+uid);
                if(userData.next()){
                    ResultSet productData = c.getData("SELECT `pid` FROM `products` WHERE `pid`="+pid);
                    if(productData.next()){
                        c.dispatchOperation("INSERT INTO `cart`(`uid`,`pid`) VALUES("+uid+","+pid+")");
                        Helper.setAlert(false,"Successfully added to cart",request);
                    }else{
                        Helper.setAlert(true, "Failed to add", request);
                    }
                }else{
                    Helper.setAlert(true, "Failed to add", request);
                }
            }else{
                Helper.setAlert(false,"Successfully added to cart",request);
            }
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
