 var resize_win = function(){
     $('#page1,#page2').css('height' , $(window).height() + 'px');
  }
 var resize_body = function(){
     $('.vlist_layout').css('height' , $('body').outerHeight() + 'px');

 }
jQuery(function($){

  $('.vlist_layout').click(function(){
         $(this).hide();
       });
       $('#go_page2').click(function(){

             $('html,body').animate({scrollTop: $('#page2').offset().top}, 800);
      });

            $('.one').hide()
            $('#init').show();
            $('#noneed').hide();
            $('.two').hide();

            $('#all').click( function(){
              $('.one , .two , #init').hide();

              $('#noneed').show();
              $('.vlist li').remove();

              var a=0;
              var b=0;
              while ( a < 2 ){
                if( b == 4 ){ b = 0 };
                while( b < 4 ){
                  $.get("/vegetable_list/"+a+"_"+b , function(content){
                      var temp = $(content);
                      $('.vlist').append(temp).parent().show();
                      $('#plzselectlft').hide();
                  });
                  b++;
                }
                a++;
              }
              resize_body();
            });

            $('#vege').click( function(){
              $('.one , #init , #noneed').hide();
              $('.two').show();
              
              $('#mush').unbind('click').click( function(){
                  $.get('/vegetable_list/0_0' , function(content){
                      var temp = $(content);
                      $('.vlist li').each( function(){
                          $(this).remove();
                      });
                      $('.vlist').append(temp).parent().show();
                      $('#plzselectlft').hide();
                  });
              resize_body();
              });

              $('#leaf').unbind('click').click( function(){
                  $.get('/vegetable_list/0_1', function(content){
                      var temp = $(content);
                      $('.vlist li').each( function(){
                          $(this).remove();
                      });
                      $('.vlist').append(temp).parent().show();
                      $('#plzselectlft').hide();
                  });
                  resize_body();
              });

              $('#seed').unbind('click').click( function(){
                  $.get('/vegetable_list/0_2', function(content){
                      var temp = $(content);
                      $('.vlist li').each( function(){
                          $(this).remove();
                      });
                      $('.vlist').append(temp).parent().show();
                      $('#plzselectlft').hide();
                  });
                  resize_body();
              });
              resize_body();
            });

            $('#rhizome').click( function(){
                  $.get('/vegetable_list/0_3', function(content){
                      var temp = $(content);
                      $('.vlist li').each( function(){
                          $(this).remove();
                      });
                      $('.vlist').append(temp).parent().show();
                      $('#plzselectlft').hide();
                  });
                  resize_body();
              });

            $('#fruit').click( function(){
              $('.two').hide();
              $('.one').show();
              $('#init').hide();
              $('#noneed').hide();

              $('#sun').unbind('click').click( function(){
                $.get('/vegetable_list/1_0', function(content){
                      var temp = $(content);
                      $('.vlist li').each( function(){
                          $(this).remove();
                      });
                      $('.vlist').append(temp).parent().show();
                      $('#plzselectlft').hide();
                  });
                resize_body();
                });

              $('#ka').unbind('click').click( function(){
                $.get('/vegetable_list/1_1', function(content){
                      var temp = $(content);
                      $('.vlist li').each( function(){
                          $(this).remove();
                      });
                      $('.vlist').append(temp).parent().show();
                      $('#plzselectlft').hide();
                  });
                resize_body();
                });

              $('#syu').unbind('click').click( function(){
                $.get('/vegetable_list/1_2', function(content){
                      var temp = $(content);
                      $('.vlist li').each( function(){
                          $(this).remove();
                      });
                      $('.vlist').append(temp).parent().show();
                      $('#plzselectlft').hide();
                  });
                resize_body();
                });

              $('#tou').unbind('click').click( function(){
                $.get('/vegetable_list/1_3', function(content){
                      var temp = $(content);
                      $('.vlist li').each( function(){
                          $(this).remove();
                      });
                      $('.vlist').append(temp).parent().show();
                      $('#plzselectlft').hide();
                  });
                resize_body();
                });
                resize_body();
            });
       $(window).resize(resize_win);
       resize_win();
      // resize_body();
});
            
