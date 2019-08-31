package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.PrivateQnaReplyVO;

public interface PrivateQnaReplyMapper {


	
	//1:1문의 게시판 페이징 
	public List<PrivateQnaReplyVO> getList();
	
	//1:1문의 수정 
	public int update(PrivateQnaReplyVO privateQna);
		
	//1:1문의 삭제 
	public int delete(Long privateQnaReplyNo);
	
	//1:1문의 읽기 
	public PrivateQnaReplyVO read(Long  privateQnaReplyNo);
	
	//게시물 번호 사용자에게 보이게 하기 
	public Integer insertSelectKey(PrivateQnaReplyVO  privateQnaReply);
}
