<%-- 
    Document   : addProductForm
    Created on : 04-Jul-2023, 6:45:56 am
    Author     : SAYANDEEP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form method="POST" action="/addProduct"  class="needs-validation" novalidate>
    <div class="mb-4">
        <label for="pName" class="form-label">Name</label>
        <input type="text" class="form-control" id="pName" name="pName" required>
        <div class="invalid-feedback">
            Please enter product name
        </div>
    </div>
    <div class="mb-4">
        <label for="price" class="form-label">Price</label>
        <input type="number" class="form-control" id="price" name="price" min="1" required>
        <div class="invalid-feedback">
            Invalid price
        </div>
    </div>
    <div class="mb-4">
        <label for="stock" class="form-label">Stock</label>
        <input type="number" class="form-control" id="stock" name="stock" min="1" required>
        <div class="invalid-feedback">
            Invalid stock
        </div>
    </div>
    <div class="mb-4">
        <label for="image" class="form-label">Image url</label>
        <input type="text" class="form-control" id="image" name="image" required>
        <div class="invalid-feedback">
            Invalid Image url
        </div>
    </div>
    <div class="col-12">
        <button class="lightBtn w-100" type="submit">Add</button>
    </div>
</form>
