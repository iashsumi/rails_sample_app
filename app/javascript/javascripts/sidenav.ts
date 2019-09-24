import * as M from 'materialize-css';
document.addEventListener('DOMContentLoaded', function() {
  let elems = document.querySelectorAll('.sidenav');
  M.Sidenav.init(elems, {draggable: true});
  let collapsibleElem = document.querySelectorAll('.collapsible');
  M.Collapsible.init(collapsibleElem, {});
});

