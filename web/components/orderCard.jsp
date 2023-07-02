<%-- 
    Document   : orderCard
    Created on : 02-Jul-2023, 6:52:37 pm
    Author     : SAYANDEEP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int oid = Integer.parseInt(request.getParameter("orderId"));
    String productName = request.getParameter("productName");
    String img = request.getParameter("image");
    int qty = Integer.parseInt(request.getParameter("quantity"));
    int total = Integer.parseInt(request.getParameter("total"));
    String recName = request.getParameter("recieverName");
    String land = request.getParameter("landmark");
    String address = request.getParameter("address");
    int zip = Integer.parseInt(request.getParameter("zip"));
%>
<div class="card mb-3 w-100">
    <div class="row g-0">
        <div class="col-md-4">
            <img src="<%=img%>" class="img-fluid rounded-start h-100 w-auto" alt="...">
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <p class="card-text fw-bold">OrderId : <%=oid%></p>
                <p class="card-text"><%=productName%><br/>Quantity : <%=qty%><br/>Total : <%=total%></p>
                <p class="d-inline-block m-0"><%=recName%><br /><%=land%><br /><%=address%> Zip-<%=zip%></p>
                <p class="fw-normal text-success">Out for delivery</p>
                <form action="/cancelOrder" method="POST">
                    <input type="hidden" name="orderId" value="<%=oid%>" /> 
                    <div class="mt-4">
                        <button type="submit" class="btn btn-dark">Cancel order</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

