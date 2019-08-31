<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/adminSidebar.jsp"%>
<link rel="stylesheet" href="../../../resources/css/uploadStyle.css">

<!--/ Intro Single star /-->
<section class="intro-single">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h1 class="title-single">강좌 등록</h1>
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
            <form role="form" class="form-a" method="post" action="/course/register">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputCourseName">강좌명</label>
                    <input type="text" name="courseName" class="form-control form-control-lg form-control-a" id="inputCourseName" placeholder="강좌명 *" required>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputClassroom">강의실</label>
                    <select class="form-control form-control-lg form-control-a" id="inputClassroom" name="classroomNo">
                      <option value="default">강의실</option>
                      <option value="301">301호</option>
                      <option value="302">302호</option>
                      <option value="303">303호</option>
                      <option value="304">401호</option>
                      <option value="305">402호</option>
                      <option value="306">403호</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputCourseType">유형</label>
                    <select class="form-control form-control-lg form-control-a" id="first" name="courseType" id="selOne" onchange="doChange(this, 'selTwo')">
                      <option value="default">Type</option>
                      <option value="토익">토익</option>
                      <option value="토스">토스</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputClassroom">레벨</label>
                    <select name="courseLevel" class="form-control form-control-lg form-control-a" id="selTwo">
                      <option value="default">Level</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="teacherId">강사 id</label>
                    <input type="text" class="form-control form-control-lg form-control-a" id="teacherId" placeholder="id" name="teacherId">
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
                    <textarea id="infoInput" class="form-control" placeholder="강좌 정보 *" name="courseInfo" cols="45" rows="8" required></textarea>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="priceInput">가격</label>
                    <input type="number" class="form-control form-control-lg form-control-a" id="priceInput" placeholder="price" name="price" min="100000" step="10000">
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="courseTimeInput">시간</label>
                    <select class="form-control form-control-lg form-control-a" id="courseTimeInput" name="courseTime">
                      <option value="default">Time</option>
                      <option value="10:00 - 12:00">10:00 - 12:00</option>
                      <option value="12:00 - 14:00">12:00 - 14:00</option>
                      <option value="14:00 - 16:00">14:00 - 16:00</option>
                      <option value="16:00 - 18:00">16:00 - 18:00</option>
                      <option value="18:00 - 20:00">18:00 - 20:00</option>
                      <option value="20:00 - 22:00">20:00 - 22:00</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="startdayInput">개강일</label>
                    <input type="date" class="form-control form-control-lg form-control-a" id="startdayInput" name="courseStart">
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="enddayInput">종강일</label>
                    <input type="date" class="form-control form-control-lg form-control-a" id="enddayInput" name="courseEnd">
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
                <div class="col-md-12">
                  <button type="submit" class="btn btn-a">Submit</button>
                  <button type="reset" class="btn btn-a">Reset</button>
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
			addOption('550', targetE);
			addOption('700', targetE);
			addOption('850', targetE);
		} else if (val == '토스') {
			addOption('5', targetE);
			addOption('6', targetE);
			addOption('7', targetE);
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
	$(document).ready(function(e) {

		var formObj = $("form[role='form']");

		//Submit Button Event
		$("button[type='submit']").on("click", function(e) {
			//Submit Button 기본 동작 막기
			e.preventDefault();
			console.log("submit clicked");

			var str = "";

			$(".uploadResult ul li").each(function(i, obj) {
				var jobj = $(obj);
				console.dir(jobj);

				str += "<input type='hidden' " + "name='attachList[" + i + "].coursePictureName' " + "value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' " + "name='attachList[" + i + "].coursePictureUuid' " + "value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' " + "name='attachList[" + i + "].uploadPath' " + "value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' " + "name='attachList[" + i + "].fileType' " + "value='" + jobj.data("type") + "'>";
			});
			console.log(str);
			formObj.append(str).submit();

		});

		var regex = new RegExp("(.*?)\.(jpg|png|jpeg)$"); //확장자 제한 정규표현식
		var maxSize = 5242880; //파일 최대 업로드 크기 제한 5MB

		function checkExension(fileName, fileSize) {
			if (fileSize >= maxSize) { //파일 크기 확인
				alert("파일 사이즈 초과!"); //크기를 초과하면 알림 메시지 출력
				return false;
			}
			if (regex.test(fileName) == false) { //확장자 확인
				alert("업로드는 jpg, png, jpeg 형식의 이미지만 가능합니다."); //제한 확장자인 경우 알림 메시지 출력
				return false;
			}
			return true; //파일 크기 및 확장자 문제가 없는 경우
		}//END checkExension()

		//첨부파일 상태 변경 이벤트 핸들러 등록
		$("input[type='file']").change(function(e) {
			var formData = new FormData(); //가상의 <form> 태그

			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;

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
					showUploadResult(result); //업로드 결과 처리 함수
				}
			})//END .ajax()

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

						//섬네일 파일명 인코딩 처리
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.coursePictureUuid + "_" + obj.coursePictureName);
						//원본 이미지 경로 및 파일명
						var originPath = obj.uploadPath + "\\" + obj.coursePictureUuid + "_" + obj.coursePictureName;
						// 경로 구분자 \를 /로 변경
						originPath = originPath.replace(new RegExp(/\\/g), "/");

						str += "<li data-path='"+obj.uploadPath+"'";

				str += " data-uuid='"+obj.coursePictureUuid+"' data-filename='"+obj.coursePictureName+"' data-type='"+obj.fileType+"'";

				str += "><div>";
						str += "<span> " + obj.coursePictureName + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'>";
						str += "<i class='fa fa-times'></i></button><br>";
						str += "<img src='/courseImages/display?fileName=" + fileCallPath + "'>";
						str += "</div></li>"
						console.log(str);

					} else { //이미지가 아니면 다운로드 링크 작성

						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.coursePictureUuid + "_" + obj.coursePictureName);

						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
						str += "<li ";

				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.coursePictureUuid+"' data-filename='"+obj.coursePictureName+"' data-type='"+obj.fileType+"' ><div>";
						str += "<span> " + obj.coursePictureName + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/resources/img/attach.png'></a>";
						str += "</div></li>";

						console.log(str);
					}
				});

				uploadUL.append(str);
			}//END showUploadResult()

			//X버튼 클릭 이벤트
			$(".uploadResult").on("click", "button", function(e) {
				console.log("delete file");

				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				var targetLi = $(this).closest("li");

				$.ajax({
					url : '/courseImages/deleteFile',
					data : {
						fileName : targetFile,
						type : type
					},
					dataType : 'text',
					type : 'POST',
					success : function(result) {
						alert(result);
						targetLi.remove();
					}
				})//$.ajax
			})// X button Event

		});//END change function

	})//END $
</script>

<%@ include file="../includes/footer.jsp"%>