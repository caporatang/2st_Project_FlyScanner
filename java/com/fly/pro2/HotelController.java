package com.fly.pro2;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fly.pro2.DAO.HotelDAO;
import com.fly.pro2.DTO.HotelDTO;

@Controller
public class HotelController {
	
	@Autowired
	HotelDAO dao;
	
	@RequestMapping("key.hotel") //키워드에 해당하는 레코드들 검색
	public void find2(HotelDTO hotelDTO, Model model, HttpSession session) {
		System.out.println("key.hotel 컨트롤러>> " + hotelDTO.getKeyword()); //왔는지 찍어보기
		//test. 왔는지 찍어!!!(망하면 지워~!~!) 일단 값은 잘 옴!!!!!
		System.out.println("key.hotel 컨트롤러>> " + hotelDTO.getCheckout());
		//남겨놔!!~!~!~!~!~!
		List<HotelDTO> list = dao.list(hotelDTO); //램버스 포함 레코드 3개가 list로
		model.addAttribute("list", list);
			//test(9/20)
		model.addAttribute("checkin", hotelDTO.getCheckin()); 
		model.addAttribute("checkout", hotelDTO.getCheckout()); 
		model.addAttribute("stdnum", hotelDTO.getStdnum()); 
		model.addAttribute("guestnum", hotelDTO.getGuestnum()); 
		System.out.println("key.hotel 조회된 호텔 수>> "+list.size());

		//전체검색, 1st행 가져와 이미지 컬럼 사용하기
		HotelDTO dto = dao.firstrow(hotelDTO);
		String img = dto.getHimage();
		String img2[] = img.split(","); //{img.jpg,img2.jpg,램버스1.jpg,램버스2.jpg,램버스3.jpg,img3.jpg}
		//키워드가 포함된 이미지만 list2에 실어서, list 출력하는 foreach문 내 이미지 컬럼에 끼워넣을 것
		ArrayList<String> list2 = new ArrayList<>();
		String key = hotelDTO.getKeyword();
		for (int i = 0; i < img2.length; i++) {
			if (img2[i].contains(key)) {
				//이미지명이 key를 포함하고 있으면 list2에 add
				list2.add(img2[i]); //list2도 키워드 포함이니까 크기는 list와 동일 3개
			} 
		}
		System.out.println("key.hotel 컨트롤러2>> " + list2);
		model.addAttribute("list2", list2);
	}
	
	//1p 전체검색 평점 정렬
	@RequestMapping("mainlist.hotel")
	public void list(HotelDTO hotelDTO, Model model) { //원본 //dto 입력값 test(9/23)
		List<HotelDTO> list = dao.star();
		model.addAttribute("list", list);
		System.out.println("전체 게시글 수>> " + list.size());
		//test(9/23)
		model.addAttribute("checkin", hotelDTO.getCheckin()); 
		model.addAttribute("checkout", hotelDTO.getCheckout()); 
		model.addAttribute("stdnum", hotelDTO.getStdnum()); 
		model.addAttribute("guestnum", hotelDTO.getGuestnum()); 
	}
	
	//admin계정 권한 - 호텔정보 등록, 수정, 삭제
	@RequestMapping("insert.hotel") //요청주소 1개당 메서드 1개
	public void create(HotelDTO hotelDTO) {
		//컨트롤러의 메서드 내에 선언된 파라메터는 무조건 프로토타입으로 만들어진다.
		System.out.println(hotelDTO);
		dao.create(hotelDTO); //주소가 있으면 메서드 호출 가능
		//리턴으로 특정 jps 호출 안했으니 .fly 절삭하고 
		//views 아래 hotel.jsp를 자동으로 찾아 엶.
	}
	
	@RequestMapping("update.hotel")
	public void update(HotelDTO hotelDTO) {
		System.out.println(hotelDTO);
		dao.update(hotelDTO); 
	}
	
	//stdnum update. 예약한 만큼 잔여객실 -n개
	@RequestMapping("stdupdate.hotel") 
	public void numUp(HotelDTO hotelDTO) {
		System.out.println(hotelDTO);
		//dao.numUpdate(hotelDTO); 
	}
	
	@RequestMapping("delete.hotel") 
	public void delete(HotelDTO hotelDTO) {
		System.out.println(hotelDTO);
		dao.delete(hotelDTO);
	}
	
	//1개 검색 - 호텔 상세정보
	@RequestMapping("search.hotel") 
	public void find(HotelDTO hotelDTO, Model model) throws ParseException {
		System.out.println("컨트롤러>> " + hotelDTO.getHid()); //왔는지 찍어보기
		HotelDTO dto = dao.read(hotelDTO);
		model.addAttribute("bag", dto);
		//유저입력 입퇴실일자, 객실수, 투숙인원
		model.addAttribute("checkin", hotelDTO.getCheckin()); 
		model.addAttribute("checkout", hotelDTO.getCheckout()); 
		model.addAttribute("guestnum", hotelDTO.getGuestnum()); 
		//인원수 2명 당 객실 1개 계산
		int guestnum = hotelDTO.getGuestnum();
		int minStdnum = (int) Math.round(guestnum / 2.0);
		model.addAttribute("minStdnum", minStdnum); 
		//퇴실-입실일자
		String checkin = hotelDTO.getCheckin() + " 00:00:00";
		String checkout = hotelDTO.getCheckout() + " 00:00:00";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date sDate = sdf.parse(checkin);
		Date eDate = sdf.parse(checkout);
		 //Date.getTime()은 Date를 밀리세컨드로 변환하여 long형 숫자 데이터로 반환해줌
		long ddd = eDate.getTime() - sDate.getTime();
		long difDate = ddd / (24*60*60*1000); //일자수 차이
		model.addAttribute("diffDays", difDate); 
	}
	
	//1개 검색 - 호텔 상세정보의 지도
	@RequestMapping("htmap.hotel") 
	public void find2(HotelDTO hotelDTO, Model model){
		System.out.println("컨트롤러>> " + hotelDTO.getHid()); //왔는지 찍어보기
		HotelDTO dto = dao.read(hotelDTO);
		model.addAttribute("bag", dto);
	}
	
	//전체검색 리스트업
//	@RequestMapping("mainlist.hotel")
//	public void list(Model model) {
//		List<HotelDTO> list = dao.list();
//		model.addAttribute("list", list);
//		System.out.println("전체 게시글 수>> " + list.size());
//	}
	
}
