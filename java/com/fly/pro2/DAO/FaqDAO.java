package com.fly.pro2.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.pro2.DTO.FaqDTO;

@Repository
public class FaqDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<FaqDTO> readFaq() {
		List<FaqDTO> faqList = mybatis.selectList("faq.faqBoard");
		return faqList; // like문 사용 모두 읽기
	}
	
	public void insert(FaqDTO faqDTO) { 
		System.out.println("dao 에서 받은 값은"+faqDTO);
		int faqList = mybatis.insert("faq.faqWrite", faqDTO);
		System.out.println("dao에서 insert 처리 결과는 : " + faqList);
	}// faq 작성하기
	
	public void delete(FaqDTO faqDTO) {
		System.out.println("dao 에서 받은 값은(Delete)"+faqDTO);
		int faqList = mybatis.delete("faq.faqDelete", faqDTO );
		System.out.println("dao 에서 delete 처리 결과는 "+faqList);
	} // faq 삭제 
	
	public FaqDTO updateRead(FaqDTO faqDTO) {
		System.out.println("dao에서 받은 dto : " + faqDTO);
		FaqDTO faqList = mybatis.selectOne("faq.faqUpdateRead", faqDTO);
		return faqList;
	} // faq 수정 입력폼에 입력값 넣어줄 레코드 하나 read
	
	public void update(FaqDTO faqDTO) {
	mybatis.update("faq.faqUpdate", faqDTO);
	} //faq 수정하기
	
	
	
	
	
	
	
}
