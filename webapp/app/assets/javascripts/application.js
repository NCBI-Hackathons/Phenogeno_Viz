// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require turbolinks
//= require jquery3
//= require jquery_ujs
//= require jquery-ui
//= require_tree .

function ajax_test(){

  $.ajax({
      url : '/pages/ajax_test',
      type : 'post',
      data : {},
      success: function(response){
          var x = document.getElementsByClassName('title') 
          var html = '<div>'+response[0]+'</div>';
          $(html).insertAfter(x[0]);
      },
      error:function(){
          alert("AJAX Failure.");
      }
  });

}
