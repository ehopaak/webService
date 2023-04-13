<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath }" scope="application"></c:set>	

	 <%-- <p>세션에서 로그인사용자읽기: ${sesstionScope.loginUser} </p> --%> 
	 <%-- <p>세션에서 로그인사용자읽기(script): <%= session.getAttribute("loginUser") %></p>  --%>
	
	
	
	<%-- <img src="<%=request.getContextPath()%>/images/umbrella.jpg" width="200" height="150"> --%>
	
	<p>
	환영합니다! ${loginUser==null?"guest":loginUser.manager_name}님 <button id="btnLogout">로그아웃</button>
	</p> 
	
	<c:if test="${loginUser!=null }">
		<img src="${path }/uploads/${loginUser.pic}" width="300" height="250"/>
		
	</c:if>
	<c:if test="${loginUser==null }">
		<button  class="btn btn-success" onclick="location.href='${path}/auth/loginCheck.do'">로그인</button>
	</c:if>
	
	<script>
	  $(function(){
	     $("#btnLogout").on("click",function(){
	         $.ajax({
	            url:"<%=request.getContextPath()%>/auth/logout.do",
	            success:function(responseData){
	               alert("로그아웃되었습니다.");
	               location.href="${path}/auth/loginCheck.do"
	            },
	            error:function(){
	               alert(message);
	               console.log(message)
	            }
	         
	         });
	      });
	     
	  });
   </script> 