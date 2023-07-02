const forms = document.querySelectorAll(".needs-validation");
Array.prototype.slice.call(forms).forEach((form) => {
  form.onsubmit = (event) => {
    if (!form.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
    }
    form.classList.add("was-validated");
  };
});