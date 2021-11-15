package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.dto.QnaDto;

@Repository
public class QnaDAO {
	@Inject 
	private SqlSession sql;
	
	private static String namespace = "com.boo.mappers.qnaMapper";
	
	// qna 목록
	public List<QnaDto> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}
	
	// qna 작성
	public void write(QnaDto dto) throws Exception {
		sql.insert(namespace + ".write", dto);
	}
}
