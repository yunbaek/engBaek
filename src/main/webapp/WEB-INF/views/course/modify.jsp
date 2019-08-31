<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/adminSidebar.jsp"%>
<link rel="stylesheet" href="../../../resources/css/uploadStyle.css">

<form id="operForm" action="/course/modify">
  <input type="hidden" id="courseCode" name="courseCode" value="${course.courseCode }">
  <!-- 페이지 번호와 페이지 당 표시 개수 파라미터 추가 -->
  <input type="hidden" name="pageNum" value="${cri.pageNum }">
  <input type="hidden" name="amount" value="${cri.amount }">

  <!-- 검색 조건과 키워드 파라미터 추가 -->
  <input type="hidden" name="type" value="${cri.type }">
  <input type="hidden" name="keyword" value="${cri.keyword }">
</form>
<!-- /.panel-body -->


<!--/ Intro Single star /-->
<section class="intro-single">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h1 class="title-single">강좌 수정</h1>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="/">HOME</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              <a href="/course/list/">강좌 소개</a>
            </li>
          </ol>
        </nav>
      </div>
    </div>
    <br> <br>
    <!--/ News Single Star /-->
    <section class="news-single nav-arrow-b">
      <div class="container">
        <div class="row">
          <div class="form-comments">
            <form role="form" class="form-a" id="mainForm" method="post" action="/course/modify/">
              <input type="hidden" class="form-control" name="courseCode" value="${course.courseCode}">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputCourseName">강좌명</label>
                    <input type="text" name="courseName" class="form-control form-control-lg form-control-a" id="inputCourseName" placeholder="강좌명 *" value="${course.courseName }" required>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputClassroom">강의실</label>
                    <select class="form-control form-control-lg form-control-a" id="inputClassroom" name="classroomNo">
                      <option value="강의실" <c:if test='${course.classroomNo == 0}'>selected</c:if>>강의실</option>
                      <option value="301" <c:if test='${course.classroomNo == 301}'>selected</c:if>>301</option>
                      <option value="302" <c:if test='${course.classroomNo == 302}'>selected</c:if>>302</option>
                      <option value="303" <c:if test='${course.classroomNo == 303}'>selected</c:if>>303</option>
                      <option value="401" <c:if test='${course.classroomNo == 401}'>selected</c:if>>401</option>
                      <option value="402" <c:if test='${course.classroomNo == 402}'>selected</c:if>>402</option>
                      <option value="403" <c:if test='${course.classroomNo == 403}'>selected</c:if>>403</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputCourseType">유형</label>
                    <select class="form-control form-control-lg form-control-a" id="first" name="courseType" id="selOne" onchange="doChange(this, 'selTwo')">
                      <option value="default">Type</option>
                      <option value="토익" <c:if test='${course.courseType == "토익"}'>selected</c:if>>토익</option>
                      <option value="토스" <c:if test='${course.courseType == "토스"}'>selected</c:if>>토스</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputClassroom">레벨</label>
                    <select name="courseLevel" class="form-control form-control-lg form-control-a" id="selTwo">
                      <c:if test='${course.courseType == "토익"}'>
                        <option <c:if test='${course.courseLevel == "550"}'>selected</c:if>>550</option>
                        <option <c:if test='${course.courseLevel == "700"}'>selected</c:if>>700</option>
                        <option <c:if test='${course.courseLevel == "850"}'>selected</c:if>>850</option>
                      </c:if>
                      <c:if test='${course.courseType == "토스"}'>
                        <option <c:if test='${course.courseLevel == "5"}'>selected</c:if>>5</option>
                        <option <c:if test='${course.courseLevel == "6"}'>selected</c:if>>6</option>
                        <option <c:if test='${course.courseLevel == "7"}'>selected</c:if>>7</option>
                      </c:if>
                    </select>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="teacherId">강사 id</label>
                    <input type="text" class="form-control form-control-lg form-control-a" id="teacherId" placeholder="id" name="teacherId" value="${course.teacherId }">
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <br>
                    <button type="button" id="teacherIdInput" class="idCheck btn btn-a">id check</button>
                    <p class="result">
                      <span class="msg"></span>
                    </p>
                  </div>

                </div>

                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="infoInput">강좌 정보</label>
                    <textarea id="infoInput" class="form-control" placeholder="강좌 정보 *" name="courseInfo" cols="45" rows="8" required><c:out value="${course.courseInfo }" /></textarea>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="priceInput">가격</label>
                    <input type="number" value="${course.price }" class="form-control form-control-lg form-control-a" id="priceInput" placeholder="price" name="price" min="100000" step="10000">
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="courseTimeInput">시간</label>
                    <select class="form-control form-control-lg form-control-a" id="courseTimeInput" name="courseTime">
                      <option value="default">Time</option>
                      <option value="10:00 - 12:00" <c:if test='${course.courseTime == "10:00 - 12:00"}'>selected</c:if>>10:00 - 12:00</option>
                      <option value="12:00 - 14:00" <c:if test='${course.courseTime == "12:00 - 14:00"}'>selected</c:if>>12:00 - 14:00</option>
                      <option value="14:00 - 16:00" <c:if test='${course.courseTime == "14:00 - 16:00"}'>selected</c:if>>14:00 - 16:00</option>
                      <option value="16:00 - 18:00" <c:if test='${course.courseTime == "16:00 - 18:00"}'>selected</c:if>>16:00 - 18:00</option>
                      <option value="18:00 - 20:00" <c:if test='${course.courseTime == "18:00 - 20:00"}'>selected</c:if>>18:00 - 20:00</option>
                      <option value="20:00 - 22:00" <c:if test='${course.courseTime == "20:00 - 22:00"}'>selected</c:if>>20:00 - 22:00</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="startdayInput">개강일</label>
                    <input type="date" value="${course.courseStart }" class="form-control form-control-lg form-control-a" id="startdayInput" name="courseStart">
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="enddayInput">종강일</label>
                    <input type="date" value='${course.courseEnd}' class="form-control form-control-lg form-control-a" id="enddayInput" name="courseEnd">
                  </div>
                </div>
                <div class="col-md-12 mb-3 icheck-primary">
                  <div class="form-group">
                    <label for="startdayInput">요일</label><br>
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="mon" name="courseDay" value="월">
                      <label for="mon" class="custom-control-label">월요일 </label> <br>
                    </div>
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="tue" name="courseDay" value="화">
                      <label for="tue" class="custom-control-label">화요일 </label> <br>
                    </div>
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="wed" name="courseDay" value="수">
                      <label for="wed" class="custom-control-label">수요일 </label> <br>
                    </div>
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="thu" name="courseDay" value="목">
                      <label for="thu" class="custom-control-label">목요일 </label> <br>
                    </div>
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="fri" name="courseDay" value="금">
                      <label for="fri" class="custom-control-label">금요일 </label> <br>
                    </div>
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="sat" name="courseDay" value="토">
                      <label for="sat" class="custom-control-label">토요일 </label> <br>
                    </div>
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="sun" name="courseDay" value="일">
                      <label for="sun" class="custom-control-label">일요일 </label> <br>
                    </div>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="panel panel-default">
                    <div class="panel-heading">FILE ATTACH</div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                      <div class="form-group uploadDiv">
                        <div class='uploadDiv'>
                          <input type="file" name="uploadFile" multiple>
                        </div>

                        <!-- 섬네일 이미지 원본 표시 -->
                        <div class="bigPictureWrapper">
                          <div class="bigPicture"></div>
                        </div>
                        <!-- END 섬네일 이미지 원본 표시 -->

                        <!-- 업로드 결과 출력 -->
                        <div class="uploadResult">
                          <ul>
                          </ul>
                        </div>
                        <!-- END 업로드 결과 출력 -->
                      </div>
                    </div>
                    <!-- /.panel-body -->
                  </div>
                  <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <!-- /.row -->
                <div class="col-md-12">
                  <button type="submit" data-oper="modify" class="btn btn-a resultBtn">Modify</button>
                  <button type="submit" data-oper="list" class="btn btn-a resultBtn">Cancel</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <!--/ News Single End /-->
  </div>
