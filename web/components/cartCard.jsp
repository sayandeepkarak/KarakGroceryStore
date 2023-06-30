<%-- 
    Document   : cartCard
    Created on : 30-Jun-2023, 8:30:29 pm
    Author     : SAYANDEEP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String img = request.getParameter("imgLink");
    String name = request.getParameter("productName");
    String price = request.getParameter("price");
%>
<div class="card mb-3 w-100">
    <div class="row g-0">
        <div class="col-md-4">
            <img src="<%= img %>" class="img-fluid rounded-start h-100 w-auto" alt="...">
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <h5 class="card-title"><%= name %></h5>
                <p class="card-text">Price : ₹<%= price %></p>
                <form>
                    <label for="quantity" class="form-label">Quantity</label>
                    <select class="form-select" id="quantity" required>
                        <option selected value="1">1</option>
                        <%
                            for(int i=2;i<=9;i++){
                                %>
                                    <option value="<%= i %>"><%= i %></option>
                                <%
                            }
                        %>
                    </select>
                    <div class="mt-4">
                        <button class="btn btn-dark">Checkout</button>
                        <a class="btn btn-outline-dark">Remove</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>