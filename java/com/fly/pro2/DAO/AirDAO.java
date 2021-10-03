package com.fly.pro2.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.pro2.DTO.AirDTO;

@Repository
public class AirDAO {
	
	@Autowired
	
	SqlSessionTemplate plan;
	
	public  void aircreate(AirDTO airDTO) {
		System.out.println(airDTO);
		int result = plan.insert("air.add",airDTO);
		System.out.println(result);
	}
	//검색 결과가 여러개인 것  
	
	public  List<AirDTO> read(AirDTO airDTO) {
		List<AirDTO> list = plan.selectList("air.one",airDTO);
		return list;
		}
	
	
	
	
	
	//admin계정 권한 - CUD
	public void create(AirDTO airDTO) {
		System.out.println(airDTO);
		plan.insert("aircreate", airDTO);
	}
	
	public void update(AirDTO airDTO) {
		System.out.println(airDTO);
		plan.insert("airupdate", airDTO);
	}
	//삭제
	public void delete(AirDTO airDTO) {
		System.out.println(airDTO);
		plan.delete("airdelete", airDTO);
	}
	
	public List<AirDTO> all() {
		return plan.selectList("air.all");
	}
	
	public List<AirDTO> one2() {
		return plan.selectList("air.all");
	}
	// ----------------------------------- main -----------------------------------
	
	public List<AirDTO> main(AirDTO airDTO) {
		List<AirDTO> list = plan.selectList("air.main", plan);
		return list;
	}
}//class
