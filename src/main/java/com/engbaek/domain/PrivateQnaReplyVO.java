package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PrivateQnaReplyVO { //일대일 답글
	
	private long privateQnaReplyNo; //일대일 문의 답글 번호
	private long privateQnaNo; //일대일 문의 번호

	private String adminId; //관리자 ID
	private String privateQnaReplyTitle; //일대일 문의 답글 제목
	private String privateQnaReplyContent; //일대일 문의 답글 내용
	private Date privateQnaReplyRegdate; //일대일 문의 답글 작성일 
	
}
