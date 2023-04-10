<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>장바구니 담기</h1>
<p> 로그인한 사람: ${loginUser.manager_name }</p>
<form action="addCart.do" method="post">

<div class = "form-check">
	<input class="form-check-input" type="radio" name="product" id = "product1 " value="kimbab">
	<label class="form-check-label" for="product1">
	김밥
	</label>
</div>

<div class = "form-check">
	<input class="form-check-input" type="radio" name="product" id = "product2 " value="hamburger">
	<label class="form-check-label" for="product2">
	햄버거
	</label>
</div>

<div class = "form-check">
	<input class="form-check-input" type="radio" name="product" id = "product3 " value="coke">
	<label class="form-check-label" for="product3">
	콜라
	</label>
</div>

 	  <input type="number" name="Count" value=1> <br>
 	  <input type = "submit" value = "장바구니담기">
 	  <input type = "button" value = "장바구니보기" onclick="location.href='cartview.do';">
 	  <input type = "button" value = "장바구니비우기" 
 	  						onclick="location.href='cartremove.do'">
</form>
</body>
</html>