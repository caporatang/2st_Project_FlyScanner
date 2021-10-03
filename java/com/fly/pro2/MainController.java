package com.fly.pro2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.pro2.DAO.AirDAO;
import com.fly.pro2.DAO.HotelDAO;
import com.fly.pro2.DTO.AirDTO;
import com.fly.pro2.DTO.HotelDTO;

@Controller
public class MainController {

	@Autowired
	HotelDAO dao;
	
	@Autowired
	AirDAO daoA;
	
	@RequestMapping("index.main")
	@ResponseBody
	public List<HotelDTO> main(HotelDTO hotelDTO) {
		
		List<HotelDTO> list = dao.main(hotelDTO);
		System.out.println(list);
		return list;
	} // 호텔 추천 
	
	@RequestMapping("index2.main")
	@ResponseBody
	public List<AirDTO> mainPlane(AirDTO airDTO) {
		List<AirDTO> list1= daoA.main(airDTO);
		System.out.println(list1);
		return list1;
	} // 항공권 추천 
	
	
	
}
