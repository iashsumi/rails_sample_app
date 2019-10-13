document.addEventListener('DOMContentLoaded', function() {
  let elems = document.querySelectorAll('.datepicker');
  M.Datepicker.init(elems, {
    yearRange: 100,
    i18n:{
        months:["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
        //...公式ドキュメントの[Datepicker Internationalization options]の項目を指定できます。
    },
    format: "yyyy-mm-dd"
  });
});