<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.board.example.dto.*" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	MemberDTO member = (MemberDTO) session.getAttribute("member");
%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여수관광문화</title>
    <!-- 파비콘-->
    <link rel="icon" type="image/png" sizes="32x32" href="/img/hd_logo.png">
    <!-- 메타포-->
    <meta name="title" content="여수 관광문화 홈페이지">
    <meta name="description" content="전라남도 여수시 관광안내, 관광명소, 문화유적, 축제문화행사, 숙박 등 정보 제공">
    <meta name="keywords" content="여수관광안내, 돌산갓김치, 게장백반, 서대회, 여수한정식, 갯장어회, 갯장어 샤브샤브, 굴구이, 장어구이, 갈치조림, 새조개샤브샤브, 전어회, 전어구이,오동도, 거문도,백도,향일암, 금오도비렁길, 비렁길, 여수세계박람회장, 진남관, 충무공, 이순신, 여수밤바다, 산단야경, 영취산, 영취산진달래, 진달래, 해상케이블카, 이순신대교, 거북선, 거북선축제, 국제청소년축제, 국제범선축제, 여자만, 여자만갯벌, 진달래체험,갯벌노을체험,향일암일출">
    <!-- 오픈그래프-->
    <meta property="og:url" content="http://www.yeosu.go.kr/tour/tour">
    <meta property="og:type" content="article">
    <meta property="og:image" content="http://www.yeosu.go.kr/contents/fb_ystour_logo.png">
    <meta property="og:site_name" content="여수관광문화">
    <meta property="og:article:author" content="https://www.facebook.com/goystour">
    <meta property="og:article:publisher" content="https://www.facebook.com/goystour">
    <meta property="og:article:thumbnailUrl" content="http://www.yeosu.go.kr/contents/fb_ystour_logo.png">
    <meta property="og:article:author" content="생명의 푸르름 가득한, 여수관광문화">
    <meta property="og:article:author:url" content="http://www.yeosu.go.kr/tour/">
    <!-- 폰트로딩-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Song+Myung:400" rel="stylesheet">
   <!-- 외부 스타일 연결-->
   <link rel="stylesheet" href="common.css">
   <link rel="stylesheet" href="grid.css">
   <link rel="stylesheet" href="jquery.bxslider/jquery.bxslider.css">

   <style>
    /*font-family: 'Noto Sans KR', sans-serif;*/
    /*font-family: 'East Sea Dokdo', sans-serif;*/

    /*font-family: 'Black Han Sans', sans-serif;*/
    /*font-family: 'Song Myung', sans-serif;*/
    /*font-family: 'East Sea Dokdo', sans-serif;*/

