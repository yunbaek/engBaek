<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ taglib prefix="sec" 
		   uri="http://www.springframework.org/security/tags"%>      
<%@ include file="../includes/header.jsp" %>

  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="title-single-box">
            <h1 class="title-single">학생 개인정보</h1>
          </div> <!-- title-single-box -->
        </div>		
      </div>
    </div>
  </section>
 

<section>
	<div class="container">
            <div class="col-sm-6 col-md-offset-3">
                <form role="form" method="post" action="/student/info" onsubmit="return validate()">
                	<div class="form-group">
                        <label for="name">성명</label>
                        <input class="form-control" name='studentId' value="${student.name}" readonly="readonly">
                    </div>
	                <div class="form-group">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" name="studentId" id="studentId" value="${student.studentId}" readonly="readonly">
                    </div>                    
                    <div class="form-group">
                        <label for="pw">비밀번호</label>
                        <input class="form-control" id="pw" name="pw" value="${student.pw}">
                    </div>
                    <div class="form-group">
                        <label for="pw">비밀번호 확인</label>
                        <input type="password" class="form-control" id="pwChk" name="pwChk" placeholder="비밀번호를 재입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="birthday">생일</label>
                        <input type="date" class="form-control" name="birthday" value="${student.birthday}" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="InputEmail">이메일 주소</label><br>
                        <input type="text" name="email1" id="email1" style="width:200px" value="${student.email1}"> @ 
                        <input type="text" name="email2" id="email2" style="width:120px;" value="${student.email2}">
                        	<select style="width:120px;margin-right:10px" name="email2" id="selectEmail">
                        	<option value="1" selected>직접입력</option> 
                        	<option value="naver.com">naver.com</option> 
                        	<option value="hanmail.net">hanmail.net</option> 
                        	<option value="gmail.com">gmail.com</option> </select>

                    </div>
                    <div class="form-group">
                        <label for="phone">휴대폰 번호</label><Br>
                        <input type="tel" class="form-control" name="phone" value="${student.phone}">
                    </div>
                    <div class="form-group">
                        <label for="address">주소</label>
                        <input type="text" class="form-control" name="address" value="${student.address}">
                    </div>
                    <input type="hidden" name="authNo" value="ROLE_S">

                    <div class="form-group text-center">
                    	<button type="button" class="btn btn-secondary" onclick="history.back()">이전</button>
                        <button type="submit" class="btn btn-success">다음</button>
                       
                    </div>
                </form>
            </div>
            </div>
        </section>
        

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$('#selectEmail').change(function() {
	$("#selectEmail option:selected").each(function() {
		if($(this).val() == '1'){//직접입력일 경우 
			$("#email2").val('');//값 초기화
			$("#email2").attr("disabled", false);//활성화 
		}
		else{//직접입력이 아닐경우 
			$("#email2").val($(this).text());//선택값 입력 
			$("#email2").attr("disabled", true);//비활성화 
		}
	});
});
	
$(".idCheckStudent").click(function() {

    var query = {
        studentId : $("#studentId").val()
    };

    var studentId = $("#studentId").val()

    $.ajax({
        url : "/join/idCheckStudent",
        type : "post",
        data : {
            studentId : studentId
        },
        dataType : "json",
        success : function(data) {
            if ($.trim(data) != 0) {
                $(".result .msg").text("사용 불가");
                $(".result .msg").attr("style", "color:#f00");
            } else {
                $(".result .msg").text("사용 가능");
                $(".result .msg").attr("style", "color:#00f");
            }
        }
    }); // ajax 끝
}); // End id check

function validate() {
    var re = /^[a-zA-Z0-9]{5,15}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    var id = document.getElementById("studentId");
    var pw = document.getElementById("pw");

    if(!check(re,id,"아이디는 5~15자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(!check(re,pw,"패스워드는 5~15자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(join.pw.value != join.checkpw.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        join.checkpw.value = "";
        join.checkpw.focus();
        return false;
    }

}

function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    //return false;
}
</script>
</body>
</html>