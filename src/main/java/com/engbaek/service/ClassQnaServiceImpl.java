package com.engbaek.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.engbaek.domain.ClassQnaVO;
import com.engbaek.domain.Criteria;
import com.engbaek.mapper.ClassQnaMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ClassQnaServiceImpl implements ClassQnaService{

	private ClassQnaMapper mapper;
	
	//강의별 Q&A 총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		log.info("get Total count");
		return mapper.getTotalCount(cri);
	}

	//강의별 Q&A 목록 
	@Override	
	public List<ClassQnaVO> getList(Long courseCode, Criteria cri) {
		log.info("getList with criteria: " + cri);
		return mapper.getList(courseCode);
		//return mapper.getListWithPaging(cri);			
	}

	//(학생)강의별 Q&A 등록하기
	@Override
	public void register(ClassQnaVO classQna) {
		log.info("register: " + classQna);
		mapper.insertSelectKey(classQna);
	}
	//강의별 Q&A 상세조회 
	@Override
	public ClassQnaVO get(Long classQnaNo) {
		log.info("get: " + classQnaNo);
		
		return mapper.read(classQnaNo);
	}
	//강의별 Q&A 수정 
	@Override
	public boolean modify(ClassQnaVO classQna) {
		log.info("modify: " + classQna);
		boolean modifyResult = mapper.update(classQna) ==1;
		return modifyResult;
	}
	//강의별 Q&A 삭제 
	@Transactional
	@Override
	public boolean remove(Long classQnaNo) {
		log.info("remove: " + classQnaNo);
		return mapper.delete(classQnaNo) == 1;
	}

	//강의중인 강좌 목록 
	@Override
	public List<ClassQnaVO> getQnaClassList(Criteria cri) {
		log.info("get Qna Class List");
		return mapper.getQnaClassList();
	}

}
