package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.ProfileAttachVO;

public interface ProfileAttachMapper {
	public void insert(ProfileAttachVO profileAttach);
	public void delete(Long teacherPno);
	public List<ProfileAttachVO> findByTeacherPno(Long teacherPno);
	public void deleteAll(Long teacherPno);
	public List<ProfileAttachVO> getOldFIles();

}
