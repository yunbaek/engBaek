package com.engbaek.domain;

import lombok.Data;

@Data
public class AdminVO {	//관리자
	private String adminId;	//관리자 id
	private String adminName;	//관리자 이름
	private String authNo;	//관리자 권한 코드
}
