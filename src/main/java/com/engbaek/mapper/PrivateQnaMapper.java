package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PrivateQnaVO;

public interface PrivateQnaMapper {


	//1:1문의 총 게시물 수  
	public int getTotalCount(Criteria cri);
	
	//1:1문의 게시판 페이징 
	public List<PrivateQnaVO> getListWithPaging(Criteria cri);
	
	//1:1문의 수정 
	public int update(PrivateQnaVO privateQna);
		
	//1:1문의 삭제 
	public int delete(Long  privateQnaNo);
	
	//1:1문의 읽기 
	public PrivateQnaVO read(Long  privateQnaNo);
	
	//게시물 번호 사용자에게 보이게 하기 
	public Integer insertSelectKey(PrivateQnaVO  privateQna);
}
