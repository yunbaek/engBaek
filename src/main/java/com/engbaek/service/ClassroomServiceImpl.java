package com.engbaek.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.engbaek.domain.ClassroomVO;
import com.engbaek.domain.Criteria;
import com.engbaek.mapper.ClassroomMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ClassroomServiceImpl implements ClassroomService {
	
	private ClassroomMapper mapper;
	
	//강의실 게시판 총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}
	//강의실 목록 조회 
	@Override
	public List<ClassroomVO> getList(Long classroomNo,Criteria cri) {
		log.info("getList with criteria: " + cri);
		return mapper.getList(classroomNo);
	}

}
