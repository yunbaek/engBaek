package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class StudentVO {
	private String studentId;  
	private String name;        
	private String pw;        
	private Date birthday;   
	private String email1;     
	private String email2;      
	private String phone;       
	private String gender;      
	private String address;     
	private Date regdate;   
	private String authNo;   
}
