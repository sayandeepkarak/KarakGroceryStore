<%-- 
    Document   : cartCard
    Created on : 30-Jun-2023, 8:30:29 pm
    Author     : SAYANDEEP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cartId = request.getParameter("cartId");
    String img = request.getParameter("imgLink");
    String name = request.getParameter("productName");
    String price = request.getParameter("price");
    int stock = Integer.parseInt(request.getParameter("stock"));
%>
<div class="card mb-3 w-100">
    <div class="row g-0">
        <div class="col-md-4">
            <img src="<%=img %>" class="img-fluid rounded-start h-100 w-auto" alt="...">
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <h5 class="card-title"><%= name %></h5>
                <p class="card-text">Price : ₹<%= price %></p>
                <form action="/checkout.jsp" method="POST">
                    <input type="hidden" name="cartId" value="<%= cartId %>" />
                    <%
                        if(stock>0){
                    %>
                        <label for="quantity" class="form-label">Quantity</label>
                        <select class="form-select" name="quantity" id="quantity" required>
                            <%
                                for(int i=1;i<=stock;i++){
                                    %>
                                        <option <%=i==1 ? "selected":""%>value="<%= i %>"><%= i %></option>
                                    <%
                                }
                            %>
                        </select>
                    <%
                        }else{
                            %><p class="text-danger">Out of stock</p><%
                        }
                    %>
                    <div class="mt-4">
                        <% if(stock>0){ %>
                            <button type="submit" class="lightBtn">Checkout</button>
                        <% } %>
                        <a href="/removeFromCart?cartId=<%=cartId %>" class="falseBtn">Remove</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>