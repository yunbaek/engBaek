package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PrivateQnaVO {	//일대일문의
	
	private long  privateQnaNo; //일대일문의 번호
	private String studentId; //학생ID
	private long  privateQnaReplyNo; //답글 번호 
	private String privateQnaTitle; //일대일문의 제목
	private String privateQnaContent; //일대일문의 내용
	private Date privateQnaRegdate; // 일대일문의 작성일 
}
