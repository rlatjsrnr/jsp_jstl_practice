<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- loginCheck.jsp -->
<!--
	 로그인 요청 처리 
	 로그인 성공한 회원의 정보를 member 를 키값으로 저장
-->
<jsp:useBean id="mkCookie" class="util.MakeCookie" />
<c:catch var="r">	
	<s:query var="rs" dataSource="java/MySQLDB">
		SELECT * FROM digital_member WHERE u_id=? AND u_pass=? AND u_join='Y'
		<s:param>${param.u_id}</s:param>
		<s:param>${param.u_pass}</s:param>
	</s:query>
	<c:choose>
		<c:when test="${rs.rowCount == 1}">
			<c:set var="member" value="${rs.rows[0]}" scope="session"/>
			
			<c:if test="${!empty param.login}">
				<%
				 	Cookie cookie = new Cookie("rememberMe", "");
				 	cookie.setMaxAge(60*60*24);
				 	cookie.setPath("/");
				 	response.addCookie(cookie);
				 %>
				<%-- ${mkCookie.makeCookie(response, "rememberMe", param.u_id, 60*60*24, "/")} --%>
			</c:if>			
			<script>
				alert('로그인 성공');
				location.href='<c:url value="../index.jsp"/>';
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('로그인 실패');
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</c:catch>
<c:if test="${!empty r}">
	<script>
		alert('db연결 실패');
		history.back();
	</script>
</c:if>