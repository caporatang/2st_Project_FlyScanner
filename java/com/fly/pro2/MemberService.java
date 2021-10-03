package com.fly.pro2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fly.pro2.DAO.MemberDAO;
import com.fly.pro2.DTO.MemberDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;
	
	// 암호화 
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	
	public int create(MemberDTO memberDTO) {
		memberDTO.setPw(pwEncoder.encode(memberDTO.getPw()));
		int result = dao.sInsert(memberDTO);
		return result;
		
	}
	
	
	public boolean sLogin(MemberDTO memberDTO) {
		String getPw = dao.sLogin(memberDTO);
		boolean result = false;
		if (pwEncoder.matches(memberDTO.getPw(), getPw)) {
			result = true;
		}
		return result;
		
	}
	
	
}
