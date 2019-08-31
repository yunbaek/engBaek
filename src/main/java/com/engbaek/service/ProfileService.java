package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ProfileAttachVO;
import com.engbaek.domain.ProfileJoinVO;
import com.engbaek.domain.ProfileVO;


public interface ProfileService {


	public int getTotal(Criteria cri);
	public List<ProfileJoinVO> getList(Criteria cri);
	public List<ProfileJoinVO> selectId();
	public void register(ProfileVO  profile);
	public ProfileVO get(Long teacherPno);
	public boolean modify(ProfileVO  profile);
	public boolean remove(Long teacherPno);
	public int idCheck(String teacherId);
	
	public List<ProfileAttachVO> getAttachList(Long teacherPno);
}
