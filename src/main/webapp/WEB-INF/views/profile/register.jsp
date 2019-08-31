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
          <h1 class="title-single">강사소개 등록</h1>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="/">HOME</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              <a href="/profile/list/">강사소개</a>
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
            <form role="form" class="form-a" method="post" action="/profile/register">

              <div class="row">
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputTeacherId">강사 ID</label>
                    <select id="teacherName" class="form-control form-control-lg form-control-a" name="teacherId">
                      <c:forEach items="${profileList}" var="profile">
                        <option value="${profile.teacherId}">${profile.name}(${profile.teacherId })</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="infoInput">강사 정보</label>
                    <textarea id="infoInput" class="form-control" placeholder="강사 정보 *" name="teacherProfile" cols="45" rows="8" required></textarea>
                  </div>
                </div>

                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="inputSubject">강의 과목</label>
                    <div class="grid-option">
                      <input type="checkbox" name="teacherSubject" value="토익-550">
                      토익-550&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="checkbox" name="teacherSubject" value="토익-700">
                      토익-700&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="checkbox" name="teacherSubject" value="토익-850">
                      토익-850&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="checkbox" name="teacherSubject" value="토스-5">
                      토스-5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="checkbox" name="teacherSubject" value="토스-6">
                      토스-6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="checkbox" name="teacherSubject" value="토스-7">
                      토스-7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                  </div>
                </div>

                <div class="col-md-12 mb-3">
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
                  <button type="submit" class="btn btn-a">Register</button>
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

				str += "<input type='hidden' " + "name='attachList[" + i + "].teacherProfilePicture' " + "value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' " + "name='attachList[" + i + "].teacherProfileUuid' " + "value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' " + "name='attachList[" + i + "].uploadPath' " + "value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' " + "name='attachList[" + i + "].fileType' " + "value='" + jobj.data("type") + "'>";
			});
			console.log(str);
			formObj.append(str).submit();

		});

		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //확장자 제한 정규표현식
		var maxSize = 5242880; //파일 최대 업로드 크기 제한 5MB

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
				url : '/profileImages/profileUploadAjaxAction',
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
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.teacherProfileUuid + "_" + obj.teacherProfilePicture);
						//원본 이미지 경로 및 파일명
						var originPath = obj.uploadPath + "\\" + obj.teacherProfileUuid + "_" + obj.teacherProfilePicture;
						// 경로 구분자 \를 /로 변경
						originPath = originPath.replace(new RegExp(/\\/g), "/");

						str += "<li data-path='"+obj.uploadPath+"'";
						str += " data-uuid='"+obj.teacherProfileUuid+"' data-filename='"+obj.teacherProfilePicture+"' data-type='"+obj.fileType+"'";
						str += "><div>";
						str += "<span> " + obj.teacherProfilePicture + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'>";
						str += "<i class='fa fa-times'></i></button><br>";
						str += "<img src='/profileImages/display?fileName=" + fileCallPath + "'>";
						str += "</div></li>"
						console.log(str);

					} else { //이미지가 아니면 다운로드 링크 작성

						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.teacherProfileUuid + "_" + obj.teacherProfilePicture);

						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
						str += "<li ";
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.teacherProfileUuid+"' data-filename='"+obj.teacherProfilePicture+"' data-type='"+obj.fileType+"' ><div>";
						str += "<span> " + obj.teacherProfilePicture + "</span>";
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
					url : '/profileImages/deleteFile',
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