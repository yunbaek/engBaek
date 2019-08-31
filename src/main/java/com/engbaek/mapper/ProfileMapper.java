package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ProfileJoinVO;
import com.engbaek.domain.ProfileVO;

public interface ProfileMapper {
	// 강사소개 게시글 수
	public int getTotalCount(Criteria cri);

	// 강사소개 페이징
	public List<ProfileJoinVO> getListWithPaging(Criteria cri);

	// 강사소개 수정
	public int update(ProfileVO profile);

	// 강사소개 삭제
	public int delete(Long teacherPno);

	// 강사소개 조회
	public ProfileVO read(Long teacherPno);

	// 강사소개 등록
	public Integer insertSelectKey(ProfileVO profile);

	// 강사소개 목록
	public List<ProfileJoinVO> selectId();
	
	// 강사소개 조회 join(result map 이용)
	public ProfileVO selectOneProfile(Long teacherPno);

	// 강사소개 등록 id체크
	public int idCheck(String teacherId);
	
}
