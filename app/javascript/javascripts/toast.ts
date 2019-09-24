document.addEventListener('DOMContentLoaded', function() {
  let success = document.querySelectorAll('#flash-success');
  success.forEach(element => {
    let text = (<HTMLElement>element).innerText
    if(text){
      M.toast({html: text, classes: 'rounded #42a5f5 blue lighten-1'});
    }
  });

  let danger = document.querySelectorAll('#flash-danger');
  danger.forEach(function(element) {
    let text = (<HTMLElement>element).innerText
    if(text){
      M.toast({html: text, classes: 'rounded f44336 red'});
    }
  });
});
