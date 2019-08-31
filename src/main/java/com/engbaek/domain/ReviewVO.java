package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	  private long reviewNo;
	  private String teacherId; 
	  private long courseCode;
	  private String studentId;  
	  private String reviewTitle; 
	  private String reviewContent;
	  private Date reviewRegdate; 
	  
}
