package com.fly.pro2;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.pro2.DAO.MemberDAO;
import com.fly.pro2.DTO.MemberDTO;

@Controller
public class SecurityController {
	
	@Autowired
	MemberService service;
	
	
	@RequestMapping("sInsert.member")
	public String insert(MemberDTO memberDTO) {
		int result = service.create(memberDTO);
		if (result == 1) {
			return "joinConfirm";
		} else {
			return "joinFail";
		}
	}// insert
	
	@RequestMapping("sLogin.member")
	@ResponseBody
	public int login(MemberDTO memberDTO, HttpSession session) {
		boolean result = service.sLogin(memberDTO);
		int result1 = 0;
		if (result == true) {
			result1 = 1;
			session.setAttribute("fId", memberDTO.getId());
			return result1;
		}
		return result1;
	}
	
	
	
	
	
	
}//class
