package com.engbaek.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.ProfileJoinVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProfileMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ProfileMapper mapper;

//	@Test
//	public void testGetListWithMap() {
//		ProfileVO profile = mapper.selectOneProfile(1L);
//		log.info(profile);
//	
//	}

//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(profile -> log.info(profile));
//		
//	}

//	@Test
//	public void testInsertSelectKey() {
//		ProfileVO profile = new ProfileVO();
//		profile.setTeacherId("tc1");
//		profile.setTeacherSubject("toiec850");
//		profile.setTeacherProfile("체고의 강사");
//		profile.setTeacherProfilePicture("사진 없음");
//		profile.setTeacherProfileUuid("사진 없음");
//
//	
//		mapper.insertSelectKey(profile);
//		
//		log.info(profile);
//	}
//	
//	@Test
//	public void testRead() {
//		//존재하는 게시물 번호로 테스트
//		ProfileVO profile = mapper.selectOneProfile(1L);
//		
//		log.info(profile);
//	}
//	
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT : " + mapper.delete(3L));
//	}

//	@Test 
//	public void testUpdate() {
//		ProfileVO profile = new ProfileVO();
//		profile.setTeacherPno(3L);
//		profile.setTeacherId("tc2");
//		profile.setTeacherSubject("토익700");
//		profile.setTeacherProfile("수정된 소개");
//		profile.setTeacherProfilePicture("사진 수정");
//		profile.setTeacherProfileUuid("사진 수정");
//		
//		int count = mapper.update(profile);
//		
//		log.info(count);
//	}

	@Test
	public void testPaging() {
		Criteria cri = new Criteria();

		cri.setPageNum(1);
		cri.setAmount(5);

		List<ProfileJoinVO> list = mapper.getListWithPaging(cri);
		list.forEach(profile -> log.info(profile));
	}

//	@Test
//	public void testSearch() {
//		Criteria cri = new Criteria();
//		
//		cri.setKeyword("미");
//		cri.setType("A");
//		
//		List<ProfileJoinVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(profile -> log.info(profile));
//	}
	
//	@Test
//	public void testIdCheck() {
//		int result = mapper.idCheck("tc3");
//		log.info("result(tc3) : " + result);
//		result = mapper.idCheck("tc4");
//		log.info("result(tc4) : " + result);
//		
//	}
}
