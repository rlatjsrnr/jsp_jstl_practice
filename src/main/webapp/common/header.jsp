<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Member</title>
<c:url var="context" value="/"/>
<link href="${context}/css/header.css" rel="stylesheet" type="text/css" />
<link href="${context}/css/footer.css" rel="stylesheet" type="text/css" />
<link href="${context}/css/common.css" rel="stylesheet" type="text/css" />
</head>

<c:if test="${!empty cookie.rememberMe}">
	<s:query var="rs" dataSource="java/MySQLDB">
		SELECT * FROM digital_member WHERE u_id=?
		<s:param>${cookie.rememberMe.value}</s:param>
	</s:query>	
	<c:if test="${rs.rowCount > 0}">
		<c:set var="member" value="${rs.rows[0]}" scope="session"/>
	</c:if>
</c:if>

<body>
	<header>
		<div>
			<ul>
				<li><a href="<c:url value='/index.jsp'/>">home</a></li>
				<c:choose>
					<c:when test="${!empty sessionScope.member}">
						<li><a href="<c:url value='/member/info.jsp'/>">${member.u_id}</a>님 방가</li>
						<c:if test="${member.u_id eq 'admin'}">
							<li><a href="<c:url value='/management/member.jsp'/>">회원관리</a></li>
						</c:if>
						<li><a href="<c:url value='/member/logOut.jsp'/>">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="<c:url value='/member/login.jsp'/>">로그인</a></li>
						<li><a href="<c:url value='/member/join.jsp'/>">회원가입</a></li>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</div>
		<div>
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">질문과답변</a></li>
			</ul>
		</div>
	</header>