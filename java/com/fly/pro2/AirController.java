package com.fly.pro2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fly.pro2.DAO.AirDAO;
import com.fly.pro2.DTO.AirDTO;

@Controller
public class AirController {
	
	@Autowired
	AirDAO dao;
	


	@RequestMapping("one") //조건검색 결과 여러개 가지고 와야함. 
	public void one(AirDTO airDTO,  Model model) {
		System.out.println(airDTO);
		System.out.println(airDTO.getTicketno());
		List<AirDTO> list = dao.read(airDTO);
		//dto의 데이터는 views/one.jsp로 출력되어야 클라이언트에게 보인다.
		//model속성을 이용하면 views 아래까지 데이터를 보내고 , 사라진다.
		model.addAttribute("list",list);
		//컨트롤러에서만 모델을 사용가능하다. 다른곳에서 사용 불가능
	}
	
	@RequestMapping("air_list")
	public void listt(Model model) {
		List<AirDTO> list = dao.all();
		System.out.println(list.size() + "================");
		model.addAttribute("list", list);
	}
//전체보기
	@RequestMapping("airList")
	public void list(Model model) {
		List<AirDTO> list = dao.all();
		System.out.println(list.size() + "================");
		model.addAttribute("list", list);
	}

	
	//admin계정 권한 - 호텔정보 등록, 수정, 삭제
	@RequestMapping("aircreate") //요청주소 1개당 메서드 1개
	public void create(AirDTO airDTO) {
		System.out.println(airDTO);
		dao.create(airDTO); //주소가 있으면 메서드 호출 가능
		//리턴으로 특정 jps 호출 안했으니 .fly 절삭하고 
		//views 아래 hotel.jsp를 자동으로 찾아 엶.
	}
	
	@RequestMapping("airupdate") //요청주소 1개당 메서드 1개
	public void update(AirDTO airDTO) {
		//컨트롤러의 메서드 내에 선언된 파라메터는 무조건 프로토타입으로 만들어진다.
		System.out.println(airDTO);
		dao.update(airDTO); //주소가 있으면 메서드 호출 가능
		//리턴으로 특정 jps 호출 안했으니 .fly 절삭하고 
		//views 아래 hotel.jsp를 자동으로 찾아 엶.
	}
	
	@RequestMapping("airdelete") //요청주소 1개당 메서드 1개
	public void delete(AirDTO airDTO) {
		System.out.println(airDTO);
		dao.delete(airDTO);		
	}
	
	
}


