<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="hd fix">
            <div class="hd_wrap">
            <c:set var="path" value="${pageContext.request.contextPath}" />
                <a href="${path}/" class="logo">
                    <img src="../source/logo.png" alt="로고">
                </a>
                <nav class="tnb">
                    <ul>        
                    <c:if test="${member == null}">
                        <li><a href="${path}/member/join.do">회원가입</a></li>    
                        <li><a href="${path}/member/login.do">로그인</a></li>
                        <li><a href="https://www.badatime.com/41.html?idx=41">물때표</a></li>
                    </c:if>
                    <c:if test="${member != null}">
						<li>${member.name}님</li>	
						<li><a href="${path}/member/mypage.do?userid=${member.getUserid() }" class="dp1">마이페이지</a></li>
						<li><a href="${path}/member/logout.do" class="dp1">로그아웃</a></li>
						<li><a href="https://www.badatime.com/41.html?idx=41">물때표</a></li>
					</c:if>
					<c:if test="${member.userid == 'admin'}">	
						<li><a href="${path}/board/list.do" class="dp1">게시판 관리</a></li>
						<li><a href="${path}/member/list.do" class="dp1">회원 관리</a></li>
						<li><a href="https://www.badatime.com/41.html?idx=41">물때표</a></li>
					</c:if>
                    </ul>
                </nav>
                <nav class="gnb">
                    <ul>
                        <li>
                            <a href="sub1_1.html" class="dp1">관광명소</a>
                            <ul class="sub">
                                <li><a href="${path}/sub1_1.html">오동도</a></li>
                                <li><a href="${path}/sub1_2.html">진남관</a></li>
                                <li><a href="${path}/sub1_3.html">거문도백도</a></li>
                                <li><a href="${path}/sub1_4.html">여수해상케이블카</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="" class="dp1">문화/축제</a>
                            <ul class="sub">
                                <li><a href="">낭만버스킹</a></li>
                                <li><a href="">여수거북선축제</a></li>
                                <li><a href="">여수불꽃축제</a></li>
                                <li><a href="">향일 일출제</a></li>                           
                            </ul>
                        </li>
                        <li> 
                            <a href="" class="dp1">여수대표음식</a>
                            <ul class="sub">
                                <li><a href="">돌산갓김치</a></li>
                                <li><a href="">게장백반</a></li>
                                <li><a href="">여수한정식</a></li>
                                <li><a href="">굴구이</a></li>                              
                            </ul>
                        </li>
                        <li>
                            <a href="" class="dp1">여행/체험</a>
                            <ul class="sub">
                                <li><a href="">자전거코스</a></li>
                                <li><a href="">걷기여행</a></li>                            
                                <li><a href="">이순신코스</a></li>
                                <li><a href="">여수낭만버스</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="${path}/sub5_1.html" class="dp1">관광안내</a>
                            <ul class="sub">
                                <li><a href="${path}/sub5_1.html">관광소식</a></li>
                                <li><a href="">관광웹툰</a></li>
                                <li><a href="">관광캐릭터</a></li>
                                <li><a href="">여수여행사</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav> 
            </div>    
        </header> 

<hr>