package com.fly.pro2.DAO;


import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.pro2.DTO.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	public int create(MemberDTO memberDTO) {
		int result = myBatis.insert("member.create", memberDTO);
		return result;
	} // member join
	
	public int read1(MemberDTO memberDTO) {
		System.out.println(memberDTO.getId());
		int result = myBatis.selectOne("member.one", memberDTO);
		System.out.println(result);
		return result;
	}// id check
	
	
	public int login(MemberDTO memberDTO) {
		boolean check = false;
		System.out.println(memberDTO.getId() + ", " + memberDTO.getPw());
		
		int result = myBatis.selectOne("member.login", memberDTO);
		System.out.println(result);
		
		if (result == 1) {
			return result;
		} else {
			return result;
		}	
		
	}//login
	
	
	public int logout(HttpSession session) {
		int result = 1;
		return result;
	}//logout

	
	public MemberDTO meminfou(MemberDTO memberDTO) {
		MemberDTO dto = myBatis.selectOne("member.info", memberDTO);
		System.out.println(dto);
		return dto; 
	}//info commit
	
	
	public int update(MemberDTO memberDTO) {
		System.out.println(memberDTO.getId());
		int result = myBatis.update("member.update", memberDTO);
		return result;
	}
	
	public int delete(MemberDTO memberDTO) {
		int result = myBatis.delete("member.delete", memberDTO);
		System.out.println(result);
		return result;
	}
	
	
	public int numConfirm(MemberDTO memberDTO) {
		int result = myBatis.update("member.num", memberDTO);
		return result;
	}// 본인인증 
	

	// -------------------------- 아래 부터는 암호화 파트 ----------------------------------------
	
	
	// 암호화 회원가입
	public int sInsert(MemberDTO memberDTO) {
		int result = myBatis.insert("member.create", memberDTO);
		return result;
	}
	
	public String sLogin(MemberDTO memberDTO) {
		String getPw= myBatis.selectOne("member.sLogin", memberDTO);
		System.out.println("DB 결과 : " + getPw);
		if (getPw != null) {
			return getPw;
		} else {
			return "null";
		}
	}
	
	// -------------------------- kakao 계정 ----------------------------------------
	
	public int kakao_check(MemberDTO memberDTO) {
		int result = myBatis.selectOne("member.kakao_check", memberDTO);
		System.out.println(result);
		return result;
	}
	
	
	public MemberDTO kakao_login(MemberDTO memberDTO) {
		MemberDTO result = myBatis.selectOne("member.kakao_login", memberDTO);
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}	//class
