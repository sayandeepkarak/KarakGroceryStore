<% 
    boolean isVerified = Boolean.parseBoolean(request.getParameter("isVerified")); 
    String uid = request.getParameter("userId");
    boolean showCart = Boolean.parseBoolean(request.getParameter("showCart"));
%>    
<nav class="navbar navbar-expand-sm navbar-dark bg-dark" aria-label="Third navbar example">
    <div class="container-fluid mx-4">
      <h5 class="navbar-brand mb-0 h1">Karak-Grocery-Store</h5>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarsExample03">
          <% if(!isVerified){ %>
            <div class="d-flex gap-1">
                <button class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#loginModal">Login</button>
                <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#signupModal">Signup</button>
            </div>
          <% }else{ %>
            <div class="flex-shrink-0 dropdown">
              <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
              </a>
              <ul class="dropdown-menu text-small shadow dropdown-menu-end" aria-labelledby="dropdownUser2">
                <% if(showCart){ %>
                  <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#cartModal">Cart</a></li>
                  <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#orderModal">Orders</a></li>
                <% } %>
                <li><hr class="dropdown-divider"></li>
                <li>
                  <form method="post" action="logout">
                      <button class="dropdown-item">Logout</button>
                  </form>
                </li>
              </ul>
            </div>
          <% } %>
      </div>
    </div>
    <% if(!isVerified){ %>
        <jsp:include page="authModal.jsp"></jsp:include>
    <% }else{ %>
        <jsp:include page="cartModal.jsp">
            <jsp:param name="userId" value="<%= uid %>" />
        </jsp:include>
        <jsp:include page="orderModal.jsp"></jsp:include>
    <% } %>
</nav>