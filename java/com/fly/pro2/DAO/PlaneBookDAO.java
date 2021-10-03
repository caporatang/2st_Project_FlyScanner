package com.fly.pro2.DAO;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.pro2.DTO.PlaneBookDTO;

@Repository
public class PlaneBookDAO {

    @Autowired
    SqlSessionTemplate mybatis;

    public void create(PlaneBookDTO planebookDTO) {
		System.out.println(planebookDTO);
		int result = mybatis.insert("planeBookMapper.create", planebookDTO);
		System.out.println(result);
    }
    
    public PlaneBookDTO searchOne(PlaneBookDTO planebookDTO) {
    	PlaneBookDTO dto = mybatis.selectOne("planeBookMapper.searchOne", planebookDTO);
		System.out.println("@@@@ 불러온 데이터 @@@" + dto);
		return dto;
    }
    
}
