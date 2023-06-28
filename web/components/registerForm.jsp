<form class="needs-validation was-validated">
  <div class="mb-4">
    <label for="fname" class="form-label">Fullname</label>
    <input type="text" class="form-control" id="fname" minlength="7" maxlength="40" required>
    <div class="invalid-feedback">
      Name must be 7 characters
    </div>
  </div>
  <div class="mb-4">
    <label for="email" class="form-label">Email</label>
    <input type="email" class="form-control" id="email" required>
    <div class="invalid-feedback">
      Invalid email
    </div>
  </div>
  <div class="mb-4">
    <label for="mobile" class="form-label">Mobile</label>
    <input type="number" class="form-control" id="mobile" minlength="10" maxlength="10" required>
    <div class="invalid-feedback">
      Invalid mobile
    </div>
  </div>
  <div class="mb-4">
    <label for="address" class="form-label">Address</label>
    <textarea type="mobile" class="form-control" id="address" required></textarea>
    <div class="invalid-feedback">
      Invalid address
    </div>
  </div>
  <div class="col-12">
    <button class="btn btn-dark w-100" type="submit">Register</button>
  </div>
</form>