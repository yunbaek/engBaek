package com.engbaek.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.engbaek.domain.ClassDataAttachVO;
import com.engbaek.domain.ClassDataVO;
import com.engbaek.domain.Criteria;
import com.engbaek.mapper.ClassDataMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ClassDataServiceImpl implements ClassDataService{

	private ClassDataMapper mapper; 
	
	 //수업자료&공지  총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}
	//수업자료&공지 게시판 목록
	@Override
	public List<ClassDataVO> getList(Long courseCode, Criteria cri) {
		log.info("getList with criteria: " + cri);
		return mapper.getList(courseCode);
	}
	 //수업자료&공지 게시물 등록 
	@Override	
	public void register(ClassDataVO classData) {
		log.info("register: " + classData);
		mapper.insertSelectKey(classData);
	}
	
	//수업자료&공지 게시물 상세 정보 
	@Override
	public ClassDataVO get(Long classDataNo) {
		log.info("get: " + classDataNo);
		return mapper.read(classDataNo);
	}
	 //수업자료&공지 게시물 수정
	@Override
	public boolean modify(ClassDataVO classData) {
		log.info("modify: " + classData);
		boolean modifyResult = mapper.update(classData) ==1;
		return modifyResult;
	}
	//수업자료&공지 게시물 삭제
	@Override
	public boolean remove(Long classDataNo) {
		log.info("remove: " + classDataNo);
		return mapper.delete(classDataNo) == 1;
	}
	//수업자료&공지 첨부파일 목록 
	@Override
	public List<ClassDataAttachVO> getAttachList(Long classDataNo) {
		return null;
	}
	
	//강의 중인 강좌 목록 
	@Override
	public List<ClassDataVO> getClassList(Criteria cri) {
		log.info("get classData Class List");
		return mapper.getClassList();
	}

}
