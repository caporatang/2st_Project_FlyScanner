package com.fly.pro2;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fly.pro2.DAO.QusetionDAO;
import com.fly.pro2.DTO.QuestionDTO;

@Controller
public class QuestionController {

	@Autowired
	QusetionDAO dao;

	@RequestMapping("questionWrite")
	public String create(QuestionDTO questionDTO) {
		System.out.println(questionDTO);
		dao.create(questionDTO);
		return "redirect:questionList"; // db에서 read해서 리스트를 보여주자.
	}
	
	
	@RequestMapping("chartReading")
	@ResponseBody
	public int[] chartRead(QuestionDTO questionDTO){
	List<Object> chartList = dao.chart();
	//System.out.println(chartList);
	String reservation = String.valueOf(chartList.get(0)); //object 스트링으로 캐스팅
	String feedback = String.valueOf(chartList.get(1));
	String airLine = String.valueOf(chartList.get(2));
	String payment = String.valueOf(chartList.get(3));
	
	int reservation2 = Integer.parseInt(reservation); // 스트링을 인트로 캐스팅
	int feedback2 = Integer.parseInt(feedback);
	int airLine2 = Integer.parseInt(airLine);
	int payment2 = Integer.parseInt(payment);
	
	int[] arr = {reservation2, feedback2, airLine2, payment2}; // 인트 배열에 넣고 
	return arr; // ajax로 리턴
	}
//	@RequestMapping("questionList")
//	public String read(Model model, QuestionDTO questionDTO) {
//		List<QuestionDTO> questionList = dao.readQuestion();
//		model.addAttribute("questionList", questionList);
//		return "questionList";
//	}
//
//	@RequestMapping("questionInfo")
//	public void read(QuestionDTO questionDTO, Model model) {
//		System.out.println(questionDTO.getQno());
//		QuestionDTO questionList = dao.readQuestionInfo(questionDTO);
//		model.addAttribute("questionList", questionList);
//		System.out.println(questionDTO);
//	}

	@RequestMapping(value = { "/questionList", "/questionInfo" })
	public void read(HttpServletRequest request, QuestionDTO questionDTO, Model model) {
		if (request.getServletPath().equals("/questionList")) {
			System.out.println(questionDTO.getQno());
			List<QuestionDTO> questionList = dao.readQuestion();
			model.addAttribute("questionList", questionList);
		} else if (request.getServletPath().equals("/questionInfo")) {
			System.out.println(questionDTO.getQno());
			QuestionDTO questionList = dao.readQuestionInfo(questionDTO);
			model.addAttribute("questionList", questionList);
		}
	}
	
	@RequestMapping("questionDelete")
	@ResponseBody
	public int deleteQusetion(QuestionDTO questionDTO) {
		System.out.println("게시글 삭제 테스트");
		System.out.println("넘어온 게시글 번호 체크 : " + questionDTO.getQno());
		int result = dao.deleteQuestion(questionDTO);
		return result;
	} // 게시글 삭제

	
	@RequestMapping("questionUpdateRead.question")
	public void updateQuestion(QuestionDTO questionDTO, Model model) {
		System.out.println("update read 테스트");
		System.out.println(questionDTO.getQno());
		QuestionDTO questionList = dao.updateQuestionRead(questionDTO);
		model.addAttribute("questionList", questionList);
		System.out.println(questionList);
	}// 입력폼에 value값 read

	@RequestMapping("update.question")
	public String questionUpdate(QuestionDTO questionDTO) {
		dao.updateQuestion(questionDTO);
		return "redirect:questionList";
	} // update입력 폼에서 버튼 클릭시 업데이트 처리

	@RequestMapping("AnswerForm")
	public ModelAndView moveAnswer(ModelAndView mav, HttpServletRequest request, HttpServletResponse response) {
		String fk_seq = request.getParameter("fk_seq");
		mav.addObject("fk_seq", fk_seq);
		mav.setViewName("AnswerForm");
		return mav;
	} // AnswerForm에 값을 전달하고 이동

	@RequestMapping("questionAnswer") // 답변 글 등록
	public String Answer(ModelAndView mav, QuestionDTO questionDTO, HttpServletRequest request,
			HttpServletResponse response) {
		String fk_seq2 = request.getParameter("fk_seq");
		System.out.println("입력폼에서 넘어온 seq : " + fk_seq2);
		int fk_seq = Integer.parseInt(fk_seq2);
		questionDTO.setFk_seq(fk_seq);
		System.out.println(questionDTO);
		dao.answerQuestion(questionDTO);
		return "redirect:questionList";
	}
}
