package com.engbaek.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String username;
	private String auth;
	
	private List<AuthVO> authList;
}
