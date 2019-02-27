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

function ajax_get_url(){

  $.ajax({
      url : '/pages/ajax_get_url',
      type : 'post',
      data : {},
      success: function(response){
          var x = document.getElementsByClassName('plot-anchor') 
          var html = '<tr><td><img src="'+response[0]+'" </img></td></tr>';
          $(html).insertAfter(x[0]);
      },
      error:function(){
          alert("AJAX Failure.");
      }
  });

}

function add_tissue(){
  var x = document.getElementsByClassName('tissue-tr')
  var y = x.length + 1;
  var html = '<tr class="tissue-tr">' +
              '<td>' +
              '<span style="font-weight:bold;margin-right:5px;">Tissue '+ y.toString() +'</span>' +
              '<select style="width:200px;height:30px;font-size:20px;color:#888888;margin-top:5px;margin-bottom:10px;">' +
              '<option>Adipose Tissue</option>' +
              '<option>Adrenal Gland</option>' +
              '<option>Bladder</option>' +
              '<option>Blood</option>' +
              '<option>Blood Vessel</option>' +
              '<option>Brain</option>' +
              '<option>Breast</option>' +
              '<option>Cervix Uteri</option>' +
              '<option>Colon</option>' +
              '<option>Esophagus</option>' +
              '<option>Fallopian Tube</option>' +
              '<option>Heart</option>' +
              '<option>Kidney</option>' +
              '<option>Liver</option>' +
              '<option>Lung</option>' +
              '<option>Muscle</option>' +
              '<option>Nerve</option>' +
              '<option>Ovary</option>' +
              '<option>Pancreas</option>' +
              '<option>Pituitary</option>' +
              '<option>Prostate</option>' +
              '<option>Salivary Gland</option>' +
              '<option>Skin</option>' +
              '<option>Small Intestine</option>' +
              '<option>Spleen</option>' +
              '<option>Stomach</option>' +
              '<option>Testis</option>' +
              '<option>Thyroid</option>' +
              '<option>Uterus</option>' +
              '<option>Vagina</option>' +
              '</select>' +
              '</td></tr>'
  $(html).insertAfter(x[x.length-1]);
}
