$(document).ready(function() {
  document.querySelectorAll(".delete").forEach(function(a) {
    a.addEventListener("ajax:success", function() {
      var td = a.parentNode;
      var tr = td.parentNode;
      tr.style.display = "none";
    });
  });
});
