package com.engbaek.domain;

import lombok.Data;

@Data
public class ClassStudentVO {
	
	private long rownum;
	private String name; //학생이름 , 선생님이름 
	private String gender; //성별
	private String phone; //연락처
	private String courseName; //강좌이름
	private String courseCode; //강좌 코드
	private String studentId; //학생 id
	private String courseStart; //개강일
}
