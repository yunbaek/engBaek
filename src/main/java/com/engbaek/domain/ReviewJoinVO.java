package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewJoinVO {
	
	///Review
	  private long reviewNo;
	  private String teacherId; 
	  private long courseCode;
	  private String studentId;  
	  private String reviewTitle; 
	  private String reviewContent;
	  private Date reviewRegdate; 
	  
	  private String courseName; //강좌이름
	  private String courseStart; //개강일
	  private String courseEnd; //종강일
	  
	  //선생님 이름
		private String  name;
	  
	  
}
