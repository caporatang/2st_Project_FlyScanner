package com.fly.pro2;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.pro2.DAO.MemberDAO;
import com.fly.pro2.DTO.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	
	@RequestMapping("joinConfirm.member")
	public String create(MemberDTO memberDTO) {
		System.out.println(memberDTO);
		int result = dao.create(memberDTO);
		if (result == 1) {
			return "joinConfirm";
		}else {
			return "joinFail";
		}
	}// 회원가입
	
	@RequestMapping("deleteM.member")
	@ResponseBody
	public int deleteM(MemberDTO memberDTO, HttpSession session) {
		System.out.println("id : " + memberDTO.getId());
		int result = dao.delete(memberDTO);
		if (result == 1) {
			session.invalidate();
		}
		return result;
		
	}//탈퇴
	
	@RequestMapping("idcheck.member" )
	@ResponseBody
	public String idcheck(MemberDTO memberDTO) {
		int result = dao.read1(memberDTO);
		System.out.println(result);
		String result1 = Integer.toString(result);
		return result1;
	}// id 중복체크
	
	@RequestMapping("loginCheck.member")
	@ResponseBody
	public int loginCheck(MemberDTO memberDTO, HttpSession session, Model model) {
		System.out.println(memberDTO.getId() + ", " + memberDTO.getPw());
		
		int result = dao.login(memberDTO);
		session.setAttribute("fId", memberDTO.getId());
		System.out.println("세션값 : " + session.getAttribute("fId"));
		System.out.println("넘어온 값 : " + result);
		// 아래줄은 ajax 사용코드
		return result;
	}// 로그인

	@RequestMapping("logout.member")
	public String logout(HttpSession session) {
		System.out.println("현재 세션 : " + session.getAttribute("fId"));
		int result = dao.logout(session);
		if (result == 1) {
			session.invalidate();
			
			return "redirect:index.jsp";
		}else {
			return "joinFail";
		}
	}//로그아웃
	
	
	@RequestMapping("update.member")
	public String update(MemberDTO memberDTO) {
		System.out.println(memberDTO.getId());
		int result = dao.update(memberDTO);
		String id2 = memberDTO.getId();
		if (result == 1) {
			return "redirect:member_info.member?id=" + id2;
		}else {
			return "member_info_u";
		}
	}//회원정보수정
	
	@RequestMapping(value = {"/member_info.member", "/member_info_u.member"})
	public void info(HttpServletRequest request,MemberDTO memberDTO, Model model) {
		if (request.getServletPath().equals("/member_info.member")) {
			System.out.println(memberDTO.getId());
			MemberDTO dto = dao.meminfou(memberDTO);
			model.addAttribute("bag", dto);
			//요청받은 회원정보 검색후 회원정보 Page에 Model객체로 데이터 전송.
			//return "member_info";
		} else if(request.getServletPath().equals("/member_info_u.member")){
			System.out.println(memberDTO.getId());
			MemberDTO dto = dao.meminfou(memberDTO);
			model.addAttribute("bag", dto);
			// 회원정보 수정시 input 폼에 DB에 저장되어있는 데이터를 출력하기 위한 Mapping 
			//return "member_info";
		}
	}
	
//	@RequestMapping("member_info.member")
//	public void infoCommit(MemberDTO memberDTO, Model model) {
//		System.out.println(memberDTO.getId());
//		MemberDTO dto = dao.meminfou(memberDTO);
//		model.addAttribute("bag", dto);
//		//return "member_info";
//	}//mypage 조회
//	
//	@RequestMapping("member_info_u.member")
//	public void infoU(MemberDTO memberDTO, Model model) {
//		System.out.println(memberDTO.getId());
//		MemberDTO dto = dao.meminfou(memberDTO);
//		model.addAttribute("bag", dto);
//		//return "member_info";
//	}//정보수정 데이터 get
	
	@RequestMapping("number_confirm.member")
	public String NumConfirm(MemberDTO memberDTO) {
		System.out.println(memberDTO.getTel());
		System.out.println(memberDTO.getId());
		String id2 = memberDTO.getId();
		int result = dao.numConfirm(memberDTO);
			if (result == 1 ) {
				return "redirect:member_info.member?id=" + id2;
			}else {
				return "redirect:index.jsp";
			}
	}// 전화번호 본인인증
	
	
	// ------------------------------kakao 계정 -------------------------------
	
	@RequestMapping("kakaoLogin.member")
	public String kakaologin(MemberDTO memberDTO, Model model, HttpSession session, HttpServletRequest request) {
		System.out.println(memberDTO);
		// 가입이력 확인
		int result = dao.kakao_check(memberDTO);
		// 카카오 가입이력따라서 로그인 or 추가정보 입력창 페이지 이동
		if (result == 0) {
			request.setAttribute("kakaoEmail", request.getParameter("email"));
			request.setAttribute("kakaoGender", request.getParameter("gender"));
			request.setAttribute("kakaoBirth", request.getParameter("birth"));
			// 가입이력 없을시 해당 정보들을 세션에담아 추가정보 입력 페이지까지 데이터 전송.
			return "kakao_join";
		}else {
			// 가입 이메일 있을시 DB에 있는 ID 세션에 저장 --> 카카오 로그인 처리.
			MemberDTO result_login = dao.kakao_login(memberDTO);
			System.out.println(result_login);
			session.setAttribute("fId", result_login.getId());
			return "redirect:index.jsp";
		} //else
	} // kakao 로그인
	
	
	
	
	
	
	
	
	
	
	
	
	
}
