<%-- 
    Document   : addProductModal
    Created on : 04-Jul-2023, 6:44:02 am
    Author     : SAYANDEEP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="productModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="productLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="productLabel">New product</h5>
                <button type="button" id="modalClose" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body pb-4">
                <jsp:include page="addProductForm.jsp"></jsp:include>
            </div>
        </div>
    </div>
</div>
