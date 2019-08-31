package com.engbaek.domain;

import lombok.Data;

@Data
public class CourseAttachVO {
	
	private String coursePictureName;
	private String coursePictureUuid;
	private String uploadPath;
	private boolean fileType;
	
	private long courseCode;
}
