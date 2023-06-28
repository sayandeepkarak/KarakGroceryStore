<% boolean isVerified=Boolean.parseBoolean(request.getParameter("isVerified")); %>
    <nav class="navbar  navbar navbar-dark bg-dark">
        <div class="container-fluid px-5">
            <h5 class="navbar-brand mb-0 h1">Karak-Grocery-Store</h5>
            <div class="d-flex gap-1">
                <% if(isVerified){ %>
                    <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                        Cart
                    </button>
                    <% } %>
                        <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                            <%= isVerified ? "Logout" : "Login" %>
                        </button>
            </div>
        </div>
    </nav>