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

$(function() {
    $('#back-to-top').click(function(){
        $('body,html').animate({scrollTop:0},400);
        return false;
    });
    $('#FBlogout').click(function(){
    	FB.getLoginStatus(function(response) {
		  if (response.status === 'connected') {  
        loginProccess(); 
		  } else if (response.status === 'not_authorized') {
		  	FB.login();
		  } else {
		  	FB.login();
		  }
		 });

    	FB.Event.subscribe('auth.authResponseChange', function(response) {
	      if (response.status === 'connected') {  loginProccess(); } 
		});
    });

    $('#FBlogin a').click(function(){
      FB.logout();
    });

    $("#txt-search").focus(function() {
      $(this).animate({
        width: "600px",
      }, 500 );
    });
    $("#txt-search").blur(function() {
      if($("#TKresultajax:hover").length<1){
        $(this).animate({
          width: "200px",
        }, 300 ).val("Tìm kiếm");
        $("#TKresultajax").hide();
      }
    });
    $("#search").mouseleave(function() {
      $("#txt-search").blur();
    });
    $("#txt-search").keyup(function(){
      var key = $(this).val();
      if(key==""){$("#TKresultajax").hide();}
      else if($("#TKresultajax").is(':hidden')){$("#TKresultajax").fadeIn();}

      //BÌNH BẦU      
      $.getJSON('/binh_baus.json', function(result) {        
        var data = searchFromData(key,"TenBinhBau",result);        
        if(data.length==0){
          $("#TK_bb").html("");
          return;
        }        
        var items = [];
        items.push('<h3>Bình bầu</h3>');
        $.each(data, function(key, val) {
          items.push('<li><a href="/binh_baus/' + val.id + '">' + val.TenBinhBau + '</a></li>');          
        });
        $("#TK_bb").html(items);
      });

      //TRƯỜNG     
      $.getJSON('/truongs.json', function(result) {
        var data = searchFromData(key,"TenTruong",result); 
        if(data.length==0){
          $("#TK_tg").html("");
          return;
        }
        var items = [];
        items.push('<h3>Trường</h3>');
        $.each(data, function(key, val) {
          items.push('<li><a href="/truongs/' + val.id + '">' + val.TenTruong+ '</a></li>');
        });
        $("#TK_tg").html(items);
      });

      //TIÊU CHÍ     
      $.getJSON('/tieu_chis.json', function(result) {
        var data = searchFromData(key,"TenTieuChi",result); 
        if(data.length==0){
          $("#TK_tc").html("");
          return;
        }
        var items = [];
        items.push('<h3>Tiêu chí</h3>');
        $.each(data, function(key, val) {
          items.push('<li><a href="/tieu_chis/' + val.id + '">' + val.TenTieuChi + '</a></li>');
        });
        $("#TK_tc").html(items);
      });

    });

    //TRANG BÌNH BẦU

    // xem comment
    $('.a-button2').click(function (e) {
      var id = $(this).attr("id");
      var $this = $(this).parent().next();
      $.getJSON('/nhan_xets/'+id+'.json', function(result) {
          var items =[];
          if (result != ''){
            $.each(result, function(key, val) {
              items.push('<li><div class="author-avatar"><img src="https://graph.facebook.com/'+ val.MaUser +'/picture" alt=""></div><div class="comment-author">'+val.TenUser+'</div><div class="comment-for">viết về '+val.TenTruong+'</div><div class="comment-date">'+val.created_at+'</div><div class="comment-text">'+val.NoiDung+'</div><div class="seperator"></div></li>');
            });
          }
          else{
            items.push('<h5>Chưa có nhận xét nào</h5>');
            console.log('sads');
          }
          $this.find('#comment-list').html(items);
          $this.modal({
                opacity: 85,
                overlayClose: true,
                onOpen: function (dialog) {
                  dialog.overlay.fadeIn();
                  dialog.container.slideDown();
                  dialog.data.fadeIn();
                }
          });
      });
      return false;
    });
    //Comment tiêu chí
  $(document).on('click','#comment-form-tc > .field > .submit',function(){
    var noidung = $(this).parent().prev().find("textarea").val();
    var truong = $(this).parent().prev().prev().find("select option:selected").val();
    var id = $(this).attr("data-id");
    var $this = $(this);
    $this.next().text("Đang gửi comment").fadeIn();
    $.ajax({
          type: "POST",
          url: "/nhan_xets",
          data: { "nhan_xet[truong_id]": truong, "nhan_xet[chi_tiet_binh_bau_id]": id, "nhan_xet[NoiDung]": noidung }
          }).done(function(msg) {
            var val = jQuery.parseJSON(msg);
              $('ul#comment-list').append('<li><div class="author-avatar"><img src="https://graph.facebook.com/'+ val.MaUser +'/picture" alt=""></div><div class="comment-author">'+val.TenUser+'</div><div class="comment-for">viết về '+val.TenTruong+'</div><div class="comment-date">'+val.created_at+'</div><div class="comment-text">'+val.NoiDung+'</div><div class="seperator"></div></li>');
              $(".simplemodal-wrap").scrollTop($(".simplemodal-wrap")[0].scrollHeight);
              $('ul#comment-list >h5').hide();
              $this.next().fadeOut();
          }).fail(function() {
            $this.next().text("Bạn chưa nhập nội dung nhận xét").fadeIn();
          });
  });


//Comment tổng  quan
  $(document).on('click','#comment-form-tq > .field > .submit',function(){
    var noidung = $(this).parent().prev().find("textarea").val();
    var id = $(this).attr("data-id");
    var $this = $(this);
    var page_url = $(location).attr('href');
    $this.next().text("Đang gửi comment").fadeIn();
    $.ajax({
          type: "POST",
          url: "/nhan_xet_tqs",
          data: { "nhan_xet_tq[binh_bau_id]": id, "nhan_xet_tq[NoiDung]": noidung }
          }).done(function(msg) {
              var val = jQuery.parseJSON(msg);
              $('#ds-comment-tq').append('<li><div class="author-avatar"><img src="https://graph.facebook.com/'+ val.MaUser +'/picture" alt=""></div><div class="comment-author">'+val.TenUser+'</div><div class="comment-date">'+val.created_at+'</div><div class="comment-text">'+val.NoiDung+'</div><div class="seperator"></div></li>');
              $('#ds-comment-tq >h4').hide();
              $this.next().fadeOut();
              $("#ds-comment-tq").scrollTop($("#ds-comment-tq")[0].scrollHeight);
          }).fail(function() {
            $this.next().text("Bạn chưa nhập nội dung nhận xét").fadeIn();
          });
  });


  // hover đánh dấu sao
  $(document).on('mouseover','.list-truong li span',function(){    
      var index_hover = $(this).index();
      $(this).parent().find('span').each(function(i){
        if($(this).index()<index_hover+1){ $(this).addClass("cur");}
        else{ $(this).removeClass("cur");}
      });
    }).on('mouseout','.list-truong li span',function() {
      $(this).parent().find('span').each(function(i){
        $(this).parent().find('span').each(function(i){
          if(!$(this).hasClass('lock')){ $(this).removeClass("cur");}
          else{ $(this).addClass("cur");}
        });
      });
  });

  //sao click bình chọn
  $(document).on('click','.list-truong li span',function(){
    var item = $(this);
    var cttrg = item.parent().attr("cttrg");
    var sodiem = item.index()-1;
    var ctbb = item.parent().parent().attr("ctbb");
    var page_url = $(location).attr('href')+"?reload=true";    

    var reload = $("#reload-ctbb-"+ctbb);
    var wi = reload.width();
    var he = reload.height();
    reload.append('<div id="reload-process" style="background: rgba(255,255,255,0.3)"><span>Process...</span></div>');
    reload.find("#reload-process").width(wi).height(he);
    reload.find("#reload-process span").css("margin-top",he/2-40);

    //AJAX
    $.ajax({
      type: "POST",
      url: "/lich_su_binh_baus",
      data: { "lich_su_binh_bau[chi_tiet_truong_id]": cttrg, "lich_su_binh_bau[SoDiem]": sodiem }
    }).done(function(msg) { 
      reload.find("#reload-process span").text("Reload...");
      $("#reload-ctbb-"+ctbb+" .list-truong").load(page_url+" #reload-ctbb-"+ctbb+" .list-truong", function(){
        reload.find("#reload-process").fadeOut().remove(); 
      });                   
    }).fail(function() { 
      reload.find("#reload-process span")
      .css("background-image","url('/assets/ajax-error.png')")
      .text("Lỗi :(( Bình bầu thất bại!!!");
    });

  });

  if($("#errorpopup").text().length>0){
    var text_e = $("#errorpopup").text();
    $("#errorpopup").text("");
    $('body').append("<div id='ERfullscreen'><div id='ERtext'></div></div>");
    $('#ERfullscreen').width($(window).width()).height($(window).height());
    $('#ERtext').html("<h2>THÔNG BÁO</h2>"+text_e);
    setTimeout(function(){$("#ERfullscreen").fadeOut(500).remove();},2000);
  }
  $(window).resize(function() {
    $('#ERfullscreen').width($(window).width()).height($(window).height());   
  });

});


