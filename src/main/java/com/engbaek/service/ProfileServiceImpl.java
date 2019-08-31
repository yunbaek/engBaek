package com.engbaek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ProfileAttachVO;
import com.engbaek.domain.ProfileJoinVO;
import com.engbaek.domain.ProfileVO;
import com.engbaek.mapper.ProfileAttachMapper;
import com.engbaek.mapper.ProfileMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProfileServiceImpl implements ProfileService {

	@Setter(onMethod_ = @Autowired)
	private ProfileMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private ProfileAttachMapper attachMapper;

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ProfileJoinVO> getList(Criteria cri) {
		log.info("getList with Criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Transactional
	@Override
	public void register(ProfileVO profile) {
		log.info("register : " + profile);
		mapper.insertSelectKey(profile);

		// 첨부파일이 없는 경우
		if (profile.getAttachList() == null || profile.getAttachList().size() <= 0) {
			return;
		}
		// 첨부파일이 있는 경우
		profile.getAttachList().forEach(attach -> {
			attach.setTeacherPno(profile.getTeacherPno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public ProfileVO get(Long teacherPno) {
		log.info("read : " + teacherPno);
		return mapper.selectOneProfile(teacherPno);
	}

	@Transactional
	@Override
	public boolean modify(ProfileVO profile) {
		log.info("modify : " + profile);
		
		attachMapper.deleteAll(profile.getTeacherPno());
		boolean modifyResult = mapper.update(profile) == 1;
		log.info("attach?");
		if(modifyResult 							//수정 성공
				&& profile.getAttachList() != null	//첨부파일 목록이 있으면
				&& profile.getAttachList().size() > 0) {
			profile.getAttachList().forEach(attach -> {
				attach.setTeacherPno(profile.getTeacherPno());
				log.info("attach OK");
				attachMapper.insert(attach);	//첨부파일 등록
			});
		}
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long teacherPno) {
		log.info("remove : " + teacherPno);
		attachMapper.deleteAll(teacherPno);
		boolean removeResult = mapper.delete(teacherPno) == 1;
		return removeResult;
	}

	@Override
	public int idCheck(String teacherId) {
		log.info("id check : " + teacherId);
		return mapper.idCheck(teacherId);
	}

	@Override
	public List<ProfileAttachVO> getAttachList(Long teacherPno) {
		log.info("get Attach List by teacherPno : " + teacherPno);
		return attachMapper.findByTeacherPno(teacherPno); 
	}

	@Override
	public List<ProfileJoinVO> selectId() {
		log.info("get list without cri");
		return mapper.selectId();
	}

}
