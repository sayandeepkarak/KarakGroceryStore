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

/**
 *
 * @author SAYANDEEP
 */
@WebServlet(name = "removeFromCart", urlPatterns = {"/removeFromCart"})
public class removeFromCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cartId = Integer.valueOf(request.getParameter("cartId"));
        try{
            Crud c = new Crud("root","");
            c.dispatchOperation("DELETE FROM `cart` WHERE cid="+cartId);
            Helper.setAlert(false, "Successfully removed from cart", request);
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
