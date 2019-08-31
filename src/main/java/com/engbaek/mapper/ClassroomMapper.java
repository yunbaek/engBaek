package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.ClassroomVO;
import com.engbaek.domain.Criteria;

public interface ClassroomMapper {
	
	public int getTotalCount(Criteria cri);
	//public List<ClassroomVO> getListWithPaging(Criteria cri);
	public List<ClassroomVO> getList(Long classroomNo);

}
