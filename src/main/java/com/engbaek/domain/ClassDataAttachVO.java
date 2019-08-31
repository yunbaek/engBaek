package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ClassDataAttachVO {

	private String uuid;
	private String fileName;
	private long classDataNo;
	private Date attachRegdate;
		
}
