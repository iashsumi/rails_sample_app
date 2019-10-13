document.addEventListener('DOMContentLoaded', function() {
  let elems = document.querySelectorAll('.modal');
  M.Modal.init(elems, {});

  document.body.addEventListener('ajax:success', function(event) {
    let elems = document.querySelectorAll('.modal');
    M.Modal.init(elems, {});
  })
});