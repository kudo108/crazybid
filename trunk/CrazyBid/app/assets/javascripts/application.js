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
    if(pathname.substr(0,7) =="/helps/"){
        $("#navigator-bar li").attr("class","");
        $("#help").attr("class","active");
    }
    $("#login-in-top").bind("click",function(){
        $("#register_form").hide();
        $("#login_form").slideToggle("slow"); 
        
    });
    $("#register-in-top").bind("click",function(){
        $("#login_form").hide();
        $("#register_form").slideToggle("slow");
         
    });
});

