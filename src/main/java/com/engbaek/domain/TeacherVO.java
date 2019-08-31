package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TeacherVO {

	private String teacherId;
	private String name;
	private String pw; 
	private Date birthday;
	private String email1;
	private String email2;
	private String phone;
	private String gender;
	private String address;
	private Date regdate;
	private String career;
	private String authNo; 
	
}
