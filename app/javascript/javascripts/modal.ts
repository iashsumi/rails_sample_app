document.addEventListener('DOMContentLoaded', function() {
  let elems = document.querySelectorAll('.modal');
  M.Modal.init(elems, {});

  // 初期化
  document.body.addEventListener('ajax:success', function(event) {
    let elems = document.querySelectorAll('.modal');
    M.Modal.init(elems, {});
  });

  // 初期化
  document.getElementById('paginator').addEventListener('ajax:success', function(event) {
    let elems = document.querySelectorAll('.modal');
    M.Modal.init(elems, {});
  });

  const el = document.getElementById('search_result')
  const observer = new MutationObserver(function(){
    /** DOMの変化が起こった時の処理 */
    document.getElementById('paginator').addEventListener('ajax:success', function(event) {
      let elems = document.querySelectorAll('.modal');
      M.Modal.init(elems, {});
    });
  });

  const config = { 
    attributes: true, 
    childList: true, 
    characterData: true 
  };
  
  /** 要素の変化監視をスタート */
  observer.observe(el, config);
});