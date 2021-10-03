package com.fly.pro2;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fly.pro2.DAO.PlaneBookDAO;
import com.fly.pro2.DTO.PlaneBookDTO;


@Controller
public class PlaneBookController {

	@Autowired
	PlaneBookDAO dao; 
	
	@RequestMapping("planeBook.do")
	public String book1(PlaneBookDTO planeBookDTO, Model model) {
		System.out.println(planeBookDTO + "@@@@@첫번째@@@@@@@");
		model.addAttribute("plane", planeBookDTO);
		
		return "planeBook";
	}
	
	@RequestMapping("planeBook2.do")
	public String book2(PlaneBookDTO planeBookDTO, Model model) {
		System.out.println(planeBookDTO + "@@@두번째@@@@@@@@@");
		model.addAttribute("planeBook2", planeBookDTO);
		
		return "planeBook2";
	}
	
	@RequestMapping("planePay.do")
	public String book3(PlaneBookDTO planeBookDTO, Model model) {
		System.out.println(planeBookDTO + "@@@@데이터넣기@@@@@");
		model.addAttribute("planePay", planeBookDTO);
		dao.create(planeBookDTO);
		return "planePay";
	}
	
	@RequestMapping("planePayS.do")
	public void book4(HttpServletRequest request, PlaneBookDTO planeBookDTO, Model model) {
		PlaneBookDTO dto = dao.searchOne(planeBookDTO);
		model.addAttribute("planePayS", dto);
	}
	
	@RequestMapping("planePayS2.do")
	public void book7(HttpServletRequest request, PlaneBookDTO planeBookDTO, Model model) {
		PlaneBookDTO dto = dao.searchOne(planeBookDTO);
		model.addAttribute("planePayS", dto);
	}//s2
	
	
	@RequestMapping("planePayReturn.do")
	public void book5(HttpServletRequest request, PlaneBookDTO planeBookDTO, Model model) {
		PlaneBookDTO dto = dao.searchOne(planeBookDTO);
		System.out.println("@@@@반환된 데이터로 불러오기@@@@@" + dto);
		model.addAttribute("planePayReturn", dto);
	}	
	@RequestMapping("planePay2.do")
		public String book6(PlaneBookDTO planeBookDTO, Model model) {
			System.out.println(planeBookDTO + "@@@@데이터넣기@@@@@");
			model.addAttribute("planePay2", planeBookDTO);
			dao.create(planeBookDTO);
			return "planePay2";
		}
		
}
	

