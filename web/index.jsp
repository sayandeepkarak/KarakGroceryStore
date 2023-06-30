<%-- Document : index Created on : 28-Jun-2023, 10:14:24 am Author : SAYANDEEP --%>
  <%@page import="kgs.Crud,java.sql.*,java.util.*,kgs.Crud" %>
    <% 
        Cookie[] cookies=request.getCookies(); 
        boolean isVerified=false; 
        String utype="" ; 
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
                if(utype.equals("user")){ 
                    Crud c=new Crud("root",""); 
                    ResultSet data=c.getData("SELECT `uid` FROM `users`");
                    if(data.next()){ 
                      isVerified=true;
                    }  
                } 
            } 
        }
    %>
      <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="css/bootstrap.min.css">
          
          <script src="js/bootstrap.bundle.min.js"></script>
        </head>

        <body>
          <jsp:include page="components/navbar.jsp">
            <jsp:param name="isVerified" value="<%= isVerified %>" />
            <jsp:param name="userId" value="<%= id %>" />
          </jsp:include>
          <jsp:include page="components/carosoul.jsp"></jsp:include>
          <div class="container-fluid d-flex justify-content-sm-between align-items-center flex-wrap w-100 py-3 px-5">
            <h5>Products</h5>
            <form class="d-flex">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-dark">Search</button>
            </form>
          </div>
          <div class="container-fluid d-flex justify-content-start flex-wrap w-100 py-3 px-5 gap-1">
            <%
                Crud c = new Crud("root","");
                ResultSet data = c.getData("SELECT * from `products`");
                while(data.next()){
                    %>
                    <jsp:include page="components/productCard.jsp">
                        <jsp:param name="isVerified" value="<%= isVerified %>" />
                        <jsp:param name="prodName" value='<%= data.getString("name") %>' />
                        <jsp:param name="price" value='<%= data.getFloat("price") %>' />
                        <jsp:param name="imgLink" value='<%= data.getString("img") %>' />
                        <jsp:param name="userId" value='<%= id %>' />
                        <jsp:param name="productId" value='<%= data.getString("pid") %>' />
                    </jsp:include>
                    <%
                }
            %>
          </div>
          <% 
            if(session.getAttribute("isAlert") != null){
                boolean isAlert =(boolean) session.getAttribute("isAlert");
                if(isAlert){
                    boolean isErr = (boolean) session.getAttribute("isError");
                    %>
                    <div class="alert <%= isErr ? "alert-danger" : "alert-success" %> alert-dismissible fade show position-absolute top-0 w-100" style="margin-top: 54px;left:0;" role="alert">
                        <strong><%= !isErr ? "Success" : "Error" %>!</strong> <%= session.getAttribute("message") %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>

                    <%
                    session.removeAttribute("isError");
                    session.removeAttribute("message");
                    session.removeAttribute("isAlert");
                }
            };
          %>
            <script src="js/bootstrap.min.js"></script>
        </body>

        </html>