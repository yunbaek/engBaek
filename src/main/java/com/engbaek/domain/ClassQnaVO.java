package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ClassQnaVO {	//q&a게시판
	
	private long rownum;
	private long classQnaNo;	//q&a 게시글 번호
	private long courseCode;	//강좌 코드
	private String studentId;	//학생id
	private String teacherId;	//강사id
	private String classQnaTitle; //q&a제목
	private String classQnaContent; //q&a내용
	private Date classQnaRegdate;	//q&a 작성일
	
	private String name; //선새님 이름 
	private String courseName; //강좌 이름 
	private String courseStart; //강좌 개강일 
	private int replyCnt; //댓글 갯수
		
}
