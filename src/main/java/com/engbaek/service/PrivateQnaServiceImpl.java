package com.engbaek.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PrivateQnaVO;
import com.engbaek.mapper.PrivateQnaMapper;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PrivateQnaServiceImpl implements PrivateQnaService {

	@Setter(onMethod_ = @Autowired)
	private PrivateQnaMapper mapper;
	
	//1:1문의 총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal");
		return mapper.getTotalCount(cri);
	}
	
	//1:1문의 게시판 목록
	@Override
	public List<PrivateQnaVO> getList(Criteria cri) {
		log.info("getList with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}

	//1:1문의 게시물 등록 
	@Override
	public void register(PrivateQnaVO privateQna) {
		log.info("register : " + privateQna);
		mapper.insertSelectKey(privateQna);
	}
	
	//1:1문의 게시물 상세 보기 
	@Override
	public PrivateQnaVO read(Long privateQnaNo) {
		return mapper.read(privateQnaNo);
	}

	//1:1문의 게시물 수정
	@Override
	public boolean modify(PrivateQnaVO privateQna) {
		log.info("modify : " +privateQna);
		boolean modifyResult = mapper.update(privateQna) == 1;
		return modifyResult;
	}
	
	//1:1문의 게시물 삭제 
	@Override
	public boolean remove(Long privateQnaNo) {
		log.info("remove : " +privateQnaNo);
		boolean removeResult = mapper.delete(privateQnaNo) == 1;
		return removeResult;
	}



}
