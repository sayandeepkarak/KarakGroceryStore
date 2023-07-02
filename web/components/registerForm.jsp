<form action="/register" method="POST" class="needs-validation" id="registerForm" novalidate>
  <div class="mb-4">
    <label for="fname" class="form-label">Fullname</label>
    <input type="text" class="form-control" name="fname" id="fname" minlength="7" maxlength="40" required />
    <div class="invalid-feedback">Name must be 7 characters</div>
  </div>
  <div class="mb-4">
    <label for="email" class="form-label">Email</label>
    <input type="email" class="form-control" id="email" name="email" required />
    <div class="invalid-feedback">Invalid email</div>
  </div>
  <div class="mb-4">
    <label for="mobile" class="form-label">Mobile</label>
    <input type="number" class="form-control" id="mobile" name="mobile" minlength="10" maxlength="10" required />
    <div class="invalid-feedback">Invalid mobile</div>
  </div>
  <div class="mb-4">
    <label for="password" class="form-label">Password</label>
    <input type="password" class="form-control" id="password" name="password" minlength="8" required />
    <div class="invalid-feedback">Invalid password</div>
  </div>
  <div class="mb-4">
    <label for="address" class="form-label">Address</label>
    <textarea type="mobile" class="form-control" id="address" name="address" required></textarea>
    <div class="invalid-feedback">Invalid address</div>
  </div>
  <div class="col-12">
    <button class="btn btn-dark w-100" type="submit">Register</button>
  </div>
</form>