</section>
<!--/ Intro Single End /-->

<script>
	//상위 셀렉트로 하위 셀렉트 제어하기
	function doChange(srcE, targetId) {
		var val = srcE.options[srcE.selectedIndex].value;
		var targetE = document.getElementById(targetId);
		removeAll(targetE);
		if (val == '토익') {
			$('#selTwo').append('<option <c:if test='${course.courseLevel == "550"}'>selected</c:if>>550</option>');
			$('#selTwo').append('<option <c:if test='${course.courseLevel == "700"}'>selected</c:if>>700</option>');
			$('#selTwo').append('<option <c:if test='${course.courseLevel == "850"}'>selected</c:if>>800</option>');
		} else if (val == '토스') {
			$('#selTwo').append('<option <c:if test='${course.courseLevel == "5"}'>selected</c:if>>5</option>');
			$('#selTwo').append('<option <c:if test='${course.courseLevel == "6"}'>selected</c:if>>6</option>');
			$('#selTwo').append('<option <c:if test='${course.courseLevel == "7"}'>selected</c:if>>7</option>');
		}
	}
	function addOption(value, e) {
		var o = new Option(value);
		try {
			e.add(o);
		} catch (ee) {
			e.add(o, null);
		}
	}
	function removeAll(e) {
		for (var i = 0, limit = e.options.length; i < limit - 1; ++i) {
			e.remove(1);
		}
	} // End select
	//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	$(".idCheck").click(function() {
		var query = {
			teacherId : $("#teacherId").val()
		};
		var teacherId = $("#teacherId").val()
		$.ajax({
			url : "/course/idCheck",
			type : "post",
			data : {
				teacherId : teacherId
			},
			dataType : "json",
			success : function(data) {
				if ($.trim(data) == 0) {
					$(".result .msg").text("사용 불가");
					$(".result .msg").attr("style", "color:#f00");
				} else {
					$(".result .msg").text("사용 가능");
					$(".result .msg").attr("style", "color:#00f");
				}
			}
		}); // ajax 끝
	}); // End id check
