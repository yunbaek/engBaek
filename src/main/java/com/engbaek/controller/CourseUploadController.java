package com.engbaek.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.engbaek.domain.CourseAttachVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import net.sf.jmimemagic.Magic;
import net.sf.jmimemagic.MagicMatch;

@Log4j
@Controller
@RequestMapping("/courseImages/*")
public class CourseUploadController {

	// 첨부 파일 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		try {
			File file = new File("/Users/bky/upload/" + // 원래 파일명으로 디코딩
					URLDecoder.decode(fileName, "UTF-8"));
			file.delete(); // 파일 삭제

			if (type.equals("image")) { // 이미지의 경우 원본 이미지 삭제
				// 원본 파일명으로 변환
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				file = new File(largeFileName);
				file.delete(); // 원본 이미지 삭제
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	// 업로드 시점의 연/월/일 폴더 경로 문자열 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	// 업로드 파일 검사 - 이미지 파일 여부
	private boolean checkImageType(File file) {

		try {
			MagicMatch match = Magic.getMagicMatch(file, false);
			// 이미지 파일이면 true 반환
			return match.getMimeType().contains("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 일반 파일 다운로드
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName, @RequestHeader("User-Agent") String userAgent) {
		log.info("download file : " + fileName);
		Resource resource = new FileSystemResource("/Users/bky/upload/" + fileName);
		log.info("resource : " + resource);
		if (resource.exists() == false) { // resource가 없으면 404반환
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		ResponseEntity<Resource> result = null;
		String resourceName = resource.getFilename();// 파일명 가져오기

		// UUID 잘라내기
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);

		try {
			HttpHeaders header = new HttpHeaders();

			String downloadName = null;
			if (userAgent.contains("Trident")) { // IE의 경우
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
			} else if (userAgent.contains("Edge")) { // Edge의 경우
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			} else { // Chrome의 경우
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1"); // 한글 깨짐 방지
			}

			header.add("Content-Disposition", "attachment; filename=" + downloadName);
			result = new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 섬네일 이미지 데이터 전송
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		File file = new File("/Users/bky/upload/" + fileName);
		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			log.info("disply");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	@PostMapping("/courseUploadAjaxAction")
	@ResponseBody
	public ResponseEntity<List<CourseAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		List<CourseAttachVO> list = new ArrayList<>();
		log.info("uploadFormAction");
		log.info("getFolder : " + getFolder());
		String uploadFolder = "/Users/bky/upload/"; // 업로드 경로

		// 업로드 경로 = c:\\upload 폴더 밑에 연\월\일 폴더로 생성
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("uploadPath : " + uploadPath);

		// uploadPath가 없으면 폴더 생성
		if (!uploadPath.exists()) {
			uploadPath.mkdirs(); // 연\월\일 폴더 한꺼번에 생성
		}

		for (MultipartFile m : uploadFile) {
			log.info("-------------------------");
			log.info("upload file name : " + m.getOriginalFilename());
			log.info("upload file size : " + m.getSize());

			String uploadFileName = m.getOriginalFilename();
			CourseAttachVO courseAttach = new CourseAttachVO();
			courseAttach.setCoursePictureName(uploadFileName); // 1.업로드 파일명 저장

			// IE의 경우 경로를 제거하고 파일명만 저장
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			// UUID 이용 파일명 중복 방지 처리
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			log.info(uploadPath);
			log.info(uploadFileName);

			File saveFile = new File(uploadPath, uploadFileName);

			try {
				m.transferTo(saveFile); // 파일 업로드
				courseAttach.setCoursePictureUuid(uuid.toString()); // 2.UUID 값 저장
				courseAttach.setUploadPath(getFolder()); // 3.업로드 경로 저장
				// 이미지 파일이면 섬네일 이미지 파일 생성
				if (checkImageType(saveFile) == true) {
					courseAttach.setFileType(true); // 4.이미지 여부 저장
					// 섬네일 이미지 파일명 = s_ + 업로드파일명
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					// 가로 100 * 세로 100 섬네일 이미지 생성
					Thumbnailator.createThumbnail(m.getInputStream(), thumbnail, 500, 500);
					thumbnail.close();
				} // END 섬네일 이미지 생성
				list.add(courseAttach);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} // END 업로드
		return new ResponseEntity<>(list, HttpStatus.OK);
	}// END uploadAjaxPost

	@GetMapping("/courseUploadAjax") // AJAX 방식 업로드 화면 이동
	public void uploadAjax() {
		log.info("upload ajax");
	}

	@PostMapping("/uploadFormAction") // 업로드 처리
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		log.info("uploadFormAction");

		String uploadFolder = "/Users/bky/upload/"; // 업로드 경로

		for (MultipartFile m : uploadFile) {
			log.info("-------------------------");
			log.info("upload file name : " + m.getOriginalFilename());
			log.info("upload file size : " + m.getSize());

			File saveFile = new File(uploadFolder, m.getOriginalFilename());

			try {
				m.transferTo(saveFile); // 파일 업로드
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@GetMapping("/uploadForm") // 업로드 화면 이동
	public void uploadForm() {
		log.info("upload form");
	}

}
