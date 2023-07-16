<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <!-- 로그아웃 요청 처리 -->
 <c:remove var="member" scope="session"/>
 <%
 	Cookie cookie = new Cookie("rememberMe", "");
 	cookie.setMaxAge(0);
 	cookie.setPath("/");
 	response.addCookie(cookie);
 %>
 <script>
 	alert('로그아웃!');
 	location.href='<c:url value="../index.jsp"/>';
 </script>