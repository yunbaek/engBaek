package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.PrivateQnaReplyVO;

public interface PrivateQnaReplyService {
	
	//1:1문의 답글 수정 
	public boolean modify(PrivateQnaReplyVO privateQnaReply);
	
	//1:1문의 답글 상세보기 
	public PrivateQnaReplyVO read(Long privateQnaReplyNo);
	
	//1:1문의 답글 삭제 
	public boolean remove(Long privateQnaReplyNo);
	
	//1:1문의 답글 등록 
	public void register(PrivateQnaReplyVO privateQnaReply);
	
	//1:1답글 출력
	public List<PrivateQnaReplyVO> getList(); 
}
