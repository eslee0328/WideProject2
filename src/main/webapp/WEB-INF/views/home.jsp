<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>사원 조회</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
  <style>
    body {
      font-size: 16px;
    }

    .container {
      width: 800px;
      padding: 0px;
      margin: 0px 0px 0px 20px;
    }

    #title {
      margin: 20px 0px 20px 20px;
      font-weight: bold;
    }

    label {
      margin: 0px 10px 0px 0px;
    }

    #searchBtn {
      margin-left: 10px;
    }
    
    #AddBtn {
      margin-left : 780px;
      }

    table {
      border: 1px solid black;
      margin: 20px 0px 20px 20px;
      width: 100%;
    }

    table th,
    table td {
      border: 1px solid black;
      text-align: center;
    }

    table tbody td:first-child {
      text-align: center;
    }

    .col-sm-12 {
      margin-bottom: 10px;
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="row">
      <h1 id="title">사원 검색</h1>

      <div class="col-sm-12">
      <select id="searchType" name="searchType">
			<option value="">-선택-</option>
			<option value="n">이름</option> 
			<option value="m">직책</option>
			<option value="d">부서</option>
		</select>
        <input type="text" name="empName" id="empName" placeholder="검색어를 입력하세요">
        <button class="btn btn-primary" id="searchBtn" onclick="location.href='/empDetail'">검색</button>
      </div>
      <table>
        <thead>
          <tr>
            <th bgcolor="#D3D3D3">사원번호</th>
            <th bgcolor="#D3D3D3">직책</th>
            <th bgcolor="#D3D3D3">이름</th>
            <th bgcolor="#D3D3D3">부서</th>
            <th bgcolor="#D3D3D3">경력</th>
            <th bgcolor="#D3D3D3">등급</th>
            <th bgcolor="#D3D3D3">입사일</th>
            <th bgcolor="#D3D3D3">자격증</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${empList }" var="emp">
          <tr>
            <th>${emp.emp_num }</th>
            <th>${emp.pos }</th>
            <th><a href="empDetail.do?seq=${emp.emp_num }">
            		${emp.kor_name }</a></th>
            <th>${emp.dept }</th>
            <th>${emp.career }</th>
            <th>${emp.emp_level }</th>
            <th><fmt:formatDate value="${emp.join_date }" pattern="yyyy-MM-dd"/></th>
            <th>${emp.cert }</th>
          </tr>
          </c:forEach>
          <tr>
            <th>2</th>
            <th>사원</th>
            <th><a href="">김길동</a></th>
            <th>기획팀</th>
            <th>3년</th>
            <th>초급</th>
            <th>2019.8.30</th>
            <th>정보처리기사</th>
          </tr>
          <tr>
            <th>3</th>
            <th>대리</th>
            <th><a href="">박길동</a></th>
            <th>개발팀</th>
            <th>5년</th>
            <th>중급</th>
            <th>2015.1.30</th>
            <th>정보처리기사, 정보처리산업기사</th>
          </tr>
        </tbody>
      </table>
      <br>
      <div class="col-sm-12">
        <button class="btn btn-primary" id="AddBtn" onclick="location.href='/empAdd.jsp'">추가</button>
      </div>
    </div>
  </div>

  <script src=" https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>