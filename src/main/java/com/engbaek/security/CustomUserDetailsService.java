package com.engbaek.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.engbaek.domain.MemberVO;
import com.engbaek.mapper.MemberMapper;
import com.engbaek.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		log.warn("사용자 id : " + userid);
		
		//username은 userid를 의미함
		MemberVO vo = memberMapper.read(userid);
		
		log.warn("member mapper : " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}


}
