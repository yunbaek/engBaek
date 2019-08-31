package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentJoinVO {

	
	private long paymentNo; //결제 번호
	private long courseCode; //강좌 코드
	private String studentId; //학생 ID
	private String paymentMethod; //결제 수단
	private long paymentPrice; //결제 금액
	private Date paymentDate; //결제일시
	private String paymentState; //결제 상태
	
	
	
	/////////합칠것들~~
	private String courseName; //강좌이름
	private String courseStart; //개강일
	private String courseEnd; //종강일
	private long price;//강좌가격 
	
}
