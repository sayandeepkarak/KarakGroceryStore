<%-- 
    Document   : adminPanel
    Created on : 03-Jul-2023, 8:34:40 pm
    Author     : SAYANDEEP
--%>
 
<%@page contentType="text/html" import="kgs.*,java.sql.*,java.util.*,kgs.Crud" pageEncoding="UTF-8"%>
<% 
        Cookie[] cookies=request.getCookies(); 
        boolean isVerified=false; 
        String utype="",name="" ; 
        int id=-1;
        if(cookies != null){
            for(Cookie cookie:cookies){ 
                if(cookie.getName().equals("userId")){ 
                    id=Integer.parseInt(cookie.getValue()); 
                }else if(cookie.getName().equals("userType")){ 
                    utype=cookie.getValue().toString(); 
                } 
            } 
            if(utype !="" && id !=-1){
                if(utype.equals("admin")){
                    try{
                        Crud c=new Crud("root",""); 
                        ResultSet data=c.getData("SELECT `uid`,`fname` FROM `users` WHERE `utype`='admin' AND `uid`="+id);
                        if(data.next()){ 
                          isVerified=true;
                          name = data.getString("fname");
                        }else{
                            for(Cookie cookie:cookies){ 
                                if(cookie.getName().equals("userId") || cookie.getName().equals("userType")){ 
                                    cookie.setMaxAge(0);
                                    response.addCookie(cookie);
                                }
                            }
                            response.sendRedirect("/");
                        }
                    }catch(Exception err){
                       Helper.setAlert(true, "Internal server error", request);
                    }
                }else{
                    response.sendRedirect("/");
                }
            } 
        }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
    </head>
    <body>
        <jsp:include page="components/navbar.jsp">
            <jsp:param name="isVerified" value="<%= isVerified %>" />
            <jsp:param name="userId" value="<%= id %>" />
            <jsp:param name="showCart" value="false" />
            <jsp:param name="userName" value="<%=name%>" />
        </jsp:include>
        <h1>Admin</h1>
    </body>
</html>
