package com.engbaek.domain;

import lombok.Data;

@Data
public class ProfileAttachVO {
	private Long teacherPno;
	private String teacherProfilePicture;
	private String teacherProfileUuid;
	private String uploadPath;
	private boolean fileType;
}
