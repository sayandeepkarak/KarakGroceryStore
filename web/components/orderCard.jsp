<%-- 
    Document   : orderCard
    Created on : 02-Jul-2023, 6:52:37 pm
    Author     : SAYANDEEP
--%>

<%@page contentType="text/html" import="java.time.LocalDate" pageEncoding="UTF-8"%>
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
    LocalDate orderDate =LocalDate.parse(request.getParameter("orderDate"));
    LocalDate recDate = orderDate.plusDays(3);
    int status = Integer.valueOf(request.getParameter("status"));
    String[] statusTxt = {"Ordered","Shipped","Out for deliver","Delivered"};
%>
<div class="card mb-3 w-100">
    <div class="row g-0">
        <div class="col-md-4 d-flex align-items-center">
            <img src="<%=img%>" class="img-fluid rounded-start h-auto w-100" alt="...">
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <p class="card-text fw-bold">OrderId : <%=oid%>&nbsp;</p>
                <p><b>Placed</b> <%=orderDate%>&nbsp;&nbsp;<b>Recieve</b> <%=recDate%></p>
                <p class="card-text"><%=productName%><br/>Quantity : <%=qty%>&nbsp;&nbsp;<b>Total : ₹<%=total%></b></p>
                <p class="d-inline-block m-0">SHIP TO <%=recName%><br/><%=land%>,<%=address%>,Zip-<%=zip%></p>
                <p class="fw-normal text-success"><%=statusTxt[status-1]%></p>
                <%
                    if(status<3){
                        %>
                            <form action="/cancelOrder" method="POST">
                                <input type="hidden" name="orderId" value="<%=oid%>" /> 
                                <div class="mt-4">
                                    <button type="submit" class="lightBtn">Cancel order</button>
                                </div>
                            </form>
                        <%
                    }
                %>
            </div>
        </div>
    </div>
</div>

