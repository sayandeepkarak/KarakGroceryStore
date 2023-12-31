<%-- 
    Document   : productCard
    Created on : 30-Jun-2023, 5:43:11 pm
    Author     : SAYANDEEP
--%>
<% 
    boolean isVerified=Boolean.parseBoolean(request.getParameter("isVerified")); 
    String name = request.getParameter("prodName");
    String price =request.getParameter("price");
    String img =request.getParameter("imgLink");
    String uid =request.getParameter("userId");
    String pid =request.getParameter("productId");
    int stock =Integer.parseInt(request.getParameter("stock"));
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card" style="width: 18rem; height:min-content; margin-bottom: 15px;">
   <img src="<%= img %>" class="card-img-top" alt="x">
   <div class="card-body">
        <p class="card-title"><%=name %></p>
        <h4 class="card-text">₹<%=price %></h4>
        <%= stock>0 ? "<p>FREE delivery</p>" : "<p class='text-danger'>Out of stock</p>" %>
        <form method="POST" action="addToCart">
            <%
                if(isVerified){
                     %>
                         <input type="hidden" value="<%=uid %>" name="userId" />
                         <input type="hidden" value="<%=pid %>" name="productId" />
                     <%
                }
            %>
            <% if(stock>0){ %>
            <button class="lightBtn" <%= !isVerified ? "type='button' data-bs-toggle='modal' data-bs-target='#loginModal'" : "type='submit'" %>>Add to cart</button>
            <% } %>
        </form>
   </div>
</div>
