<%-- 
    Document   : cartModal
    Created on : 30-Jun-2023, 6:02:02 pm
    Author     : SAYANDEEP
--%>
<%@page import="kgs.Crud,java.sql.*,java.util.ArrayList" contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uid = request.getParameter("userId");
%>
<div class="modal fade" id="cartModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="cartLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cartLabel">Your Cart</h5>
                <button type="button" id="modalClose" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body pb-4">
                <div class="w-100 m-0 container border-dark">
                    <%
                        try{
                            Crud c = new Crud("root","");
                            ResultSet data = c.getData("SELECT c.cid,p.* FROM CART c,products p WHERE c.pid=p.pid AND c.uid="+uid);
                            while(data.next()){
                                %>
                                    <jsp:include page="cartCard.jsp">
                                        <jsp:param name="cartId" value='<%= data.getInt("cid") %>' />
                                        <jsp:param name="imgLink" value='<%= data.getString("img") %>' />
                                        <jsp:param name="productName" value='<%= data.getString("name") %>' />
                                        <jsp:param name="price" value='<%= data.getFloat("price") %>' />
                                        <jsp:param name="stock" value='<%= data.getInt("stock") %>' />
                                    </jsp:include>
                                <%
                            }
                            
                        }catch(Exception err){
                            %><h4><%= err.getMessage() %></h4><%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>