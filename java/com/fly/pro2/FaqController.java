package com.fly.pro2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fly.pro2.DAO.FaqDAO;
import com.fly.pro2.DTO.FaqDTO;

@Controller
public class FaqController {

	@Autowired
	FaqDAO dao;
	
	@RequestMapping("faqInformation")
	public void read(Model model, FaqDTO faqDTO) {
	List<FaqDTO> faqList = dao.readFaq();
	model.addAttribute("faqList", faqList);
	System.out.println(faqList);
	} // faq read
	
	@RequestMapping("faqWriteForm")
	public String moveForm() {
		return "faqWriteForm";
	} // faq작성 입력 폼으로 이동
	
	
	@RequestMapping("faqWrite") 
	public String insert(FaqDTO faqDTO) {
	System.out.println("컨트롤러에서 받은 값은 : " + faqDTO);
	dao.insert(faqDTO);
	System.out.println("컨트롤러에서 처리한 값은 : " + faqDTO);
	return "redirect:faqInformation";
	}// faq write
	
	@RequestMapping("faqDelete")
	public String faqDelete(FaqDTO faqDTO) {
		System.out.println("delete : 전달받은 값은" + faqDTO.getfNo());
	dao.delete(faqDTO);
		return "redirect:faqInformation";
	}
	
	
	@RequestMapping("faqUpdateRead")
	public void updateRead(FaqDTO faqDTO, Model model) {
	System.out.println("업데이트 입력폼 받은 컨트롤러에서 받은 값 : " + faqDTO);
	FaqDTO faqList = dao.updateRead(faqDTO);
		System.out.println("업데이트 폼에 뿌려 줄 자료 처리 값은 : " + faqList);
		model.addAttribute("faqList", faqList);
	}
	
	@RequestMapping("faqUpdate.faq")
	public String update(FaqDTO faqDTO) {
	System.out.println("업데이트 컨트롤러에 넘어오긴 하나요 ?" + faqDTO.getfNo());
	dao.update(faqDTO);
		return "redirect:faqInformation";
	}
	
	
}
