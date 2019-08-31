<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/adminSidebar.jsp"%>

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
          <h1 class="title-single">${profile.teacherVO.name }</h1>
          <span class="color-text-a">${profile.teacherSubject }</span>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="/">Home</a>
            </li>
            <li class="breadcrumb-item">
              <a href="/profile/list">Profile</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">${profile.teacherVO.name }</li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</section>
<!--/ Intro Single End /-->

<form id="mainForm">
  <!--/ Agent Single Star /-->
  <section class="agent-single">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="row">
            <div class="col-md-6">
              <div class="agent-avatar-box uploadResult list-unstyled">
                <ul class="uploadList list-unstyled" id="haha">
                </ul>
              </div>
            </div>
            <div class="col-md-5 section-md-t3">
              <div class="agent-info-box">
                <div class="agent-title">
                  <div class="title-box-d">
                    <h3 class="title-d">${profile.teacherVO.name }</h3>
                  </div>
                </div>
                <div class="agent-content mb-3">
                  <p class="content-d color-text-a">${profile.teacherProfile }</p>
                  <div class="info-agents color-a">
                    <p>
                      <strong>담당 과목 : </strong>
                      <span class="color-text-a"> ${profile.teacherSubject } </span>
                    </p>
                    <p>
                      <strong>Email: </strong>
                      <span class="color-text-a"> ${profile.teacherVO.email1 }@${profile.teacherVO.email2 }</span>
                    </p>
                    <p>
                      <strong>경력 : </strong>
                      <span class="color-text-a"> ${profile.teacherVO.career }</span>
                    </p>
                    <p>
                      <strong>강사 소개 : </strong>
                      <span class="color-text-a"> ${profile.teacherProfile }</span>
                    </p>
                  </div>
                </div>
                <div class="socials-footer">
                  <ul class="list-inline">
                    <li class="list-inline-item">
                      <a href="#" class="link-one"> <i class="fa fa-facebook" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one"> <i class="fa fa-twitter" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one"> <i class="fa fa-instagram" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one"> <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                      </a>
                    </li>
                    <li class="list-inline-item">
                      <a href="#" class="link-one"> <i class="fa fa-dribbble" aria-hidden="true"></i>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br>
      <br>
      <!--/ Property Single End /-->
      <button type="submit" data-oper="modify" class="btn btn-a resultBtn">Modify</button>
      <!-- 수정 처리 -->
      <button type="submit" data-oper="remove" class="btn btn-a resultBtn">Remove</button>
      <!-- 삭제 처리 -->
      <button data-oper='list' class="btn btn-a resultBtn">List</button>
      <!-- 목록 페이지 이동 -->
    </div>
  </section>
</form>

<script>
	$(function() {
		var formObj = $("form");

		$('.resultBtn').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");
			console.log("operation : " + operation);

			if (operation === 'remove') { //삭제 버튼이 눌린 경우 
				var deleteConfirm = confirm("정말 삭제하시겠습니까?")
				if (deleteConfirm == true) {
					alert("삭제가 완료되었습니다.")
					var teacherPnoTag = $("input[name='teacherPno']").clone();
					formObj.append(courseCodeTag);

					formObj.attr("action", "/profile/remove").attr("method", "post");
				} else {
					return;
				}

			} else if (operation === 'list') { //목록 버튼이 눌린 경우
				//				self.location = "/course/list";	
				//				return;

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

			} else {
				var teacherPnoTag = $("input[name='teacherPno']").clone();

				//페이지 번호와 게시물 개수 복사
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();

				//검색 조건과 키워드 복사
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();

				formObj.attr("action", "/profile/modify").attr("method", "get");

				formObj.append(teacherPnoTag);
				//페이지 번호와 게시물 개수만 폼에 추가
				formObj.append(pageNumTag);
				formObj.append(amountTag);

				//검색 조건과 키워드 폼에 추가 
				formObj.append(typeTag);
				formObj.append(keywordTag); 
			}

			formObj.submit();
		});
	});
</script>
<script>
	(function() { //첨부파일 목록 가져오기
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

			var uploadUL = $('.uploadResult');
			var str = "";
			$(arr).each(function(i, obj) {
				//업로드 파일명 <li>추가
				if (obj.fileType) { //이미지인 경우
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.teacherProfileUuid + "_" + obj.teacherProfilePicture);

					str += "<li data-path='" + obj.uploadPath + "' " +
						   "data-uuid='" + obj.teacherProfileUuid + "' " +
						   "data-filename='" + obj.teacherProfilePicture + "'" +
						   "data-type='" + obj.fileType + "'>" + "<div><img src='/courseImages/display?fileName=" + fileCallPath + "' width=450px>" + "</div></li>";
					console.log(str);
					console.log(fileCallPath)
				} else { //이미지가 아닌 경우
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.teacherProfileUuid + "_" + obj.teacherProfilePicture);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					str += "<li data-path='" + obj.uploadPath + "' " 	+
						   "data-uuid='" + obj.teacherProfileUuid + "' " 			+
						   "data-filename='" + obj.teacherProfilePicture + "'" 	+
						   "data-type='" + obj.fileType + "'>" + "<div><span>" + obj.teacherProfilePicture + "</span><br>" + "<img src='../../../resources/img/attach.png'></div></li>";
				}
			});
			uploadUL.append(str);
		});//END getJSON()
	})();//END 첨부파일 목록 가져오기

	//첨부파일 클릭 이벤트 처리
	$('.uploadResult').on('click', 'li', function(e) {
		console.log('uploadResult click');

		var obj = $(this);
		var path = encodeURIComponent(obj.data('path') + "/" + obj.data('uuid') + "_" + obj.data('filename'));
		if (obj.data('type')) { //이미지이면 
			//showImage() 호출
			console.log('path : ' + path);
			showImage(path);
		} else { //이미지가 아니면
			//다운로드 처리
			self.location = "/download?fileName=" + path;
		}
	});//END 첨부파일 클릭 이벤트 처리

	//원본 이미지 표시 함수
	function showImage(fileCallPath) {
		$('.bigPictureWrapper').css('display', 'flex').show();

		//이미지 및 효과 추가
		$('.bigPicture').html("<img src='/profileImages/display?fileName=" + fileCallPath + "'>").animate({
			width : '100%',
			height : '100%'
		}, 1000);
	}//END showImage()

	//원본 이미지 숨기기 처리
	$('.bigPictureWrapper').on('click', function(e) {
		$(".bigPicture").animate({
			width : '0%',
			height : '0%'
		}, 1000);
		//setTimeout(()=>{ $(this).hide(); }, 1000);
		setTimeout(function() {
			$('.bigPictureWrapper').hide();
		}, 1000);
	});//END 원본 이미지 숨기기 처리
</script>

<%@ include file="../includes/footer.jsp"%>
