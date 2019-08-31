package com.engbaek.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class ClassUploadController extends UploadController {
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

}
