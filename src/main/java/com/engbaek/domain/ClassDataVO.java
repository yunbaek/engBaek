package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ClassDataVO {	//수업자료 & 공지사항

	private long classDataNo;	//수업자료 & 공지 번호
	private long courseCode; // 강좌 코드
	private String teacherId; // 강사ID
	private String classDataTitle; //수업자료 & 공지사항 제목
	private String classDataContent; //수업자료 & 공지사항 내용
	private Date classDataRegdate; //작성일
	
	private long rownum; //행번호
	private String courseName; //강좌명
	private String courseStart; //개강일 
	private String name; //강사명 
	
}
