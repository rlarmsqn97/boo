package com.boo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.boo.dto.CategoryVO;
import com.boo.dto.OrderListVO;
import com.boo.dto.OrderVO;
import com.boo.dto.ProductVO;
import com.boo.dto.ProductViewVO;

@Repository
public class AdminDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.boo.mappers.adminMapper";
	
	public void register(ProductVO vo) throws Exception{
		sql.insert(namespace + ".register", vo);
	}
	
	public List<ProductVO> productlist() throws Exception {
		return sql.selectList(namespace + ".productlist");
	}
	
	public List<CategoryVO> category() throws Exception {
		return sql.selectList(namespace + ".category");
	}
	public ProductViewVO productView(int pdNum) throws Exception{
		return sql.selectOne(namespace + ".productView",pdNum);
	}
	
	public void pdModify(ProductVO vo) throws Exception{
		sql.update(namespace+".pdModify", vo);
	}
	
	public void pdDelete(int pdNum) throws Exception{
		sql.delete(namespace+".pdDelete", pdNum);
	}
	
	//주문 목록
	public List<OrderVO> orderList() throws Exception {
		return sql.selectList(namespace + ".orderList");
	}
	
	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return sql.selectList(namespace + ".orderView",order);
	}
	
	// 배송 상태
	public void delivery(OrderVO order) throws Exception {
		sql.update(namespace + ".delivery", order);
	}
	
	// 상품 수량 조절
	public void changeStock(ProductVO product) throws Exception{
		sql.update(namespace + ".changeStock", product);
	}


}
