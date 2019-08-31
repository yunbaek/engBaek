package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FaqVO {	//faq 

	private long faqNo; //faq번호
	private String adminId;//관리자ID
	private String faqTitle; //faq 제목
	private String faqContent; //faq 답변내용
	private Date faqRegdate; //작성일
	
}
