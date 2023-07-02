<form method="POST" action="/login" class="needs-validation" novalidate>
    <div class="mb-4">
        <label for="loginEmail" class="form-label">Email</label>
        <input type="email" class="form-control" id="loginEmail" name="loginEmail" required>
        <div class="invalid-feedback">
            Invalid email
        </div>
    </div>
    <div class="mb-4">
        <label for="loginPass" class="form-label">Password</label>
        <input type="password" class="form-control" id="loginPass" name="loginPass" minlength="8" required>
        <div class="invalid-feedback">
            Invalid password
        </div>
    </div>
    <div class="col-12">
        <button class="btn btn-dark w-100" type="submit">Login</button>
    </div>
</form>