</script>
<script>
	$(function() {
		//첨부파일 목록 가져오기
		(function() {
			var courseCode = '<c:out value="${course.courseCode}"/>';
			console.log(courseCode);
			$.getJSON("/course/getAttachList", {
				courseCode : courseCode
			}, function(arr) {
				console.log('getAttachList----------------');
				console.log(arr);

				//첨부파일 목록
				if (!arr || arr.length == 0) {
					return;
				}
				var uploadUL = $('.uploadResult ul');
				var str = "";
				$(arr).each(function(i, obj) {
					//업로드 파일명 <li>추가
					if (obj.fileType) { //이미지인 경우
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.coursePictureUuid + "_" + obj.coursePictureName);
						str += "<li data-path='" + obj.uploadPath + "' " +
						   "data-uuid='" + obj.coursePictureUuid + "' " +
						   "data-filename='" + obj.coursePictureName + "'" +
						   "data-type='" + obj.fileType + "'>" + "<div><span>" + obj.coursePictureName + "</span>" + "<button type='button' " + 
					       "data-file='" + fileCallPath + "'" +
					       "data-type='image'" +
					       "class='btn btn-warning btn-circle'>" + "<i class='fa fa-times'></i></button><br>" + "<img src='/courseImages/display?fileName=" + fileCallPath + "'>" + "</div></li>";
					} else { //이미지가 아닌 경우
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.coursePictureUuid + "_" + obj.coursePictureName);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
						str += "<li data-path='" + obj.uploadPath + "' " +
						   "data-uuid='" + obj.coursePictureUuid + "' " +
						   "data-filename='" + obj.coursePictureName + "'" +
						   "data-type='" + obj.fileType + "'>" + "    <div><span>" + obj.coursePictureName + "</span>" + "<button type='button' " + 
					       "data-file='" + fileCallPath + "'" +
					       "data-type='image'" +
					       "class='btn btn-warning btn-circle'>" + "<i class='fa fa-times'></i></button><br>" + "<img src='/resources/img/attach.png'></div></li>";
					}
				});
				uploadUL.append(str);
			});//END getJSON()
			//X 버튼 이벤트 처리
			$('.uploadResult').on('click', 'button', function(e) {
				if (confirm('파일을 삭제하시겠습니까?')) {
					var targetLi = $(this).closest('li');
					targetLi.remove(); //해당 li 삭제
				}
			});
			//END X 표시 이벤트 처리
		})();//END 첨부파일 목록 가져오기

		var formObj = $("form");

		$('.resultBtn').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");
			console.log("operation : " + operation);

			if (operation === 'remove') { //삭제 버튼이 눌린 경우 
				formObj.attr("action", "/course/remove");
			} else if (operation === 'list') { //목록 버튼이 눌린 경우
				//페이지 번호와 게시물 개수 복사
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();

				//검색 조건과 키워드 복사
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				formObj.attr("action", "/course/list").attr("method", "get");
				formObj.empty(); //폼 태그 모든 내용을 지움

				//페이지 번호와 게시물 개수만 폼에 추가
				formObj.append(pageNumTag);
				formObj.append(amountTag);

				//검색 조건과 키워드 폼에 추가 
				formObj.append(typeTag);
				formObj.append(keywordTag);
			} else if (operation === 'modify') { //수정 버튼이 눌린 경우
				var str = "";
				$('.uploadResult ul li').each(function(i, obj) {
					var jobj = $(obj); //첨부 파일 정보 hidden 태그로 추가
					console.log('jobj : ' + obj);
					str += "<input type='hidden' " + "name='attachList[" + i + "].coursePictureName' " + "value='" + jobj.data("filename") + "'>";
					str += "<input type='hidden' " + "name='attachList[" + i + "].coursePictureUuid' " + "value='" + jobj.data("uuid") + "'>";
					str += "<input type='hidden' " + "name='attachList[" + i + "].uploadPath' " + "value='" + jobj.data("path") + "'>";
					str += "<input type='hidden' " + "name='attachList[" + i + "].fileType' " + "value='" + jobj.data("type") + "'>";
				});//END 첨부 파일 정보 hidden 태그로 추가
				formObj.append(str).submit(); //폼데이터와 함께 전송
			}
			formObj.submit();
		});//END 수정|삭제|목록 버튼 이벤트 처리

		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //확장자 제한 정규표현식
		var maxSize = 5242880; //파일 최대 업로드 크기 제한 5MB

		//확장자 및 파일 크기 확인 함수
		function checkExension(fileName, fileSize) {
			if (fileSize >= maxSize) { //파일 크기 확인
				alert("파일 사이즈 초과!"); //크기를 초과하면 알림 메시지 출력
				return false;
			}
			if (regex.test(fileName)) { //확장자 확인
				alert("업로드 불가 파일"); //제한 확장자인 경우 알림 메시지 출력
				return false
			}
			return true; //파일 크기 및 확장자 문제가 없는 경우
		}//END checkExension()

		//첨부파일 상태 변화 이벤트 핸들러 등록
		$("input[type='file']").change(function(e) {
			var formData = new FormData(); //가상의 <form> 태그

			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);

			//formData 객체에 선택한 파일 추가
			for (var i = 0; i < files.length; i++) {
				//확장자 및 파일 크기 확인
				if (!checkExension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}

			$.ajax({
				type : 'post',
				url : '/courseImages/courseUploadAjaxAction',
				data : formData,
				dataType : 'json',
				contentType : false,
				processData : false,
				success : function(result) {
					console.log(result); //콘솔로 결과 확인

					showUploadResult(result); //
				}
			})//END .ajax()
		});//END uploadBtn 이벤트 처리 

		//업로드 결과 출력 처리
		function showUploadResult(uploadResultArr) {
			if (!uploadResultArr || uploadResultArr.length == 0) {
				return;
			}
			var uploadUL = $('.uploadResult ul');
			var str = "";
			$(uploadResultArr).each(function(i, obj) {
				//업로드 파일명 <li>추가
				if (obj.fileType) { //이미지인 경우
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.coursePictureUuid + "_" + obj.coursePictureName);
					str += "<li data-path='" + obj.uploadPath + "' " +
					   "data-uuid='" + obj.coursePictureUuid + "' " +
					   "data-filename='" + obj.coursePictureName + "'" +
					   "data-type='" + obj.fileType + "'>" + "<div><span>" + obj.coursePictureName + "</span>" + "<button type='button' " + 
				       "data-file='" + fileCallPath + "'" +
				       "data-type='fileType'" +
				       "class='btn btn-warning btn-circle'>" + "<i class='fa fa-times'></i></button><br>" + "<img src='/courseImages/display?fileName=" + fileCallPath + "'>" + "</div></li>";
					console.log(str);
				} else { //이미지가 아닌 경우
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.coursePictureUuid + "_" + obj.coursePictureName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					str += "<li data-path='" + obj.uploadPath + "' " +
					   "data-uuid='" + obj.coursePictureUuid + "' " +
					   "data-filename='" + obj.coursePictureName + "'" +
					   "data-type='" + obj.fileType + "'>" + "<div><span>" + obj.coursePictureName + "</span>" + "<button type='button' " + 
				       "data-file='" + fileCallPath + "'" +
				       "data-type='file'" +
				       "class='btn btn-warning btn-circle'>" + "<i class='fa fa-times'></i></button><br>" + "<img src='/resources/img/attach.png'></div></li>";
					console.log(str);
				}
			});
			uploadUL.append(str);
		}//END showUploadResult()
	});
</script>

<%@ include file="../includes/footer.jsp"%>