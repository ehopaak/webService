<%@page import="com.shinhan.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<EmpVO> emplist = (List<EmpVO>)request.getAttribute("empAll");

%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>

	#container { 
        width:1200px;  
        padding:15px;  
        border:1px dotted gray;  
      }
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	h1{
		font-family: 'Jeju Gothic', sans-serif;
		border: 2px solid black; 
  		padding: 10px; 
  		margin: 10px; 
	}
	.align-left {text-align:left;}
	th{
	
		font-family: 'Jeju Gothic', sans-serif;
	}
	.align- {text-align:left;}
	tr:hover{
		background-color: pink;
	}
	.align-center {text-align:center;}
	div{
      	background-color: lightgreen;
      }
</style>
<script
  src="https://code.jquery.com/jquery-3.6.4.min.js" ></script>
  <script>
  $(function(){
	  $(".btnDel").on("click",function(){
		  
		  location.href="empDelete.do?empid=" + $(this).attr("data-del");
	  });
  });
  
  
   $(function(){
	   $("thead tr th").click(function(e){
		   //내가 클릭한 th가 몇번째인가?
		   var trNum = $(this).closest("th").prevAll().length;
		   console.log(trNum);
		   var a = $("tbody tr").each(function(index, item){
			   var col = $(item).find("td:nth-child(" + (trNum+1) + ")");
			   console.dir(col);
			   //되돌리기(기존선택을 clear)
			   $(item).find("td").css("background-color", "white");
			   //신규선택의 색깔 바꾸기
			   $(col).css("background-color", "orange");
			   
		   });
		   
	   });
   });
  </script>
  <script>
    function init(){
    	$("tr").css("background-color", "white")
    	$("tr").css("color", "black");
    }
    $(function(){
    	
    	$("#btn1").click(function(){
    		$("tr:nth-child(2n)").css("background-color", "lightgray");
        	$("tr:nth-child(2n+1)").css("background-color", "white");
    	});
    	//body > div > table > tbody > tr:nth-child(1) > td:nth-child(2)
    	$("#btn2").click(function(){
    		init();
    		$("tr > td:nth-child(2):contains('S')").css("color", "red");
    	});
    	$("#btn3").click(function(){
    		init();
    		$("tr td:contains('S')").css("color", "red");
        	
    	});
    	$("#btn4").on("click", function(){
    		init();
    		var selector = "tr > td:nth-child(5)";
    		
    		$(selector).each(function(index, item){
    			var sal = parseInt($(item).html()) ;
    			if(sal >= 5000) {
    				$(item).css("background-color", "lightgreen")
    			}
    		});
    	});
    	
    	$("#btn5").click(function(){
    		var arr = $("tr>td:nth-child(1)");
    		$.each(arr, function(index, item){
    			if(parseInt($(item).text())%2==1){
    				console.log($(item).text());
    				$(item).parent().css("background-color", "green");
    			}
    		});
    	});
    	
    	
    	var str="";
    	var arr = ["IT_PROG", "AD_VP","AD_PRES","ST_MAN","ST_CLERK"];
    	$.each(arr, function(index, item){
    		console.log(item);
    		//str += `<option>${item}</option>`;
    		str += "<option>" + item + "</option>";
    	});
    	
    	$("#jobs").html(str);  //html() : jQuery함수 , innerHTML는 자바스크립트 속성 
    	console.log(str);
    	
    	$("select").change(function(){
    		var jobid = $(this).val();
    		//init();
    		$("tr td").css("color","black");
    		$("tr td:contains('" + jobid + "')").css("color", "red");
    	});

    });
  </script>
</head>
<body>
<div class="container mt-3">
	<h1>직원목록</h1>
	<div>로그인한 사용자: ${loginUser.manager_name} </div> 
	<button 
	onclick="location.href='empinsert.do'"
	type="button" class="btn btn-success">직원등록</button>
	
	<a type="button" class="btn btn-success" href="empinsert.do">직원등록</a>
	<hr>
	<button id="btn1">짝수row선택</button>
	<button id="btn2">이름 S로 시작하는 직원</button>
	<button id="btn3">S문자가 포함</button>
	<button id="btn4">급여5000이상</button>
	<button id="btn5">직원 번호가 홀수인 사람 선택</button>
	<select id="jobs">
	   
	</select>
	<hr>
	
	<table class="table table-hover">
	  <thead>
	   <tr>
	     <th>직원번호</th>
	     <th>이름</th>
	     <th>성</th>
	     <th>이메일</th>
	     <th>급여</th>
	     <th>입사일</th>
	     <th>전화번호</th>
	     <th>직책</th>
	     <th>메니져</th>
	     <th>커미션</th>
	     <th>부서</th>
	     <th></th>
	   </tr>
	 </thead>
	 <tbody> 
	   <%for(EmpVO emp : emplist){%>
	   <tr>
	     <td><a href="empDetail.do?empid=<%=emp.getEmployee_id() %>"><%=emp.getEmployee_id() %></a></td>
	     <td><a href="empDetail.do?empid=<%=emp.getEmployee_id() %>"><%=emp.getFirst_name() %></a></td>
	     <td><%=emp.getLast_name() %></td>
	     <td><%=emp.getEmail() %></td>
	     <td><%=emp.getSalary() %></td>
	     <td><%=emp.getHire_date() %></td>
	     <td><%=emp.getPhone_number() %></td>
	     <td><%=emp.getJob_id()%></td>
	     <td><%=emp.getManager_id() %></td>
	     <td><%=emp.getCommission_pct() %></td>
	     <td><%=emp.getDepartment_id() %></td>
	     <td><button class = "btnDel" data-del="<%=emp.getEmployee_id() %>">X</button></td>
	   </tr>
	  <%} %>
	</tbody> 
	 
	</table>
</div>	
 
</body>
</html>