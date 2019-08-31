package com.engbaek.domain;

import lombok.Data;

@Data
public class ProfileAttachJoinVO {
	private Long teacherPno;
	private String teacherProfilePicture;
	private String teacherProfileUuid;
	private String uploadPath;
	private boolean fileType;
	
	private String teacherId; //강사ID
	private String teacherSubject; //담당과목
	private String teacherProfile; //강사 소개내용
	
}
