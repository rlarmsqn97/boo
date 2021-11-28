package com.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dto.QnaReplyDto;
import com.board.service.QnaReplyService;

@Controller
@RequestMapping("reply/*")
public class QnaReplyController {
	
	@Inject
	QnaReplyService service;
	
	// 댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(QnaReplyDto dto) throws Exception {
		service.write(dto);
		
		return "redirect:/board/qna/view?bno=" + dto.getBno();
	}
	
}