function searchFromData(searchquery,colname,data) {
  var returns = [];
  var dem=0;
  $.each(data,function(){
      dem = dem + 1 ;
      if(dem>5){return returns;}
      if(this[colname].toLowerCase().indexOf(searchquery.toLowerCase()) > -1){returns.push(this);}
  });
  return returns;
}

/* ------------------------------------------------------
  CODE FACEBOOK LOGIN
------------------------------------------------------ */

window.fbAsyncInit = function() {
    FB.init({
      appId      : '485604291512281', // App ID
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    }); 
    //Trường hợp thoát bên FB mà bên trang chưa thoát
    FB.getLoginStatus(function(response) {
      if (response.status === 'connected') {  
        
      } else if ($("#FBlogin").length != 0) {
        window.location.href = '/users?logout=true';
      }
    }); 
};

// Load the SDK asynchronously

(function(d){
   var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement('script'); js.id = id; js.async = true;
   js.src = "//connect.facebook.net/en_US/all.js";
   ref.parentNode.insertBefore(js, ref);
}(document));

function loginProccess() {
    FB.api('/me?fields=id,name,picture', function(response) {
    	//TẠO TÀI KHOẢN Ở ĐÂY    
    	$('#user_MaUser').val(response.id);
    	$('#user_Active').val(1);
      $('#user_Name').val(response.name);
      $('#user_Image').val(response.picture.data.url);
    	$('#new_user').submit(); 
    });
}
