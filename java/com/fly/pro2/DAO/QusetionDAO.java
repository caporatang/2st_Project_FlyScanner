package com.fly.pro2.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.pro2.DTO.QuestionDTO;

@Repository
public class QusetionDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//<차트 카테고리 별 카운트>
	public List<Object> chart() { 
		List<Object> chartList = new ArrayList<Object>();
		int reservation = mybatis.selectOne("question.chartReservation");
		int payment = mybatis.selectOne("question.chartPayment");
		int airLine = mybatis.selectOne("question.chartAirLine");
		int feedback = mybatis.selectOne("question.chartFeedback");
		chartList.add(reservation);
		chartList.add(feedback);
		chartList.add(airLine);
		chartList.add(payment);
		System.out.println(chartList);
		return chartList;
	}
	
	
	public void create(QuestionDTO questionDTO) {
		int result = mybatis.insert("question.questionWrite", questionDTO);
		System.out.println(result);
	} // 문의글 작성 페이지 insert

	public void answerQuestion(QuestionDTO questionDTO) {
		int result = mybatis.insert("question.answer", questionDTO);
		System.out.println("답변 등록에 대한 결과는 : " + result);
	}

	public List<QuestionDTO> readQuestion() {
		List<QuestionDTO> questionList = mybatis.selectList("question.questionBoard");
		return questionList;
	} // 문의글 리스트 읽어오기

	public QuestionDTO readQuestionInfo(QuestionDTO questionDTO) {
		System.out.println(questionDTO);
		QuestionDTO questionList = mybatis.selectOne("question.questionInfo", questionDTO);
		System.out.println(questionDTO);
		return questionList;
	} // 문의 상세 페이지

	public int deleteQuestion(QuestionDTO questionDTO) {
		int result = mybatis.delete("question.questionDelete", questionDTO);
		return result;
	}

	public QuestionDTO updateQuestionRead(QuestionDTO questionDTO) {
		System.out.println(questionDTO);
		QuestionDTO questionList = mybatis.selectOne("question.questionUpdateRead", questionDTO);
		System.out.println(questionDTO);
		return questionList;
	} // 수정 입력폼에 띄워줄 read

	public void updateQuestion(QuestionDTO questionDTO) {
		System.out.println(questionDTO);
		int questionList = mybatis.update("question.questionUpdate", questionDTO);
		System.out.println(questionList);
	}

} // DAO end