</style>
<style> 

    #item1 { background-image: url("./img/event1.jpg");}
    #item2 { background-image: url("./img/event2.jpg");}
    #item3 { background-image: url("./img/event3.jsp");}
    #item4 { background-image: url("./img/event4.jsp");}
    #item5 { background-image: url("./img/event5.jpg");}

   .content { clear:both; width: 100%; min-height:2000px; }   
    .vs { clear:both; width: 100%; position: relative; overflow-x:hidden; } 
    .vs .img_box { width: 400%;}
    .vs .img_box li { width: 25%; float:left; position:relative; } 
    .vs .img_box li a { display: block; position: relative; } 
    .vs .img_box li .vs_img { display:block; width: 100%; height:760px; margin: 0 auto; }
    .vs .img_box .tit_box { position:absolute; top: 28px; left: 0; z-index:10; 
    padding: 60px 280px; color: #fff; text-align: center; }
    .vs .img_box .vs_tit { font-size: 100px; font-family: 'Song Myung';
    font-weight: 200; text-shadow: 2px 2px 2px #333; }
    .vs .img_box .vs_com {font-size: 18px; text-shadow: -1px -1px 2px rgb(44, 44, 44);  }

    .btn_box li { display:none; } 
    .ra { display:none; }
    #ra1:checked ~ .btn_box li.item1 { display:block; }
    #ra2:checked ~ .btn_box li.item2 { display:block; }  
    #ra3:checked ~ .btn_box li.item3 { display:block; }  
    #ra4:checked ~ .btn_box li.item4 { display:block; }  

    .img_box { width: 400%; transition-duration: 2.2s; }
    .img_box li { width: 25%; float:left; }
    #ra1:checked ~ .img_box { margin-left: 0; }
    #ra2:checked ~ .img_box { margin-left:-100%; }
    #ra3:checked ~ .img_box { margin-left:-200%; }
    #ra4:checked ~ .img_box { margin-left:-300%; }
    .btn_box li label { display:block; width: 100px; height: 100px; position:absolute; 
        top:330px; z-index:10; text-indent:-10000px; background-repeat: no-repeat; }
    .btn_box li label.prev { left:60px; background-image: url(./img/le.png)}
    .btn_box li label.next { right:60px; background-image: url(./img/ri.png)}

   .donbag {display: block; clear: both; position: absolute; width: 300px; top: 600px; left: 50%; margin-left: 50px; margin-left: -160px; z-index: 100;} 

    #page1 { padding-top: 100px; position:relative; background-color: rgb(248, 186, 186); height: 800px; background-image: url(./img/dong_pn.png); }
    .pg_tit1 { font-family: 'Song Myung'; font-size: 50px; padding-bottom: 15px;  }
    #page2 { clear: both; width: 100%; height: 50vh; padding-top: 30px; background-color: rgb(127, 196, 136); background-image: url(./img/back1.png); }
    .more { display:block; background-image: url(./img/youtube.png); text-indent:-10000px; width: 300px; 
        background-repeat: no-repeat; background-position:center center; float: right; z-index:10; padding-top: 30px;}
    .youtube { clear: both;  width: 100%; padding-bottom: 50px; }
    .youtube2 { clear: both; float: left;}
    .youtube li { float: left; }
    .youtube li .v { width: 350px; height: 300px; padding: 25px;}
    .youtube2 .t { padding-left: 72px; padding-right: 101px; float: left; font-size: 16px;}
    .icon_lst li a {clear: both;}
    .new_tit { font-family: 'Song Myung'; font-size: 50px; }

    .map { margin: 0 auto; width: 100%; }
    .map_img {float: left;}
    .map_com {float: right; background-color: rgb(255,239,115); padding: 20px;  }

    #page3 { background-color: rgb(115,193,225); clear: both; width: 100%; height: 100vh; background-image: url(./img/back2.png);}
    .pg_tit { font-family: 'Song Myung'; font-size: 50px; margin: 20px auto; padding-left: 500px; padding-top: 30px;}
    .map_img { display:block; width: 100%; }
    .new_lst { width: 100%; }
    .col6 { float: left; }
    
</style>
<style>

    #item8 { background-color: rgb(109 203 223);}
    #item9 { background-image: url("./img/tree.jpg");}
    #item10 { background-image: url("./img/sun.jpg");}
    #item11 { background-color: #fff; }

    .ptit_box { width: 440px; height: 440px; background-color:#05a4a6; color:#fff; 
    text-align: center; padding-top: 330px; box-sizing: border-box; position:absolute; left: 50%; margin-left: -222px; border-radius:50%; margin-top: -492px;   }
    .pg_tit3 {  font-family: 'Song Myung'; font-size:55px; font-weight:600; margin-top: 210px; color: black;}
    .pg_tit4 {  font-family: 'Song Myung'; font-size:24px; font-weight:300; color: rgb(43, 43, 43); }
    .ra0 { display:none; }
    #page4 .ptit_box { background-color: #00436f;}
    #item6 { width: 400%;  transition-delay:0.05s; 
    transition-duration:0.6s; }
    #item6 li { width: 25%; float:left; }
    .thumb_vs_wrap { position:absolute; right:0; bottom: 0; overflow:hidden; width: 300px; height: 277px; }
    #item7 { width: 400%; margin-left: 0; transition-delay:0.05s; 
    transition-duration:0.6s; }
    #item7 li { width: 25%; float:left; }
    #item7 li label { display:block; width: 18px; height: 36px; 
    background-repeat: no-repeat; background-position:center center; position:absolute; bottom:100px; text-indent:-10000px; cursor:pointer; }
    #item7 li label.lb1 { left:24px; background-image: url("./img/le.png"); }
    #item7 li label.lb2 { right:24px; background-image: url("./img/ri.png"); }
    #item7 .tbox { width: 140px; height: 140px; clear:both;overflow:hidden;   margin:20px auto; top: 50px;  border-radius:75px; border:3px solid #fff; }
    .thumb_vs_wrap #item7 li label { display:none; }
    .ra { display:none; }
    #ra5:checked ~ .thumb_vs_wrap #item7 .item1 label { display:block; }
    #ra6:checked ~ .thumb_vs_wrap #item7 .item2 label { display:block; }
    #ra7:checked ~ .thumb_vs_wrap #item7 .item3 label { display:block; }
    #ra8:checked ~ .thumb_vs_wrap #item7 .item4 label { display:block; }
    #ra5:checked ~ .thumb_vs_wrap #item7 { margin-left: 0; }
    #ra6:checked ~ .thumb_vs_wrap #item7 { margin-left:-100%; }
    #ra7:checked ~ .thumb_vs_wrap #item7 { margin-left:-200%; }
    #ra8:checked ~ .thumb_vs_wrap #item7 { margin-left:-300%; }
    #ra5:checked ~ #item6 { margin-left: 0; }
    #ra6:checked ~ #item6 { margin-left:-100%; }
    #ra7:checked ~ #item6 { margin-left:-200%; }
    #ra8:checked ~ #item6 { margin-left:-300%; }
    .col_vs_tit_box { position:absolute; top: 0; left: 0; }
    .col_vs_tit { clear:both; width: 100%;  padding-top: 50px;  }
    .col_vs_tit span { display:block; font-family: 'TTTogether';  font-weight:400; 
padding-left:120px; font-size:48px;}
    .col_vs_tit .row1 { color:#00436f; font-family: 'Song Myung'; font-weight: 600; text-shadow: 0px 0px 3px rgb(255, 255, 255)}
    .col_vs_tit .row2 { color:#007bbf; font-family: 'Song Myung'; font-weight: 600; text-shadow: 0px 0px 3px rgb(255, 255, 255);}
    .col_vs_com { padding-left: 120px; padding-top: 5px; font-size: 25px; font-family: 'Song Myung'; font-weight: 500; text-shadow: 0px 0px 3px rgb(255, 255, 255);}
    #item8 .col_tit, #item9 .col_tit { line-height: 1.6; } 
    #item9 .col_com img { border:2px solid #fff; border-radius:100px; margin-left: 48px;}
    #item8 .col_com img { margin-top: -38px; margin-left: 20px; }
    #page2 .col_com { clear:both; float:none; width:auto; margin:0px auto; }
    .col_tit.black_txt { color:#000; line-height: 1.6; padding-top: 12px; }
    .col_tit.black_txt:after { background-color: #00b2a3; }
    #item11 { position:relative; }
    #item11 .link_box { position:absolute; bottom: 0; left: 0; width: 100%; }
    #item11 .link_box li { display:block; width: 50%; float:left; }
    #item11 .link_box li a { display:block; line-height: 65px; height: 65px; color:#222; background-color: #00b2a3; padding-left:64px; font-size:14px; border-top:1px solid #fff; border-left:1px solid #fff; 
    background-repeat: no-repeat; background-position:18px center; }
    #item11 .link_box li:nth-child(2n+1) a { border-left:0px; }
    #item11 .link_box li.item1 a { background-image: url("./source/pg2_icon1.png"); }
    #item11 .link_box li.item2 a { background-image: url("./source/pg2_icon2.png"); }
    #item11 .link_box li.item3 a { background-image: url("./source/pg2_icon3.png"); }
    #item11 .link_box li.item4 a { background-image: url("./source/pg2_icon4.png"); }

    #page3 .ptit_box { background-color: #007bbf;}
     .col_tit { color:#fff; text-align: center; line-height:3; width: 100%; clear:both; margin-top: 28px; }
    .col_tit:after { content:""; display:block; width: 40px; height: 2px; 
background-color: #fff; clear:both; margin:0px auto; margin-bottom: 20px; }
    .col_com { color:#fff; padding: 20px 60px; font-size:20px; text-align: center;}
    
    #page4 .col_link { display:block;  clear:both; float:none; width: 38px; height: 38px; 
    margin: 10px auto; background-image: url("./source/family-arrow.png");
    border-radius:21px; border:2px solid #fff;  text-indent:-10000px;
background-repeat: no-repeat; background-position:center center; 
    transform: rotate(90deg); }

   .page4top{ margin-top: 200px; }

</style>
