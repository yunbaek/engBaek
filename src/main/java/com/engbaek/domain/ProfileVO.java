package com.engbaek.domain;

import java.util.List;

import lombok.Data;

@Data
public class ProfileVO { //강사소개
	
	private long teacherPno; //강사소개 코드
	private String teacherId; //강사ID
	private String teacherSubject; //담당과목
	private String teacherProfile; //강사 소개내용
	
	private TeacherVO teacherVO;
	
	private List<ProfileAttachVO> attachList;
}
