package com.engbaek.domain;

import java.util.List;

import lombok.Data;

@Data
public class ProfileJoinVO {
	
	private long teacherPno; //강사소개 코드
	private String teacherId; //강사ID
	private String teacherSubject; //담당과목
	private String teacherProfile; //강사 소개내용
	
	//join
	private String name;
	private String email1;
	private String email2;
	private String career;
	
	private String teacherProfilePicture;
	private String teacherProfileUuid;
	private String uploadPath;
	private boolean fileType;
	
	private List<ProfileAttachVO> attachList;

}
