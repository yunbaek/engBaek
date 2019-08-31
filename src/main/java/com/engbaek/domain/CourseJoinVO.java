package com.engbaek.domain;

import java.util.List;

import lombok.Data;

@Data
public class CourseJoinVO {
	
	private Long courseCode; // 강좌 코드
	private String teacherId; // 강사 ID
	private Long classroomNo; //강의실 번호
	private String courseName; //강좌이름
	private String courseType; //과목구분
	private String courseLevel; //과목단계
	private String courseInfo; //강좌 소개 내용
	private String courseDay; //강의 요일
	private String courseTime; //강의 시간
	private String courseStart; //개강일
	private String courseEnd; //종강일
	
	private String name;
	private String email1;
	private String email2;
	
	private Long price;
	
	private String coursePictureName;
	private String coursePictureUuid;
	private String uploadPath;
	private boolean fileType;
	
	private List<CourseAttachVO> attachList;

}
