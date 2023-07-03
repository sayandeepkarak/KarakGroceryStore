<%-- Document : index Created on : 28-Jun-2023, 10:14:24 am Author : SAYANDEEP --%>
  <%@page import="kgs.*,java.sql.*,java.util.*,kgs.Crud" %>
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
                if(utype.equals("user")){
                    try{
                        Crud c=new Crud("root",""); 
                        ResultSet data=c.getData("SELECT `uid`,`fname` FROM `users` WHERE `utype`='user' AND `uid`="+id);
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
                        }
                    }catch(Exception err){
                       Helper.setAlert(true, "Internal server error", request);
                    }
                }else if(utype.equals("admin")){
                    response.sendRedirect("/adminPanel.jsp");
                }
            } 
        }
    %>
      <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
          <title>KGS</title>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="css/bootstrap.min.css">
          <link rel="stylesheet" href="css/global.css">
        </head>

        <body>
          <jsp:include page="components/navbar.jsp">
            <jsp:param name="isVerified" value="<%= isVerified %>" />
            <jsp:param name="userId" value="<%= id %>" />
            <jsp:param name="showCart" value="true" />
            <jsp:param name="userName" value="<%=name%>" />
          </jsp:include>
          <main>
            <jsp:include page="components/carosoul.jsp"></jsp:include>
            <div class="container-fluid d-flex justify-content-sm-between align-items-center flex-wrap w-100 py-3 px-5">
              <h5 class="m-0">Products</h5>
              <form class="d-flex">
                <input class="form-control me-2" type="search" name="product" placeholder="Search" aria-label="Search">
                <button class="lightBtn">Search</button>
                <a href="/" class="falseBtn ms-1" >Clear</a>
              </form>
            </div>
            <div class="container-fluid d-flex justify-content-around flex-wrap w-100 py-3 px-5 gap-1">
              <%
                  try{
                      String search = request.getParameter("product");
                      Crud c = new Crud("root","");
                      String query = "SELECT * from `products`";
                      if(search != null && !search.isEmpty()){
                        query+=" WHERE `name` LIKE '%"+search+"%'";
                      }
                      ResultSet data = c.getData(query);
                      while(data.next()){
                          %>
                          <jsp:include page="components/productCard.jsp">
                              <jsp:param name="isVerified" value="<%= isVerified %>" />
                              <jsp:param name="prodName" value='<%= data.getString("name") %>' />
                              <jsp:param name="price" value='<%= data.getFloat("price") %>' />
                              <jsp:param name="imgLink" value='<%= data.getString("img") %>' />
                              <jsp:param name="userId" value='<%= id %>' />
                              <jsp:param name="productId" value='<%= data.getString("pid") %>' />
                              <jsp:param name="stock" value='<%= data.getInt("stock") %>' />
                          </jsp:include>
                          <%
                      }
                  }catch(Exception err){
                      Helper.setAlert(true, err.getMessage(), request);
                  }
              %>
            </div>
            <% 
              if(session.getAttribute("isAlert") != null){
                  boolean isAlert =(boolean) session.getAttribute("isAlert");
                  if(isAlert){
                      boolean isErr = (boolean) session.getAttribute("isError");
                      %>
                      <div class="alert <%= isErr ? "alert-danger" : "alert-success" %> alert-dismissible fade show position-absolute top-0 w-100" role="alert">
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
          </main>
          <script src="js/bootstrap.min.js"></script>
          <script src="js/formvalidation.js"></script>
          <!--<script src="js/bootstrap.bundle.min.js"></script>-->
        </body>

        </html>