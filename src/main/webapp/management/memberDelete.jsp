<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- memberDelete.jsp -->
<!-- 삭제할 회원 번호를 넘겨 받아 u_join column의 값을 N으로 수정 -->
<s:update var="result" dataSource="java/MySQLDB">
	UPDATE digital_member SET u_join='N' WHERE u_num='${param.u_num}'
</s:update>
<c:choose>
	<c:when test="${result == 1}">
		<script>
			alert('탈퇴 성공');
			location.href='<c:url value="/management/member.jsp" />';
		</script>		
	</c:when>
	<c:otherwise>
		<script>
			alert('탈퇴 실패');
			history.back();
		</script>
	</c:otherwise>
</c:choose>












