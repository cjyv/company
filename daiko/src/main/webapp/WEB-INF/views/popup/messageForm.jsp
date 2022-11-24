<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"/>
    <script src="https://code.jquery.com/jquery-1.8.3.min.js" integrity="sha256-YcbK69I5IXQftf/mYD8WY0/KmEDCv1asggHpJk1trM8=" crossorigin="anonymous"></script>

    <style>
        .chat_wrap { border:1px solid #999; width:100%;height : 100%; padding:3px; font-size:13px; color:#333}
        .chat_wrap .inner{background-color:#acc2d2; border-radius:5px; padding:10px; overflow-y:scroll;height: 400px;}
        .chat_wrap .item{margin-top:15px}
        .chat_wrap .item:first-child{margin-top:0px}
        .chat_wrap .item .box{display:inline-block; max-width:180px; position:relative}
        .chat_wrap .item .box::before{content:""; position:absolute; left:-8px; top:9px; border-top:0px solid transparent; border-bottom:8px solid transparent;border-right:8px solid #fff;}
        .chat_wrap .item .box .msg {background:#fff; border-radius:10px; padding:8px; text-align:left}
        .chat_wrap .item .box .time {font-size:11px; color:#999; position:absolute; right: -75px; bottom:5px; width:70px}
        .chat_wrap .item.mymsg{text-align:right}
        .chat_wrap .item.mymsg .box::before{left:auto; right:-8px; border-left:8px solid #fee600; border-right:0;}
        .chat_wrap .item.mymsg .box .msg{background:#fee600}
        .chat_wrap .item.mymsg .box .time{right:auto; left:-75px}
        .chat_wrap .item .box{transition:all .3s ease-out; margin:0 0 0 20px;opacity:0}
        .chat_wrap .item.mymsg .box{transition:all .3s ease-out; margin:0 20px 0 0;}
        .chat_wrap .item.on .box{margin:0; opacity: 1;}

        input[type="text"]{border:0; width:100%;background:#ddd; border-radius:5px; height:30px; padding-left:5px; box-sizing:border-box; margin-top:5px}
        input[type="text"]::placeholder{color:#999}
    </style>
    <script>
    function messageList(b_e_number){
    	fetch("messageList?b_e_number="+b_e_number)
    	.then(function(res) {
    		return res.json();
    	})
    	.then(function(res) {
  
    		 
    		for (var i = 0; i < res.length; i++) {
    			if (res[i].b_e_number==b_e_number) {
    		
                    var _tar = $(".chat_wrap .inner").append('<div class="item mymsg"><div class="box"><p class="msg">'+res[i].message+'</p></div><img style="width=50px;height:30px;" src="resources/img/'+res[i].profile+'"></div>');
                    var lastItem = $(".chat_wrap .inner").find(".item");
                    setTimeout(function(){
                        lastItem.addClass("on");
                    },10);
					
    			}else{
    				var _tar = $(".chat_wrap .inner").append('<div class="item box message"><img style="width=50px;height:30px;" src="resources/img/'+res[i].profile+'"><div class="box"><p class="msg">'+res[i].message+'</p></div></div>');
                    var lastItem = $(".chat_wrap .inner").find(".item");
                    setTimeout(function(){
                        lastItem.addClass("on");
                    },10);
    			}
                    var position = lastItem.position().top + $(".chat_wrap .inner").scrollTop();
                

                    $(".chat_wrap .inner").scrollTop($('.chat_wrap .inner')[0].scrollHeight);;
    		
    		}
    			
    	});

       
 

    
    }
        
    </script>
    

    
</head>
<body onload="messageList(${b_e_number})">
    <div class="chat_wrap">
        <div class="inner">
            
            <!-- <div class="item">
                <div class="box">
                    <p class="msg">안녕하세요</p>
                    <span class="time">오전 10:05</span>
                </div>
            </div>

            <div class="item mymsg">
                <div class="box">
                    <p class="msg">안녕하세요</p>
                    <span class="time">오전 10:05</span>
                </div>
            </div> -->
           
        </div>

        <input type="text" class="mymsg" id="message" placeholder="内容">
      	<input type="hidden" id="b_e_number" value="${b_e_number }">
      	<input type="hidden" id="profilePhoto" value="${profilePhoto }">
    </div>
    <script type="text/javascript">
    $(function(){
        $("input[type='text']").keypress(function(e){
            if(e.keyCode == 13 && $(this).val().length){
                var message = $(this).val();
                var b_e_number= document.getElementById("b_e_number").value;
                var profilePhoto= document.getElementById("profilePhoto").value;
                fetch("messageInsert",{
           		 method: 'post',
           		    body: JSON.stringify({
           		        "b_e_number": b_e_number,
           		       "message" : message
           		    }),
           		    headers:{
           		    	'Content-Type' : 'application/json'
           		    }
           	}).then(function(res) {
           	 return	res.json();
           	}).then(function(res) {
           	})
            $(this).val('');
                var _tar = $(".chat_wrap .inner").append('<div class="item mymsg"><div class="box"><p class="msg">'+message+'</p></div><img style="width=50px;height:30px;" src="resources/img/'+profilePhoto+'"></div>');

                var lastItem = $(".chat_wrap .inner").find(".item:last");
                setTimeout(function(){
                    lastItem.addClass("on");
                },10);
                var position = lastItem.position().top + $(".chat_wrap .inner").scrollTop();
           

                $(".chat_wrap .inner").stop().animate({scrollTop:position},500);
            }
        });
    });
    
    
    </script>
    
</body>
</html>