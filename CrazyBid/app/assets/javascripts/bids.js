$(document).ready(function(){
	var slides = $('.nthslide');
	var numOfSlide = slides.length;
	var widthOfSlide = 928;
	var position = 0;
	$(".wrap-inner").css('width',widthOfSlide*numOfSlide);
	$("#next").bind("click",function(){
		if(position<(numOfSlide-1)){
			position++;
			$('.wrap-inner').animate({
				'margin-left':-position*widthOfSlide
			})
		}
	});
	$("#prev").bind("click",function(){
		if(position>0){
			position--;
			$('.wrap-inner').animate({
				'margin-left':-position*widthOfSlide
			})
		}
	});
})