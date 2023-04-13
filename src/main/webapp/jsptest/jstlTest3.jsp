<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL 연습</h1>
<p>myName request>session>application : ${myName}</p>
<p>request myName : ${requestScope.myName}</p>
<p>session myName : ${sessionScope.myName}</p>
<p>application myName : ${applicationScope.myName}</p>
<ul>
    <c:set var="sum" value="0"></c:set>
    <c:forEach items="${admins}" var="admin" varStatus="status">
        <c:set var="sum" value="${sum+100}"></c:set>
        <li style="color:${status.first?'red':'blue'};"> ${status.first}: ${status.last}  :${sum} : ${status.index}:${status.count} :  ${admin}----${admin.manager_name}</li>
    </c:forEach>
</ul>
<hr>
<h2>score평가</h2>
<c:if test="${score>=90}">
    <p>합격입니다^ㅡ^</p>
</c:if>
<c:if test="${score<90}">
    <p>불합격입니다ㅜㅡㅜ</p>
</c:if>
<hr>
<c:choose>
    <c:when test="${score>=90 }">
        <p>A학점!</p>
    </c:when>
    <c:when test="${score>=80 }">
        <p>B학점!</p>
    </c:when>
    <c:when test="${score>=70 }">
        <p>C학점!</p>
    </c:when>
</c:choose>
<hr>
<h2>c:out연습</h2>
<c:out value="오늘은 목요일입니다."/><br>
오늘은 목요일입니다.
<hr>
<h2>숫자, 날짜 format</h2>
<c:set value="100000000" var="price" />
1.price = ${price}<br>
2.price = <fmt:formatNumber value= "${price}" groupingUsed="true"
        type="currency"></fmt:formatNumber><br>
3. 오늘 : ${today}
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss"/><br>

<h2>JSTL에서 문자열함수 사용하기</h2>
<p>myName: ${myName }</p>
<p>myName: ${fn:substring(myName,0,3) }</p>
<p>myName: ${fn:length(myName)}</p>





</body>
</html>