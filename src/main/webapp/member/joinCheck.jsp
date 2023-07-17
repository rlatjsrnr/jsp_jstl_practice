<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!-- joinCheck.jsp -->
<!-- 회원가입 처리 -->

<c:catch var="r">
	<s:query var="rs" dataSource="java/MySQLDB">
		SELECT * FROM digital_member WHERE u_id='${param.u_id}'
	</s:query>
	<c:choose>
		<c:when test="${rs.rowCount == 0}">
			<s:update var="result" dataSource="java/MySQLDB">
				INSERT INTO digital_member(u_id, u_pass, u_age, u_gender) VALUES(?,?,?,?)
				<s:param>${param.u_id}</s:param>
				<s:param>${param.u_pass}</s:param>
				<s:param>${param.u_age}</s:param>
				<s:param>${param.u_gender}</s:param>
			</s:update>
			<c:choose>
				<c:when test="${result == 1}">
					<script>
						alert('회원가입 성공');
						location.href='<c:url value="/member/login.jsp"/>';
					</script>
			
				</c:when>
				<c:otherwise>
					<script>
						alert('회원가입 실패');
						history.back();
					</script>
				</c:otherwise>
			</c:choose> 
		</c:when>
		<c:otherwise>
			<script>
				alert('동일한 아이디가 존재합니다.');
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</c:catch>
<c:if test="${!empty r}">
	<script>
		alert('회원가입 실패');
		history.back();
	</script>
</c:if>








