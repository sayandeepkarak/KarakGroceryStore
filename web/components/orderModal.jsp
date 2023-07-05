<%-- 
    Document   : orderModal
    Created on : 02-Jul-2023, 6:48:46 pm
    Author     : SAYANDEEP
--%>

<%@page contentType="text/html" import="java.sql.ResultSet,kgs.Crud" pageEncoding="UTF-8"%>

<div class="modal fade" id="orderModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="cartLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cartLabel">Your Orders</h5>
                <button type="button" id="modalClose" class="btn-close" data-bs-dismiss="modal"aria-label="Close"></button>
            </div>
            <div class="modal-body pb-4">
                <div class="w-100 m-0 container border-dark">
                    <%
                        try{
                            Crud c = new Crud("root","");
                            ResultSet data = c.getData("SELECT o.*,p.*,u.* FROM orders o,products p,users u WHERE o.uid=u.uid AND o.pid=p.pid AND o.uid=1 order by o.oid desc");
                            while(data.next()){
                                %>
                                    <jsp:include page="orderCard.jsp">
                                        <jsp:param name="orderId" value='<%=data.getInt("oid")%>' />
                                        <jsp:param name="productName" value='<%=data.getString("name")%>' />
                                        <jsp:param name="image" value='<%=data.getString("img")%>' />
                                        <jsp:param name="quantity" value='<%=data.getInt("qty")%>' />
                                        <jsp:param name="total" value='<%=data.getInt("amount")%>' />
                                        <jsp:param name="recieverName" value='<%=data.getString("fname")%>' />
                                        <jsp:param name="landmark" value='<%=data.getString("landmark")%>' />
                                        <jsp:param name="address" value='<%=data.getString("address")%>' />
                                        <jsp:param name="zip" value='<%=data.getInt("zip")%>' />
                                        <jsp:param name="orderDate" value='<%=data.getDate("orderDate")%>' />
                                        <jsp:param name="status" value='<%=data.getInt("status")%>' />
                                    </jsp:include>  
                                <%
                            }
                        }catch(Exception err){
                            %><h4><%=err.getMessage()%></h4><%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>
