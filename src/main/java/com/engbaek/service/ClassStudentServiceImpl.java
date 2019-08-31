package com.engbaek.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.engbaek.domain.ClassStudentVO;
import com.engbaek.domain.Criteria;
import com.engbaek.mapper.ClassStudentMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ClassStudentServiceImpl implements ClassStudentService {
	
	private ClassStudentMapper mapper;
	
	//강의중인 강좌 목록
	@Override
	public List<ClassStudentVO> getStudentClassList(Criteria cri) {
		log.info("get StudentList Class List");
		return mapper.getStudentClassList();
	}

	@Override
	public List<ClassStudentVO> getStudentList(Long courseCode, Criteria cri) {
		log.info("get studentList with Criteria" + cri);
		return mapper.getStudentList(courseCode);
	}

}
