<%-- Document : index Created on : 28-Jun-2023, 10:14:24 am Author : SAYANDEEP --%>

  <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <script src="js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
      <jsp:include page="components/navbar.jsp">
        <jsp:param name="isVerified" value="true"></jsp:param>
      </jsp:include>
      <jsp:include page="components/authModal.jsp"></jsp:include>
      <jsp:include page="components/carosoul.jsp"></jsp:include>
      <div class="container-fluid d-flex justify-content-sm-between align-items-center flex-wrap w-100 py-3 px-5">
        <h5>Products</h5>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-dark">Search</button>
        </form>
      </div>
      <div class="container-fluid d-flex justify-content-between   flex-wrap w-100 py-3 px-5 gap-2">
        <div class="card" style="width: 18rem;">
          <img src="https://m.media-amazon.com/images/I/51SW5iGfKpL._SX425_.jpg" class="card-img-top" alt="x">
          <div class="card-body">
            <p class="card-title">Fortune Oil, 1 L Pouch Rice Bran Health</p>
            <h4 class="card-text">₹280</h4>
            <p>FREE delivery</p>
            <a href="#" class="btn btn-dark">Add to cart</a>
          </div>
        </div>
        <div class="card" style="width: 18rem;">
          <img src="https://m.media-amazon.com/images/I/51SW5iGfKpL._SX425_.jpg" class="card-img-top" alt="x">
          <div class="card-body">
            <p class="card-title">Fortune Oil, 1 L Pouch Rice Bran Health</p>
            <h4 class="card-text">₹280</h4>
            <p>FREE delivery</p>
            <a href="#" class="btn btn-dark">Add to cart</a>
          </div>
        </div>
        <div class="card" style="width: 18rem;">
          <img src="https://m.media-amazon.com/images/I/51SW5iGfKpL._SX425_.jpg" class="card-img-top" alt="x">
          <div class="card-body">
            <p class="card-title">Fortune Oil, 1 L Pouch Rice Bran Health</p>
            <h4 class="card-text">₹280</h4>
            <p>FREE delivery</p>
            <a href="#" class="btn btn-dark">Add to cart</a>
          </div>
        </div>
        <div class="card" style="width: 18rem;">
          <img src="https://m.media-amazon.com/images/I/51SW5iGfKpL._SX425_.jpg" class="card-img-top" alt="x">
          <div class="card-body">
            <p class="card-title">Fortune Oil, 1 L Pouch Rice Bran Health</p>
            <h4 class="card-text">₹280</h4>
            <p>FREE delivery</p>
            <a href="#" class="btn btn-dark">Add to cart</a>
          </div>
        </div>
        <div class="card" style="width: 18rem;">
          <img src="https://m.media-amazon.com/images/I/51SW5iGfKpL._SX425_.jpg" class="card-img-top" alt="x">
          <div class="card-body">
            <p class="card-title">Fortune Oil, 1 L Pouch Rice Bran Health</p>
            <h4 class="card-text">₹280</h4>
            <p>FREE delivery</p>
            <a href="#" class="btn btn-dark">Add to cart</a>
          </div>
        </div>

      </div>
      <script src="js/bootstrap.min.js"></script>
    </body>

    </html>