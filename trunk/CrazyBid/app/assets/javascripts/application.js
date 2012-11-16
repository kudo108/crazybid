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
$(document).ready(function(){
    var pathname = document.location.pathname;
    if(pathname =="/") {
        $("#navigator-bar li").attr("class","");
        $("#home").attr("class","active");
    }
    if(pathname.substr(0,6) =="/bids/"){
        $("#navigator-bar li").attr("class","");
        $("#auctions").attr("class","active");
    }
    /*$("#navigator-bar li").bind("click",function(){
    if($(this).attr("id")!="logo"){
      $("#navigator-bar li").attr("class","");
      $(this).attr("class","active");}
    });*/
});

