package com.fly.pro2.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.pro2.DTO.HotelBookDTO;
import com.fly.pro2.DTO.HotelDTO;

@Repository
public class HotelDAO {

	@Autowired
	SqlSessionTemplate ht;
	// 기능을 처리하는 단위 1개를 메서드 1개로 만듦
	
	// 키워드에 해당하는 레코드들 검색
	public List<HotelDTO> list(HotelDTO hotelDTO) {
		System.out.println("키워드 DAO>> " + hotelDTO.getKeyword()); // 왔는지 찍어보기
		//test. 왔는지 찍어!!!(망하면 지워~!~!) 일단 값은 잘 옴!!!!!
		System.out.println("키워드 DAO>> " + hotelDTO.getCheckout());
		//여기 남겨놔!!!!
		List<HotelDTO> list = ht.selectList("hotel.key", hotelDTO);
		return list;
	}

	//전체검색, 이미지 데이터가 있는 컬럼 사용하기
	public HotelDTO firstrow(HotelDTO hotelDTO) {
		//System.out.println(hotelDTO);
		HotelDTO dto = ht.selectOne("hotel.first", hotelDTO);
		System.out.println("1st행 DAO>> " + dto.getHimage());
		return dto;
	}
	
	//전체검색 평점 정렬
	public List<HotelDTO> star() {
		List<HotelDTO>list = ht.selectList("hotel.star");
		System.out.println("평점 정렬>>" + list); //img는 null
		return list;
	}
	
	//전체검색
//	public List<HotelDTO> list() {
//		List<HotelDTO> list = ht.selectList("hotel.all");
//		return list;
//	}
	
	//1개 검색
	public HotelDTO read(HotelDTO hotelDTO) {
		System.out.println("1개 검색>>" + hotelDTO);
		HotelDTO dto = ht.selectOne("hotel.one", hotelDTO);
		return dto;
	}
	
	//stdnum update
	public void numUpdate(HotelDTO hotelDTO) {
		ht.update("hotel.stdup", hotelDTO);
	}

	//admin계정 권한 - CUD
	public void create(HotelDTO hotelDTO) {
		System.out.println(hotelDTO);
		ht.insert("hotel.create", hotelDTO);
	}
	
	public void update(HotelDTO hotelDTO) {
		System.out.println(hotelDTO);
		ht.update("hotel.up", hotelDTO);
	}
	
	public void delete(HotelDTO hotelDTO) {
		System.out.println(hotelDTO);
		ht.delete("hotel.del", hotelDTO);
	}
	
//	public HotelDTO read(HotelDTO hotelDTO) { //1개 검색
//	System.out.println(hotelDTO);
//	HotelDTO dto = ht.selectOne("hotel.one", hotelDTO);
//	return dto;
//	}
	
	//----------------------main ------------------------------
	
		public List<HotelDTO> main(HotelDTO hotelDTO) {
			List<HotelDTO> list= ht.selectList("hotel.main");
			return list;
		}

	
}
