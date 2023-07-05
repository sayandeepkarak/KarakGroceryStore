<%-- 
    Document   : checkoutForm
    Created on : 02-Jul-2023, 12:34:38 pm
    Author     : SAYANDEEP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("name");
    String mobile = request.getParameter("mobile");
    String address = request.getParameter("address");
    String cid = request.getParameter("cartId");
    String pid = request.getParameter("productId");
    String uid = request.getParameter("userId");
    int qty = Integer.parseInt(request.getParameter("quantity"));
%>
<form action="/placeorder" method="POST" class="needs-validation" novalidate>
    <input type="hidden" name="cid" value="<%=cid%>" />
    <input type="hidden" name="quantity" value="<%=qty%>" />
    <div class="row g-3">
        <div class="col-sm-6">
            <label for="fullName" class="form-label">Fullname</label>
            <input type="text" class="form-control" name="fullName" id="fullName" value="<%=name%>" disabled required>
            <div class="invalid-feedback">Please enter reciever's name</div>
        </div>
        <div class="col-sm-6">
            <label for="mobile" class="form-label">Contact no.</label>
            <input type="number" class="form-control" name="contact" id="mobile" value="<%=mobile%>" min="6000000000" max="9999999999" required>
            <div class="invalid-feedback">Please enter a reachable number</div>
        </div>
        <div class="col-12">
            <label for="landmark" class="form-label">Landmark</label>
            <input type="text" class="form-control" name="landmark" id="landmark" required>
            <div class="invalid-feedback">Please enter your landmark</div>
        </div>
        <div class="col-md-9">
            <label for="address" class="form-label">Address</label>
            <input type="text" class="form-control" name="address" value="<%=address%>" id="address" required>
            <div class="invalid-feedback">Please enter your shipping address.</div>
        </div>
        <div class="col-md-3">
            <label for="zip" class="form-label">Zip</label>
            <input type="number" class="form-control" name="zip" id="zip" min="100000" max="999999" required>
            <div class="invalid-feedback">Zip code required.</div>
        </div>
    </div>
    <hr class="my-4">
    <div class="form-check">
        <input type="checkbox" class="form-check-input" id="same-address" required>
        <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
    </div>
    <hr class="my-4">
    <h4 class="mb-3">Payment</h4>
        <div class="my-3">
            <div class="form-check">
                <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
                <label class="form-check-label" for="credit">Cash on delivery</label>
            </div>
        </div>
        <hr class="my-4">
        <button class="w-100 lightBtn btn-lg" type="submit">Place your order</button>
</form>
