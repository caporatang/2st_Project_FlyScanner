package com.fly.pro2.DAO;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.pro2.DTO.HotelBookDTO;


@Repository
public class HotelBookDAO {

    @Autowired
    SqlSessionTemplate mybatis;

    public void create(HotelBookDTO hotelbookDTO) {
		System.out.println(hotelbookDTO);
		int result = mybatis.insert("hotelBookMapper.create", hotelbookDTO);
		System.out.println(result);
    }
    
    public HotelBookDTO search(HotelBookDTO hotelbookDTO) {
		System.out.println(hotelbookDTO );
		HotelBookDTO dto = mybatis.selectOne("hotelBookMapper.search", hotelbookDTO);
		return dto;
    }
    
    public HotelBookDTO searchOne(HotelBookDTO hotelbookDTO) {
		HotelBookDTO dto = mybatis.selectOne("hotelBookMapper.searchOne", hotelbookDTO);
		System.out.println("@@@@ 불러온 데이터 @@@" + dto);
		return dto;
    }
    public void couponUp(HotelBookDTO hotelbookDTO) {
		int result = mybatis.update("hotelBookMapper.couponUp", hotelbookDTO);
		System.out.println(result);
    }
    
}
