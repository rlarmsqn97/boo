package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dto.QnaDto;
import com.board.service.QnaService;

@Controller
@RequestMapping("board/qna/*")
public class QnaController {
	
	@Inject
	QnaService service;
	
	// Qna 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		
		List<QnaDto> list = null;
		list = service.list();
		
		model.addAttribute("list", list);
		
		
	}
	
	// Qna 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {


	}

	// Qna 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(QnaDto dto) throws Exception {
		
		service.write(dto);
		
		return "redirect:/board/qna/list";
	}

}
