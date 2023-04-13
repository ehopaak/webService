<%@page import="com.shinhan.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
List<EmpVO> emplist = (List<EmpVO>)request.getAttribute("empAll");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/commonfiles.jsp"%>


<%-- <jsp:include page="${path}/common/commonfiles.jsp"></jsp:include> --%>

<style>
   .box1{width :auto; height:auto;}   
   #round{border-radius:10px;}
   #container { 
        width:1200px;  
        padding:15px;  
      }
   @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
   h1{
      text-align: center;
      border-bottom: 12px solid #dcf1fb;
      font-family: 'Jeju Gothic', sans-serif;
        padding: 0 0 0 0.2em; 
        margin: 10px; 
   }
   .align-left {text-align:left;}

   th{
      font-family: 'Jeju Gothic', sans-serif;
      width:auto; 
   }
   .align- {text-align:left;}
   tr:hover{
      background-color: pink;
      width:auto; height: auto;
   }
   div{
         background-color: lightgreen;
         box-shadow: inset 0 0 8px #deb13a;
      }
      tr{
         border-bottom:2px solid white;
         width:auto; height: auto;
      }
      #div2{
         border : 1px solid #00fa9a;
         background-color: #00fa9a;
         border-radius: 10px;
         box-shadow: inset 0 0 8px #deb13a;
         width:auto; height: auto;
      
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

<div id= "round" class="container mt-3">
 
   <h1 >직원목록</h1>
   
   <!-- include 디렉티브는 소스를 합쳐서 컴파일한다. -->
   <%@ include file="../common/header.jsp" %>
   <!-- include action tag이용: 컴파일하고 합침 -->
   <!-- <jsp:include page="../common/header.jsp"></jsp:include>-->
  
   
   
   
   <form action="${path}/downloadTest/result.jsp">
   <input type=hidden name="param1" value="cat.png"/><br>
   <input type=hidden name="param2" value="cat2.png"/><br>
   <input type="submit" value="이미지 다운로드">
   </form>
   
   
   
   <hr>
   <button type="button" class="btn btn-primary" data-bs-toggle="modal" 
   data-bs-target="#exampleModal" data-bs-whatever="@mdo">Modal 이용 직원등록</button>
   <%@ include file="empInsertModal2.jsp" %>
   
    <button 
   onclick="location.href='empinsert.do'"
   type="button" class="btn btn-success">직원등록</button>  
   <button class="btn btn-success" id="btn1">짝수row선택</button>
   <button class="btn btn-success" id="btn2">이름 S로 시작하는 직원</button>
   <button class="btn btn-success" id="btn3">S문자가 포함</button>
   <button class="btn btn-success" id="btn4">급여5000이상</button>
   <button class="btn btn-success" id="btn5">직원 번호가 홀수인 사람 선택</button>
   <select id="jobs">
      
   </select>
   <hr>
   <div id="div2">
   <table class="table table-hover" >
     <thead>
      <tr align="center">
     	
     	<th>순서</th>
        <th>직원번호</th>
        <th>이름</th>
        <th>성</th>
        <th>이메일</th>
        <th>급여</th>
        <th>누적급여</th>
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
    <!-- for(EmpVO emp:empAll) -->
    <c:set var="totalSalary" value="0"/>
    <c:forEach items="${empAll }" var="emp" varStatus="status">
    <c:set var="totalSalary" value="${totalSalary+emp.salary }"/>  
      <tr align="center">
		<td style="background-color: ${status.first||status.last?'lightyellow':'white'};">${status.count}</td>
	    <td class="index"><a href="empDetail.do?empid=${emp.employee_id }">${emp.employee_id }</a></td>
	    <td><a href="empDetail.do?empid=${emp.employee_id }">${emp.first_name }</a></td>
	    
	    <td>${emp.last_name }</td>
	    <td>${emp.email }**
	    	${fn:substring(emp.email,0,3) }**
	    	${fn:indexOf(emp.email,"@") }**
	    	${fn:indexOf(emp.email,"@")>=0?fn:substring(emp.email,0,3):emp.email }
	    </td>
	    <td>
	        <fmt:formatNumber value="${emp.salary}" groupingUsed="true"/></td>
	    <td>${totalSalary}</td>
	    <td>
	        <fmt:formatDate value="${emp.hire_date }"  pattern="yyyy/MM/dd"/></td>
	    <td>${emp.phone_number}</td>
	    <td>${emp.job_id}</td>
	    <td>${emp.manager_id }</td>
	    <td>
	        <fmt:formatNumber value="${emp.commission_pct}" type="percent" /></td>
	    <td>${emp.department_id}</td>
        <td><button style="background-color: red; border-radius: 5px" class = "btnDel" data-del="${emp.employee_id}">X</button></td>
      </tr>
     </c:forEach>
   </tbody> 
   
   </table>
   </div>
</div>   

</body>

</html>