/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package kgs;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author SAYANDEEP
 */
public class Helper {
    public static void setAlert(boolean isError,String message,HttpServletRequest request){
        HttpSession sess = request.getSession();
        sess.setAttribute("isAlert",true);
        sess.setAttribute("message",message);
        sess.setAttribute("isError",isError);
    }
}
