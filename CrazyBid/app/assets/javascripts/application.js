// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
function displayPreview(files,obj)
  {
    curr_file_obj = $(obj);
    if(window.FileReader)
    {
      var reader = new FileReader();
      reader.onload = onFileLoad;
      reader.readAsDataURL(files[0]);
    }

  }
  $(document).ready(function(){
  	$('#upload').bind('click',function(){
  		var v = document.getElementById("image");
  		alert(v.value.substr(12));
  	})
  })
$('#uploadForm input').change(function(){
 $(this).parent().ajaxSubmit({
  beforeSubmit: function(a,f,o) {
   o.dataType = 'json';
  },
  complete: function(XMLHttpRequest, textStatus) {
   // XMLHttpRequest.responseText will contain the URL of the uploaded image.
   // Put it in an image element you create, or do with it what you will.
   // For example, if you have an image elemtn with id "my_image", then
   $('#image').attr('src', XMLHttpRequest.responseText);
   // Will set that image tag to display the uploaded image.
  },
 });
});