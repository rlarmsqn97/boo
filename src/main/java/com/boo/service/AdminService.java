package com.boo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.boo.dao.AdminDAO;
import com.boo.dto.CategoryVO;
import com.boo.dto.OrderListVO;
import com.boo.dto.OrderVO;
import com.boo.dto.ProductVO;
import com.boo.dto.ProductViewVO;

@Service
public class AdminService {
	
	@Inject
	AdminDAO dao;
	
	public void register(ProductVO vo) throws Exception{
		dao.register(vo);
	}
	
	public List<ProductVO> productlist() throws Exception{
		return dao.productlist();
	}
	
	
	public List<CategoryVO> category() throws Exception{
		return dao.category();
	}
	
	public ProductViewVO productView(int pdNum) throws Exception{
		return dao.productView(pdNum);
	}
	
	public void pdModify(ProductVO vo) throws Exception{
		dao.pdModify(vo);
	}
	
	public void pdDelete(int pdNum) throws Exception{
		dao.pdDelete(pdNum);
	}
	
	// 주문 목록
	public List<OrderVO> orderList() throws Exception{
		return dao.orderList();
	}
	
	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}
	
	// 배송 상태
	public void delivery(OrderVO order) throws Exception {
		dao.delivery(order);
	}
	
	// 상품 수량 조절
	public void changeStock(ProductVO product) throws Exception {
		dao.changeStock(product);
	}

}
