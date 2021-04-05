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
  <title>사원 등록</title>
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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

		<script>
		    function execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		 
		                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
		 
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		                if(fullRoadAddr !== ''){
		                    fullRoadAddr += extraRoadAddr;
		                }
		 
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('addr2').value = fullRoadAddr;
		                document.getElementById('addr3').focus();
		            }
		        }).open();
		    }
		</script>



<body>
  <div class="container">
    <div class="row">
      <h1 id="title">사원 등록</h1>
      <div class="col-sm-3">
        <img src="../11.png" alt="사진">
        <button class="btn btn-sm btn-primary">변경</button>
      </div>
    <!--  <form action="saveEmp.do" method="post" enctype="multipart/form-data"> -->
      <div class="col-sm-9">
        <table>
          <tbody>
            <tr>
              <td class="col-sm-2" bgcolor="#D3D3D3">사원번호</td>
              <td class="col-sm-2"><input type="text" name='num'/></td>
              <td class="col-sm-2" bgcolor="#D3D3D3">직책</td>
              <td class="col-sm-2"><input type="text" name='pos'/></td>
            </tr>
            <tr>
              <td bgcolor="#D3D3D3">한글이름</td>
              <td><input type="text" name='kname'/></td>
              <td bgcolor="#D3D3D3">부서</td>
              <td><input type="text" name='dept'/></td>
            </tr>
            <tr>
              <td bgcolor="#D3D3D3">영문이름</td>
              <td><input type="text" name='ename'/></td>
              <td bgcolor="#D3D3D3">경력</td>
              <td><input type="text" name='career'/></td>
            </tr>
            <tr>
              <td bgcolor="#D3D3D3">우편번호</td>
              <td><input type="text" size="10" name='addr1'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-sm btn-primary"
              onclick="javascript:execDaumPostcode();">검색</button></td>
              <td bgcolor="#D3D3D3">등급</td>
              <td>
				<select name="level" id="level">
                  <option value="">-선택-</option>
                  <option value="3">고급</option>
                  <option value="2">중급</option>
                  <option value="1">초급</option>
                </select></td>
            </tr>
            <tr>
              <td bgcolor="#D3D3D3">도로명주소</td>
              <td><input type="text" name='addr2'/></td>
              <td bgcolor="#D3D3D3">입사일</td>
              <td><input type="text" name='join'/></td>
            </tr>
            <tr>
              <td bgcolor="#D3D3D3">상세주소</td>
              <td><input type="text" name='addr3'/></td>
              <td bgcolor="#D3D3D3">자격증</td>
              <td><input type="text" name='cert'/></td>
            </tr>
          </tbody>
        </table><br>
        <h4>사용가능 기술</h4>
        <table class="tech">
          <thead>
            <tr>
              <th bgcolor="#D3D3D3">선택</th>
              <th bgcolor="#D3D3D3">기술명</th>
              <th bgcolor="#D3D3D3">등급</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><input type="checkbox" class="selBtn" name="chkBtn"></td>
              <td>
                JAVA
              </td>
              <td>
                상
              </td>
            </tr>
            <tr>
              <td><input type="checkbox" class="selBtn" name="chkBtn"></td>
              <td>
                C
              </td>
              <td>
                중
              </td>
            </tr>
            <tr>
              <td><input type="checkbox" class="selBtn" name="chkBtn"></td>
              <td>
                <select name="tech" id="tech">
                  <option value="">-기술-</option>
                  <option value="JAVA">JAVA</option>
                  <option value="C">C</option>
                  <option value="ORACLE">ORACLE</option>
                </select>
              </td>
              <td>
                <select name="rank" id="rank">
                  <option value="">-등급-</option>
                  <option value="상">상</option>
                  <option value="중">중</option>
                  <option value="하">하</option>
                </select>
              </td>
            </tr>
          </tbody>
        </table>
        <div class="btnArea">
          <button class="btn btn-sm btn-primary" id="addBtn">추가</button>
          <button class="btn btn-sm btn-danger" id="delBtn">삭제</button>
        </div>
        <h4>참여 프로젝트</h4>
        <table class="prj">
          <thead>
            <tr>
              <th bgcolor="#D3D3D3">프로젝트번호</th>
              <th bgcolor="#D3D3D3">프로젝트명</th>
              <th bgcolor="#D3D3D3">PM</th>
              <th bgcolor="#D3D3D3">프로젝트 기간</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><input type="text" size="12" name='pnum'/></td>
              <td><input type="text" size="12" name='pname'/></td>
              <td><input type="text" size="12" name='pmname'/></td>
              <td><input type="text" size="12" name='pdate'/></td>
            </tr>
            <tr>
              <td><input type="text" size="12" name='pnum'/></td>
              <td><input type="text" size="12" name='pname'/></td>
              <td><input type="text" size="12" name='pmname'/></td>
              <td><input type="text" size="12" name='pdate'/></td>
            </tr>
          </tbody>
        </table>
       <div class="btnArea">
          <button class="btn btn-sm btn-primary" id="addBtn1">추가</button>
         <!--  <button class="btn btn-sm btn-danger" id="delBtn1">삭제</button>-->
        </div> 
                <!--  </form>-->
        <br>
        <br>
        <form action="saveEmp.do" method="post" enctype="multipart/form-data">
        <div class="btnArea">
          <button class="btn btn-sm btn-primary" id="regBtn">등록</button>
          <button class="btn btn-sm btn-danger" id="cancelBtn">취소</button>
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
              <td><input type="checkbox" class="selBtn" name="chkBtn"></td>\
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
       });
        
         $("#addBtn1").on("click", function () {
        $(".prj").append(
        '<tr><td><input type="text" size="12"></td>\
        <td><input type="text" size="12"></td>\
        <td><input type="text" size="12"></td>\
        <td><input type="text" size="12"></td></tr>')
      });

         // 삭제
     	$("#delBtn").on("click", function() {
    		var checkList = $("[name='chkBtn']:checked");
    		for(var i=checkList.length -1; i>-1; i--){
    			checkList.eq(i).closest('tr').remove();
    		}
    	});
    }); 
  </script>
</body>

</html>