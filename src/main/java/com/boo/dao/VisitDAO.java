package com.boo.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.boo.dto.VisitVO;



@Repository
public class VisitDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.boo.mappers.visitcountMapper";
	

		public int visit(VisitVO vo) throws Exception{
			return sql.insert(namespace + ".visitcount", vo);			
		}
		
		public int total() throws Exception {
			return sql.selectOne(namespace + ".total");
		}
		
		public void aa() {
			System.out.println("야야");
		}

}
