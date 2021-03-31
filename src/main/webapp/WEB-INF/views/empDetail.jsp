<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>사원정보 수정</title>
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

    .row {
      margin: 0px;
    }

    #title {
      margin: 20px 0px 20px 0px;
      font-weight: bold;
    }

    .col-sm-2,
    .col-sm-6 {
      padding: 0px;
    }

    img {
      margin-bottom: 20px;
    }

    table td {
      border: 1px solid black;
      height: 50px;
    }

    .prj,
    .tech {
      width: 100%;
    }

    .prj th,
    .prj td,
    .tech th,
    .tech td {
      border: 1px solid black;
      text-align: center;
      height: 20px;
    }

    .btnArea {
      margin-top: 10px;
      text-align: right;
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="row">
      <h1 id="title">사원 상세</h1>
      <div class="col-sm-3">
        <img src="../11.png" alt="사진">
        <button class="btn btn-sm btn-primary">변경</button>
      </div>
      <div class="col-sm-9">
        <table>
          <tbody>
            <tr>
              <td class="col-sm-2" bgcolor="#D3D3D3">사원번호</td>
              <td class="col-sm-2">12</td>
              <td class="col-sm-2" bgcolor="#D3D3D3">직책</td>
              <td class="col-sm-2">대리</td>
            </tr>
            <tr>
              <td bgcolor="#D3D3D3">한글이름</td>
              <td>홍길동</td>
              <td bgcolor="#D3D3D3">부서</td>
              <td>개발부</td>
            </tr>
            <tr>
              <td bgcolor="#D3D3D3">영문이름</td>
              <td>Hong Gil Dong</td>
              <td bgcolor="#D3D3D3">경력</td>
              <td>4년</td>
            </tr>
            <tr>
              <td bgcolor="#D3D3D3">우편번호</td>
              <td>00000</td>
              <td bgcolor="#D3D3D3">등급</td>
              <td>중급</td>
            </tr>
            <tr>
              <td bgcolor="#D3D3D3">도로명주소</td>
              <td>서울시 가산동</td>
              <td bgcolor="#D3D3D3">입사일</td>
              <td>2017.6.20</td>
            </tr>
            <tr>
              <td bgcolor="#D3D3D3">상세주소</td>
              <td>000-000</td>
              <td bgcolor="#D3D3D3">자격증</td>
              <td>정보처리기사</td>
            </tr>
          </tbody>
        </table><br>
        <h4>사용가능 기술</h4>
        <table class="tech">
          <thead>
            <tr>
              <th bgcolor="#D3D3D3">기술명</th>
              <th bgcolor="#D3D3D3">등급</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>JAVA </td>
              <td>상</td>
            </tr>
            <tr>
              <td>C</td>
              <td>중</td>
            </tr>
            <tr>
              <td>C++</td>
              <td>하</td>
            </tr>
           
          </tbody>
        </table>
        <br>
        <h4>참여 프로젝트</h4>
        <table class="prj">
          <thead>
            <tr>
              <th bgcolor="#D3D3D3">번호</th>
              <th bgcolor="#D3D3D3">프로젝트명</th>
              <th bgcolor="#D3D3D3">업무내용</th>
              <th bgcolor="#D3D3D3">PM</th>
              <th bgcolor="#D3D3D3">프로젝트 기간</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>프로젝트1</td>
              <td>프로젝트관리</td>
              <td>김가가</td>
              <td>2021.2.20 ~ 2021.5.31</td>
            </tr>
            <tr>
              <td>2</td>
              <td>프로젝트2</td>
              <td>프로젝트관리</td>
              <td>이나나</td>
              <td>2020.4.30 ~ 2020.7.25</td>
            </tr>
          </tbody>
        </table>
        <br>
        <br>
        <form action="EmpList.do" method="post" enctype="multipart/form-data">
        <div class="btnArea">
          <button class="btn btn-sm btn-primary" id="listBtn">목록</button>
          <button class="btn btn-sm btn-primary" id="changeBtn">수정</button>
          <button class="btn btn-sm btn-danger" id="delBtn">삭제</button>
	        </div>
	        </form>
      </div>
    </div>
  </div>
  <script src=" https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
    $(document).ready(function () {

      // 추가 버튼을 누르면 한 줄이 추가됨
      $("#addBtn").on("click", function () {
        $(".tech").append(
          '<tr>\
              <td><input type="checkbox" class="selBtn"></td>\
              <td>\
                <select name="tech" id="tech">\
                  <option value="">-기술-</option>\
                  <option value="JAVA">JAVA</option>\
                  <option value="C">C</option>\
                  <option value="ORACLE">ORACLE</option>\
                </select>\
              </td>\
              <td>\
                <select name="rank" id="rank">\
                  <option value="">-등급-</option>\
                  <option value="상">상</option>\
                  <option value="중">중</option>\
                  <option value="하">하</option>\
                </select>\
              </td>\
            </tr>'
        );

        //삭제 버튼을 누르면 선택한 행이 삭제됨
        $("#delBtn").on("click", function () {
          var checkTechs = $("[name='chkBtn']:checked");
          for (var i = checkTechs.length - 1; i > -1; i--) {
            checkTechs.eq(i).closest('tr').remove();
          }
        });
      });
    });
  </script>
</body>

</html>