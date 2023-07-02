<%-- Document : chekout Created on : 02-Jul-2023, 10:44:26 am Author : SAYANDEEP --%>
  <%@page import="kgs.*,java.sql.*,java.util.*,kgs.Crud" %>
    <% 
        if(request.getMethod().equals("POST")){
            Cookie[] cookies=request.getCookies(); 
            boolean isVerified=false; 
            String utype="" ; 
            int id=-1; 
            if(cookies !=null){
                for(Cookie cookie:cookies){ 
                    if(cookie.getName().equals("userId")){ 
                        id=Integer.parseInt(cookie.getValue()); 
                    }else if(cookie.getName().equals("userType")){ 
                        utype=cookie.getValue().toString(); 
                    } 
                }
            } 
            if(utype !="" && id !=-1){
                if(utype.equals("user")){ 
                    try{ 
                        Crud c=new Crud("root",""); 
                        ResultSet data=c.getData("SELECT `uid` FROM `users`");
                        if(data.next()){ 
                            isVerified=true; 
                        } else { 
                            Helper.setAlert(true, "Invalid access to checkout page" , request);
                            response.sendRedirect("/"); 
                        } 
                    }catch(Exception err){ 
                        Helper.setAlert(true, "Internal server error" , request);
                        response.sendRedirect("/");
                    } 
                }else{ 
                    Helper.setAlert(true, "Invalid access to checkout page" , request);
                    response.sendRedirect("/");
                } 
            }else{ 
                response.sendRedirect("/");
            }
      %>
      <%
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        try{
            Crud c = new Crud("root","");
            ResultSet cartData = c.getData("SELECT c.cid,p.*,u.* FROM CART c,products p,users u WHERE c.pid=p.pid AND c.uid=u.uid AND c.cid="+cartId);
            cartData.next();
            int price = cartData.getInt("price");
            int amount = price*quantity;
            int delivery = 20*quantity;
            int discount = amount*5/100;
            int totalAmount = amount - discount + (amount>500 ? 0 :delivery);
      %>
      <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Checkout</title>
          <link rel="stylesheet" href="css/bootstrap.min.css">
        </head>

        <body>
          <jsp:include page="components/navbar.jsp">
            <jsp:param name="isVerified" value="<%= isVerified %>" />
            <jsp:param name="userId" value="<%= id %>" />
            <jsp:param name="showCart" value="false" />
          </jsp:include>
          <main class="container my-5">
            <div class="row g-5">
              <div class="col-md-5 col-lg-4 order-md-last">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                  <span class="text-dark">Items</span>
                  <span class="badge bg-dark rounded-pill">1</span>
                </h4>
                <ul class="list-group mb-3">
                  <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                      <h6 class="my-0"><%= cartData.getString("name") %></h6>
                      <small class="text-muted">Price ₹<%= cartData.getString("name") %> x Quantity <%=quantity%></small>
                    </div>
                    <span class="text-muted">₹<%=amount%></span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                      <h6 class="my-0">Delivery charge</h6>
                      <small class="text-muted">Price ₹20 x Quantity <%=quantity%></small>
                    </div>
                    <span class="text-muted">₹<%=delivery%></span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between bg-light">
                    <div class="text-success">
                      <h6 class="my-0">Discount</h6>
                      <small class="text-muted">5%</small>
                    </div>
                    <span class="text-success">−₹<%=discount%></span>
                  </li>
                  <%
                    if(amount>500){
                  %>
                    <li class="list-group-item d-flex justify-content-between bg-light">
                      <div class="text-success">
                        <h6 class="my-0">Free delivery</h6>
                      </div>
                      <span class="text-success">−₹<%=delivery%></span>
                    </li>
                  <% 
                    }
                  %>
                  <li class="list-group-item d-flex justify-content-between">
                    <span>Total (INR)</span>
                    <strong>₹<%=totalAmount%></strong>
                  </li>
                  <li class="list-group-item d-flex justify-content-between">
                      <a href="/" class="btn btn-dark w-100">Cancle</a>
                  </li>
                </ul>
              </div>
              <div class="col-md-7 col-lg-8">
                <h4 class="mb-3">Billing and shipping information</h4>
                <jsp:include page="components/checkoutForm.jsp">
                    <jsp:param name="name" value='<%=cartData.getString("fname")%>' />
                    <jsp:param name="mobile" value='<%=cartData.getString("mob")%>' />
                    <jsp:param name="address" value='<%=cartData.getString("location")%>' />
                    <jsp:param name="cartId" value='<%=cartId%>' />
                    <jsp:param name="quantity" value='<%=quantity%>' />
                </jsp:include>
              </div>
            </div>
          </main>
          <script src="js/bootstrap.min.js"></script>
          <script src="js/formvalidation.js"></script>
        </body>

        </html
        <%
                }catch(Exception err){  
                    %><h4>Internal server error</h4><%
                }
            }else{
                Helper.setAlert(true, "Invalid access to checkout page" , request);
                response.sendRedirect("/");
            }
        %>