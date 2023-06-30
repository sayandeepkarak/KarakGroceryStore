<% 
    boolean isVerified=Boolean.parseBoolean(request.getParameter("isVerified")); 
    String uid = request.getParameter("userId");
%>    
<nav class="navbar navbar-expand-sm navbar-dark bg-dark" aria-label="Third navbar example">
    <div class="container-fluid mx-4">
      <h5 class="navbar-brand mb-0 h1">Karak-Grocery-Store</h5>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarsExample03">
          <div class="d-flex gap-1">
                <% if(isVerified){ %>
                    <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#cartModal">
                        Cart
                    </button>
                    <form method="post" action="logout">
                        <button class="btn btn-light">Logout</button>
                    </form>
                <% }else{ %>
                    <button class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#loginModal">Login</button>
                    <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#signupModal">Signup</button>a
                <% } %>
          </div>
      </div>
    </div>
</nav>
<% if(!isVerified){ %>
    <jsp:include page="authModal.jsp"></jsp:include>
<% }else{ %>
    <jsp:include page="cartModal.jsp">
        <jsp:param name="userId" value="<%= uid %>" />
    </jsp:include>
<% } %>