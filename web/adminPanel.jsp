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
            if(utype !="" && id !=-1 && utype.equals("admin")){
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
        }else{
            response.sendRedirect("/");
        }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/global.css"/>
    </head>
    <body>
        <jsp:include page="components/navbar.jsp">
            <jsp:param name="isVerified" value="<%= isVerified %>" />
            <jsp:param name="userId" value="<%= id %>" />
            <jsp:param name="showCart" value="false" />
            <jsp:param name="isAdmin" value="true" />
            <jsp:param name="userName" value="<%=name%>" />
        </jsp:include>
        <div class="container-fluid d-flex p-0" style="height: calc(100vh - 84px); overflow: hidden;">
            <div class="d-flex flex-column flex-shrink-0 p-3 text-white sidebar h-100">
                <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <button class="nav-link active" id="v-pills-products-tab" data-bs-toggle="pill" data-bs-target="#v-pills-products" type="button" role="tab" aria-controls="v-pills-products" aria-selected="true">Products</button>
                    <button class="nav-link" id="v-pills-orders-tab" data-bs-toggle="pill" data-bs-target="#v-pills-orders" type="button" role="tab" aria-controls="v-pills-orders" aria-selected="false">Orders</button>
                    <button class="nav-link" id="v-pills-orders-tab" data-bs-toggle="pill" data-bs-target="#v-pills-delivered" type="button" role="tab" aria-controls="v-pills-delivered" aria-selected="false">Delivered</button>
                    <button class="nav-link" id="v-pills-orders-tab" data-bs-toggle="pill" data-bs-target="#v-pills-users" type="button" role="tab" aria-controls="v-pills-users" aria-selected="false">Users</button>
                </div>
            </div>
            <div class="tab-content w-100 overflow-scroll" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-products" role="tabpanel" aria-labelledby="v-pills-products-tab">
                    <div class="container-fluid d-flex justify-content-between align-items-center flex-wrap w-100 py-3 px-5">
                        <h5 class="m-0">Products</h5>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" name="product" placeholder="Search" aria-label="Search">
                            <button class="lightBtn">Search</button>
                            <a href="/" class="falseBtn ms-1" >Clear</a>
                          </form>
                    </div>
                    <div class="container-fluid px-5">
                        <table class="table table-hover table-responsive mt-3" style="vertical-align:middle;">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Item</th>
                                    <th>Price</th>
                                    <th>Stock</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
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
                                            int pid = data.getInt("pid");
                                            int stock = data.getInt("stock");
                                            %>
                                            <tr>
                                                <td><%=pid%></td>
                                                <td>
                                                    <div class="d-flex align-items-center flex-wrap">
                                                        <img src="<%=data.getString("img")%>" style="height:100px;"  alt="x" />
                                                        <p><%=data.getString("name")%></p>
                                                    </div>
                                                </td>
                                                <td>₹<%=data.getInt("price")%></td>
                                                <td><%=stock>0 ? stock : "<p class='text-danger m-0 text-nowrap'>Out of stock</p>"%></td>
                                                <td>
                                                    <form action="/updateStock" method="POST" class="d-flex justify-content-around needs-validation" novalidate>
                                                        <input type="hidden" name="pid" value="<%=pid%>" class="form-control w-50">
                                                        <input type="number" class="form-control w-50" placeholder="Stock" name="stock" min="1" required>
                                                        <button class="lightBtn">Update</button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <%
                                        }
                                    }catch(Exception err){

                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-orders" role="tabpanel" aria-labelledby="v-pills-orders-tab">
                    <div class="container-fluid d-flex justify-content-between align-items-center flex-wrap w-100 py-3 px-5">
                        <h5 class="m-0">Orders</h5>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" name="orderId" placeholder="OrderId" aria-label="Search">
                            <button class="lightBtn">Search</button>
                            <a href="/" class="falseBtn ms-1" >Clear</a>
                          </form>
                    </div>
                    <div class="container-fluid px-5">
                        <table class="table table-hover table-responsive mt-3" style="vertical-align:middle;">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Details</th>
                                    <th>Shipping</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try{
                                        String searchOid = request.getParameter("orderId");
                                        Crud c = new Crud("root","");
                                        String query = "SELECT p.*,u.*,o.* FROM `orders` o,`products` p,`users` u WHERE u.uid=o.uid AND p.pid=o.pid AND o.status<4";
                                        if(searchOid != null && !searchOid.isEmpty()){
                                          query+=" AND o.oid="+searchOid;
                                        }
                                        ResultSet data = c.getData(query);
                                        while(data.next()){
                                            int oid = data.getInt("oid");
                                            int realSts = data.getInt("status");
                                            String[] statusTxt = {"Shipped","Out for deliver","Delivered"};
                                            int newStatus=realSts+1;
                                            %>
                                            
                                            <tr>
                                                <td><%=oid%></td>
                                                <td>
                                                    <div class="d-flex align-items-center flex-wrap">
                                                        <img src="<%=data.getString("img")%>" style="height:100px;"  alt="x" />
                                                        <p class="m-0 ms-4">
                                                            <%=data.getString("name")%><br/>
                                                            Qty: <%=data.getInt("qty")%><br />
                                                            Amount: ₹<%=data.getInt("amount")%><br/>
                                                            <b>Placed: <%=data.getDate("orderDate")%></b>
                                                        </p>
                                                    </div>
                                                </td>
                                                <td>
                                                   <%=data.getString("fname")%><br/>
                                                   <%=data.getString("landmark")%><br/>
                                                   <%=data.getString("address")%><br/>
                                                   zip-<%=data.getString("zip")%><br/>
                                                   Mob.-<%=data.getString("contact")%><br/>
                                                </td>
                                                <td>
                                                    <form action="/updateOrderStatus" method="POST" class="d-flex justify-content-around needs-validation" novalidate>
                                                        <input type="hidden" name="oid" value="<%=oid%>">
                                                        <input type="hidden" name="status" value="<%=newStatus%>"/>
                                                        <button class="lightBtn"><%=statusTxt[realSts-1]%></button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <%
                                        }
                                    }catch(Exception err){

                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-delivered" role="tabpanel" aria-labelledby="v-pills-delivered-tab">
                    <div class="container-fluid d-flex justify-content-between align-items-center flex-wrap w-100 py-3 px-5">
                        <h5 class="m-0">Delivered Orders</h5>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" name="orderId" placeholder="OrderId" aria-label="Search">
                            <button class="lightBtn">Search</button>
                            <a href="/" class="falseBtn ms-1" >Clear</a>
                        </form>
                    </div>
                    <div class="container-fluid px-5">
                        <table class="table table-hover table-responsive mt-3" style="vertical-align:middle;">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Details</th>
                                    <th>Shipping</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try{
                                        String deliverOid = request.getParameter("orderId");
                                        Crud c = new Crud("root","");
                                        String query = "SELECT p.*,u.*,o.* FROM `orders` o,`products` p,`users` u WHERE u.uid=o.uid AND p.pid=o.pid AND o.status=4 order by o.oid desc";
                                        if(deliverOid != null && !deliverOid.isEmpty()){
                                          query+=" AND o.oid="+deliverOid;
                                        }
                                        ResultSet data = c.getData(query);
                                        while(data.next()){
                                            %>
                                            <tr>
                                                <td><%=data.getInt("oid")%></td>
                                                <td>
                                                    <div class="d-flex align-items-center flex-wrap">
                                                        <img src="<%=data.getString("img")%>" style="height:100px;"  alt="x" />
                                                        <p class="m-0 ms-4">
                                                            <%=data.getString("name")%><br/>
                                                            Qty: <%=data.getInt("qty")%><br />
                                                            Amount: ₹<%=data.getInt("amount")%><br/>
                                                            <b>Placed: <%=data.getDate("orderDate")%></b>
                                                        </p>
                                                    </div>
                                                </td>
                                                <td>
                                                   <%=data.getString("fname")%><br/>
                                                   <%=data.getString("landmark")%><br/>
                                                   <%=data.getString("address")%><br/>
                                                   zip-<%=data.getString("zip")%><br/>
                                                   Mob.-<%=data.getString("contact")%><br/>
                                                   <span class="text-success">Delivered</span>
                                                </td>
                                            </tr>
                                            <%
                                        }
                                    }catch(Exception err){

                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-users" role="tabpanel" aria-labelledby="v-pills-users-tab">
                    <div class="container-fluid d-flex justify-content-between align-items-center flex-wrap w-100 py-3 px-5">
                        <h5 class="m-0">All users</h5>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" name="username" placeholder="User name" aria-label="Search">
                            <button class="lightBtn">Search</button>
                            <a href="/" class="falseBtn ms-1" >Clear</a>
                        </form>
                    </div>
                    <div class="container-fluid px-5">
                        <table class="table table-hover table-responsive mt-3" style="vertical-align:middle;">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Fullname</th>
                                    <th>Email</th>
                                    <th>Mobile</th>
                                    <th>Total orders</th>
                                    <th>Transactions</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try{
                                        String username = request.getParameter("username");
                                        Crud c = new Crud("root","");
                                        String query = "SELECT * FROM `users` WHERE `uType`='user'";
                                        if(username != null && !username.isEmpty()){
                                          query+=" AND fullname LIKE '%"+username+"%'";
                                        }
                                        ResultSet data = c.getData(query);
                                        while(data.next()){
                                            int uid = data.getInt("uid"),totalOrders = 0,amount=0;
                                            boolean isValid = data.getInt("isVerified")!=0;
                                            ResultSet orderData = c.getData("SELECT COUNT(*) AS totalorders,SUM(amount) AS amt FROM `orders` WHERE `uid`="+uid);
                                            if(orderData.next()){
                                                totalOrders = orderData.getInt("totalorders");
                                                amount = orderData.getInt("amt");
                                            }
                                            %>
                                            <tr>
                                                <td><%=uid%></td>
                                                <td><%=data.getString("fname")%></td>
                                                <td><%=data.getString("email")%></td>
                                                <td><%=data.getLong("mob")%></td>
                                                <td><%=totalOrders%></td>
                                                <td>₹<%=amount%></td>
                                                <td>
                                                    <form method="POST" action="/changeAccess">
                                                        <input type="hidden" name="userId" value="<%=uid%>" />
                                                        <input type="hidden" name="accessvalue" value="<%=isValid ? 0 : 1%>" />
                                                        <button type="submit" class="lightBtn"><%=isValid ? "Block" : "Unblock"%></button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <%
                                        }
                                    }catch(Exception err){
                                        out.print(err.getMessage());
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
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
        <jsp:include page="components/addProductModal.jsp"></jsp:include>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/formvalidation.js"></script>
    </body>
</html>
