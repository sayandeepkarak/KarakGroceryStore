<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Authentication</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body pb-4">
                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                    <li class="nav-item w-50" role="presentation">
                        <button class="nav-link w-100 active" id="pills-login-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-login" type="button" role="tab" aria-controls="pills-home"
                            aria-selected="true">Login</button>
                    </li>
                    <li class="nav-item w-50" role="presentation">
                        <button class="nav-link w-100" id="pills-signup-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-signup" type="button" role="tab" aria-controls="pills-profile"
                            aria-selected="false">Signup</button>
                    </li>
                </ul>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-login" role="tabpanel"
                        aria-labelledby="pills-login-tab">
                        <jsp:include page="loginForm.jsp"></jsp:include>
                    </div>
                    <div class="tab-pane fade" id="pills-signup" role="tabpanel" aria-labelledby="pills-signup-tab">
                        <jsp:include page="registerForm.jsp"></jsp:include>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>