"use strict";

(function(){

  function bpush_loader() {
    if ( typeof(document.readyState) === "undefined" ) {
      return;
    }
    if ( document.readyState === "complete" ) {
      bpush_execute_loading();
    } else {
      setTimeout(bpush_loader, 10);
    }
  }

  function bpush_execute_loading() {
    var iframe = document.createElement('iframe');
    iframe.src = '/bpush.html';
    iframe.style.display = "none";
    document.body.appendChild(iframe);
  }

  bpush_loader();
})();


