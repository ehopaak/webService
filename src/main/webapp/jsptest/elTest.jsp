<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shinhan.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Action Tag : jsp: 으로 시작하는 tag(JSP가 기본적으로 제공하는 tag) -->
	<!-- scope: page, request, session, application -->
	<jsp:useBean id="vo1" class="com.shinhan.vo.AdminVO" scope="request"></jsp:useBean>
	<jsp:setProperty property="email" name="vo1" value="test@mail.com"/>
	
	<jsp:useBean id="alist" class="java.util.ArrayList"></jsp:useBean>
	
	<%-- <jsp:forward page="forwardTest.jsp"></jsp:forward> --%>
	
	<h1>EL(Expression Language)</h1>
 	<!-- EL이 내장하는 객체 scope: pageScope, requestScope, sessionScope, applicationScope  -->
	<pre>
	1. 숫자, 연산자: ${100 + 200}
	2. 문자: ${"hello" }
	3. empty: ${empty "hello" }
	3. empty: ${empty "" }
	3. empty: ${empty vo1 }
	3. empty: ${empty alist }
	3. empty: ${empty null }
	4. 비교: ${417 > 88 }
	4. 비교: ${417 gt 88 }
	5. 숫자+문자: ${"100"+10 }
	6. eq: ${"hello" == "hello" }
	6. eq: ${"hello" eq "hello" }
	7. 나머지: ${200 % 17 }
	7. 나머지: ${200 mod 17 }
	8. 논리연산자: ${!(100==200) && (200!=300) }
	9. 내장객체 param: ${param.param1 }
	9. 내장객체 param: ${param.param2 }
	<%
		String p1 = request.getParameter("param1");
		String p2 = request.getParameter("param2");
	%>
	10. 자바코드: <%=p1 %>, <%=p2 %>
	html 내장 entity : < &lt;, & &amp;
	
	11. request, session, application영역에 저장: 
	<%
		application.setAttribute("score1", 100);
		session.setAttribute("score2", 200);
		request.setAttribute("score3", 300);
		
		application.setAttribute("scopeTest", "application");
		session.setAttribute("scopeTest", "session");
		request.setAttribute("scopeTest", "request");
	%>
	12. request, session, application영역에 읽기: (범위가 좁은 순서부터 찾는다: request -> session -> application)
		score1: ${score1 }
		score2: ${score2 }
		score3: ${score3 }
		scoreTest: ${scopeTest }
		pageScope: ${pageScope.scopeTest }
		requestScope: ${requestScope.scopeTest }
		sessionScope: ${sessionScope.scopeTest }
		applicationScope: ${applicationScope.scopeTest }
	13. pageContext이용해서 내장객체의 기능을 이용하기:
		Expression 문법: <%=request.getContextPath() %>
		EL 문법: ${pageContext.request.contextPath }
	14. 객체의 속성 사용하기 :
		<%
			AdminVO adminVO = new AdminVO("test@mail.com", "test", "1234");
			request.setAttribute("admin", adminVO);
		%>
		request.getAttribute("admin"): ${admin }
		request.getAttribute("admin").getEmail(): ${admin.email }
	15. Collection test
		<%
			// 이 부분은 서블릿으로 처리하는게 맞음. 지금은 그냥 테스트
			List<AdminVO> adminList = new ArrayList<>();
			adminList.add(new AdminVO("mudo1@mail.com", "명수", "1234"));
			adminList.add(new AdminVO("mudo2@mail.com", "홍철", "1234"));
			request.setAttribute("adminList", adminList);
			
			Map<String, Object> map = new HashMap<>();
			map.put("바나나", 5);
			map.put("사과", 15);
			map.put("orange", 25);
			map.put("admins", adminList);
			request.setAttribute("fruits", map);
		%>
		${adminList[0].email }
		${adminList[0].manager_name }
		${adminList[0].pass }
		${adminList[1].email }
		${adminList[1].manager_name }
		${adminList[1].pass }
		
		map의 키가 영문이 아닌 경우: ${fruits["바나나"] }
		map의 키가 영문인 경우: ${fruits.orange }
		map에 객체가 저장된 경우: ${fruits.admins }
		map에 객체의 순서에 접근: ${fruits.admins[0].email }
	</pre>
</body>
</html>