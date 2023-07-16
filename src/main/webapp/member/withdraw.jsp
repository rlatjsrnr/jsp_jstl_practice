<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- withdraw.jsp -->
<!-- 회원 탈퇴 처리 - 회원 정보를 삭제하지 않고 u_join column의 값을 N으로 수정 -->
<s:update var="result" dataSource="java/MySQLDB">
	UPDATE digital_member SET u_join='N' WHERE u_id='${param.u_id}'
</s:update>
<c:choose>
	<c:when test="${result == 1}">
		<script>
			alert('탈퇴 성공');
			location.href='<c:url value="../index.jsp" />';
		</script>
		<c:remove var="member" scope="session"/>
	</c:when>
	<c:otherwise>
		<script>
			alert('탈퇴 실패');
			history.back();
		</script>
	</c:otherwise>
</c:choose>








