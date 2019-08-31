package com.engbaek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engbaek.domain.PrivateQnaReplyVO;
import com.engbaek.mapper.PrivateQnaReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class PrivateQnaReplyServiceImpl implements PrivateQnaReplyService {

	@Setter(onMethod_ = @Autowired)
	private PrivateQnaReplyMapper mapper;
	
	//1:1 답글 수정
	@Override
	public boolean modify(PrivateQnaReplyVO privateQnaReply) {
		log.info("modify : " +privateQnaReply);
		boolean modifyResult = mapper.update(privateQnaReply) == 1;
		return modifyResult;
	}

	//1:1 답글 게시물 상세 보기 
	@Override
	public PrivateQnaReplyVO read(Long privateQnaReplyNo) {
		return mapper.read(privateQnaReplyNo);
	}

	//1:1 답글 삭제 
	@Override
	public boolean remove(Long privateQnaReplyNo) {
		log.info("remove : " +privateQnaReplyNo);
		boolean removeResult = mapper.delete(privateQnaReplyNo) == 1;
		return removeResult;
	}

	//1:1답글 등록 
	@Override
	public void register(PrivateQnaReplyVO privateQnaReply) {
		log.info("register : " + privateQnaReply);
		mapper.insertSelectKey(privateQnaReply);

	}

	@Override
	public List<PrivateQnaReplyVO> getList() {
		log.info("getList with criteria : ");
		return mapper.getList();
	}

	

}
