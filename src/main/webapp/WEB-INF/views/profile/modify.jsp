<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/adminSidebar.jsp"%>
<link rel="stylesheet" href="../../../resources/css/uploadStyle.css">

<form id="operForm" action="/profile/modify">
  <input type="hidden" id="teacherPno" name="teacherPno" value="${profile.teacherPno }">
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
          <h1 class="title-single">강사소개 수정</h1>
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
            <form role="form" id="#mainForm" class="form-a" method="post" action="/profile/modify">
            <input type="hidden" id="teacherPno" name="teacherPno" value="${profile.teacherPno }">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="inputTeacherId">강사 ID</label>
                    <select id="teacherName" class="form-control form-control-lg form-control-a" name="teacherId">
                      <option value="${profile.teacherVO.teacherId}">${profile.teacherVO.name}(${profile.teacherVO.teacherId })</option>
                      <c:forEach items="${profileList}" var="profile">
                        <option value="${profile.teacherId}">${profile.name}(${profile.teacherId })</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="infoInput">강사 정보</label>
                    <textarea id="infoInput" class="form-control" placeholder="강사 정보 *" name="teacherProfile" cols="45" rows="8" required><c:out value="${profile.teacherProfile }"/></textarea>
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
	$(function() {
		//첨부파일 목록 가져오기
		(function() {
			var teacherPno = '<c:out value="${profile.teacherPno}"/>';
			console.log(teacherPno);
			$.getJSON("/profile/getAttachList", {
				teacherPno : teacherPno
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
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.teacherProfileUuid + "_" + obj.teacherProfilePicture);

						str += "<li data-path='" + obj.uploadPath + "' " +
						   "data-uuid='" + obj.teacherProfileUuid + "' " +
						   "data-filename='" + obj.teacherProfilePicture + "'"   +
						   "data-type='" + obj.fileType + "'>" + "<div><span>" + obj.teacherProfilePicture + "</span>" + "<button type='button' " + 
					       "data-file='" + fileCallPath + "'" +
					       "data-type='image'" +
					       "class='btn btn-warning btn-circle'>" + "<i class='fa fa-times'></i></button><br>" + "<img src='/profileImages/display?fileName=" + fileCallPath + "'>" + "</div></li>";
					} else { //이미지가 아닌 경우
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.teacherProfileUuid + "_" + obj.teacherProfilePicture);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
						str += "<li data-path='" + obj.uploadPath + "' " 	+
						   "data-uuid='" + obj.teacherProfileUuid + "' " 			+
						   "data-filename='" + obj.teacherProfilePicture + "'" 	+
						   "data-type='" + obj.fileType + "'>" + "    <div><span>" + obj.teacherProfilePicture + "</span>" + "<button type='button' " + 
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
				formObj.attr("action", "/profile/remove");
			} else if (operation === 'list') { //목록 버튼이 눌린 경우
			//			self.location = "/board/list";	
			//			return;

				//페이지 번호와 게시물 개수 복사
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();

				//검색 조건과 키워드 복사
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();

				formObj.attr("action", "/profile/list").attr("method", "get");
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
					str += "<input type='hidden' " + "name='attachList[" + i + "].teacherProfilePicture' " + "value='" + jobj.data("filename") + "'>";
					str += "<input type='hidden' " + "name='attachList[" + i + "].teacherProfileUuid' " + "value='" + jobj.data("uuid") + "'>";
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
				url : '/profileImages/profileUploadAjaxAction',
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
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.teacherProfileUuid + "_" + obj.teacherProfilePicture);

					str += "<li data-path='" + obj.uploadPath + "' " +
					   "data-uuid='" + obj.teacherProfileUuid + "' " +
					   "data-filename='" + obj.teacherProfilePicture + "'" +
					   "data-type='" + obj.fileType + "'>" + "<div><span>" + obj.teacherProfilePicture + "</span>" + "<button type='button' " + 
				       "data-file='" + fileCallPath + "'" +
				       "data-type='fileType'" +
				       "class='btn btn-warning btn-circle'>" + "<i class='fa fa-times'></i></button><br>" + "<img src='/profileImages/display?fileName=" + fileCallPath + "'>" + "</div></li>";
					console.log(str);
				} else { //이미지가 아닌 경우
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.teacherProfileUuid + "_" + obj.teacherProfilePicture);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					str += "<li data-path='" + obj.uploadPath + "' " 	+
					   "data-uuid='" + obj.teacherProfileUuid + "' " 			+
					   "data-filename='" + obj.teacherProfilePicture + "'" 	+
					   "data-type='" + obj.fileType + "'>" + "<div><span>" + obj.teacherProfilePicture + "</span>" + "<button type='button' " + 
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