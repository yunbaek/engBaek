<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadAjax.jsp</title>


<!-- Favicons -->
<link href="../../../resources/img/favicon.png" rel="icon">
<link href="../../../resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="../../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="../../../resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../../../resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="../../../resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<script src="../../../resources/lib/jquery/jquery.min.js"></script>
<script src="../../../resources/lib/jquery/jquery-migrate.min.js"></script>
<script src="../../../resources/lib/popper/popper.min.js"></script>
<script src="../../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../../../resources/lib/easing/easing.min.js"></script>
<script src="../../../resources/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="../../../resources/lib/scrollreveal/scrollreveal.min.js"></script>
<!-- Contact Form JavaScript File -->
<script src="../../../resources/contactform/contactform.js"></script>

<!-- Template Main Javascript File -->
<script src="../../../resources/js/main.js"></script>
<style>
.uploadResult {
	width: 100%;
	background-color: lightgray;
}

.uploadResult ul {
	display: flex;
	justify-content: center;
	flex-flow: row;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	justify-content: center;
	display: none;
	align-items: center;
	top: 0%;
	z-index: 100;
	width: 100%;
	height: 100%;
	background-color: lightgray;
	background: rgba(255 255 255 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}
</style>
</head>
<body>
	<h3>Spring file upload with AJAX</h3>
	<div class="inputArea uploadDiv">
		<label for="gdsImg">이미지</label> 
		<input type="file" id="gdsImg" name="uploadFile" />
		<div class="select_img">
			<img src="" />
		</div>
	</div>
	
	<!-- 섬네일 이미지 원본 표시 -->
	<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
	</div>
	<!-- END 섬네일 이미지 원본 표시 -->
	<button id="uploadBtn">upload</button>
<script>
	$("#gdsImg").change(function() {
		if (this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".select_img img").attr("src", data.target.result).width(500);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
	
</script>

	<!-- jQuery 지정  -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" 
			integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" 
			crossorigin="anonymous"></script>
	<script>
	$(function(){
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");	//확장자 제한 정규표현식
		var maxSize = 5242880;	//파일 최대 업로드 크기 제한 5MB
		
		//확장자 및 파일 크기 확인 함수
		function checkExension(fileName, fileSize){
			if(fileSize >= maxSize) {	//파일 크기 확인
				alert("파일 사이즈 초과!");	//크기를 초과하면 알림 메시지 출력
				return false;
			}
			if(regex.test(fileName)) {	//확장자 확인
				alert("업로드 불가 파일");	//제한 확장자인 경우 알림 메시지 출력
				return false
			}
			return true;	//파일 크기 및 확장자 문제가 없는 경우
		}//END checkExension()
		
		//업로드 영역 복사
		var cloneObj = $(".uploadDiv").clone();
		
		//아이디가 uploadBtn에게 click 이벤트 핸들러 등록
		$('#uploadBtn').on('click', function(e){
			var formData = new FormData();	//가상의 <form> 태그
			
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			
			//formData 객체에 선택한 파일 추가
			for(var i=0 ; i<files.length ; i++){
				//확장자 및 파일 크기 확인
				if(!checkExension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				type : 'post',
				url :'/images/uploadAjaxAction',
				data : formData,
				dataType : 'json',
				contentType : false,
				processData : false,
				success : function(result){
					console.log(result);	//콘솔로 결과 확인
					
					showUploadedFile(result); //
					
					//복사해 둔 div를 이용하여 업로드 영역 초기화
					$('.uploadDiv').html(cloneObj.html());
				}
			})//END .ajax()
		});//END uploadBtn 이벤트 처리 
		
		//업로드 결과 출력 처리
		var uploadResult = $('.uploadResult ul');
		function showUploadedFile(uploadResultArr){
			var str = "";
			$(uploadResultArr).each(function(i, obj){
				//업로드 파일명 <li>추가
				if(!obj.image){	//이미지가 아니면 다운로드 링크 작성
					var fileCallPath 
					= encodeURIComponent(obj.uploadPath + 
										 "/" + obj.uuid  + "_" +
										 obj.fileName);
 			/*		str += "<li><img src='/resources/img/attach.png'>"+
								obj.fileName + "</li>"; */
					str += "<li><a href='/download?fileName="+ 
									fileCallPath + "'>"+
						        "<img src='/resources/img/attach.png'>"+
									obj.fileName + "</a> " +
								"<span data-file='" + fileCallPath + "'" +
								"      data-type='file'>X</span></li>";
				} else {		//이미지인 경우
					//섬네일 파일명 인코딩 처리
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid  + "_" + obj.fileName);
					//원본 이미지 경로 및 파일명
					var originPath = obj.uploadPath + "\\" + obj.uuid  + "_" + obj.fileName;
					// 경로 구분자 \로 /로 변경
					originPath = originPath.replace(new RegExp(/\\/g), "/");
					
					str += "<li><a href=\"javascript:showImage('" + 
									originPath +"')\">" + 
							    "<img src='/display?fileName=" 
								+ fileCallPath + "'></a> "+
								"<span data-file='" + fileCallPath + "'" +
								"      data-type='image'>X</span></li>";
				}
			});
			uploadResult.append(str);
		}//END showUploadedFile()
		
		//X 표시 이벤트 처리
		$('.uploadResult').on('click', 'span', function(e){
			var targetFile = $(this).data('file');
			var type	   = $(this).data('type');
			
			$.ajax({
				type : 'post',
				url :'/deleteFile',
				data : {fileName:targetFile, type:type} ,
				dataType : 'text',
				success : function(result){
					alert(result);
				}
			})//END .ajax()
		});
		//END X 표시 이벤트 처리
		
		//원본 이미지 숨기기 처리
		$('.bigPictureWrapper').on('click', function(e){
			$(".bigPicture").animate({ width:'0%', height:'0%'}, 1000);
			setTimeout(()=>{ $(this).hide(); }, 1000);
		});//END 원본 이미지 숨기기 처리
	});//END $
	
	//원본 이미지 표시 함수
	function showImage(fileCallPath){
//		alert(fileCallPath);
		//화면 가운데에 보이기
		$('.bigPictureWrapper').css('display', 'flex').show();
		
		//이미지 및 효과 추가
		$('.bigPicture').html("<img src='/display?fileName=" + 
								encodeURI(fileCallPath) + "'>")
						.animate( { width:'100%', height:'100%'}, 1000);
	}//END showImage()
	</script>

</body>

</html>








