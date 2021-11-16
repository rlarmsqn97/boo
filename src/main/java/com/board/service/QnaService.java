package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.QnaDAO;
import com.board.dto.QnaDto;

@Service
public class QnaService {
	
	@Inject
	private QnaDAO dao;
	
	// qna 목록
	public List<QnaDto> list() throws Exception {
		return dao.list();
	}
	
	// qna 작성
	public void write(QnaDto dto) throws Exception {
		dao.write(dto);
	}
	
	// qna 조회
	public QnaDto view(int bno) throws Exception {
		return dao.view(bno);
	}
	
	// qna 수정
	public void modify(QnaDto dto) throws Exception {
		dao.modify(dto);
	}
	
	// qna 삭제
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}
	
}
