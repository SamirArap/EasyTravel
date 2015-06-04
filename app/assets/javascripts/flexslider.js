$(function(){
  SyntaxHighlighter.all();
});
$(window).load(function(){
  $('.flexslider').flexslider({
    animation: "slide",
    animationLoop: true,
    itemWidth:250,
    itemMargin: 5,
    start: function(slider){
      $('body').removeClass('loading');
    }
  });
});