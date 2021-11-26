package com.boo.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.boo.dto.OrderListVO;
import com.boo.dto.OrderVO;
import com.boo.dto.ProductVO;
import com.boo.dto.UserVO;
import com.boo.service.AdminService;

@Controller
@RequestMapping(value = "admin/*")
public class AdminController {
	
	@Inject
	AdminService service;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void getMain() throws Exception {
		
	}
		
	// 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
		List<OrderVO> orderList = service.orderList();
		model.addAttribute("orderList",orderList);
	}
	
	// 주문 상세 목록 
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(@RequestParam("n") String orderId,OrderVO order, Model model) throws Exception {
		order.setOrderId(orderId);
		List<OrderListVO> orderView = service.orderView(order);
		
		model.addAttribute("orderView",orderView);
		System.out.println(order.getOrderId());
	}
	
	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
		
		service.delivery(order);
		
		List<OrderListVO> orderView = service.orderView(order);
		ProductVO product = new ProductVO();
		
		for(OrderListVO i : orderView) {
			product.setPdNum(i.getPdNum());
			product.setPdStock(i.getCartStock());
			service.changeStock(product);
		}
		
		
		return "redirect:/admin/orderList";
	}
	
	// 회원목록
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public void getUserList(Model model,UserVO user) throws Exception {
		List<UserVO> userList = service.userList(user);
		model.addAttribute("userList",userList);

	}
	
	// 회원상세
	@RequestMapping(value = "/userDetail", method = RequestMethod.GET)
	public void getUserDetail(@RequestParam("n") String userId,Model model,UserVO user) throws Exception {
		user.setUserId(userId);
		List<UserVO> userDetail = service.userDetail(user);
		model.addAttribute("userDetail",userDetail);
		System.out.println(userId);
	}
	
	// 회원등록
	@RequestMapping(value = "/userRegister", method = RequestMethod.GET)
	public void getUserRegister() {
		
	}
	
	// 회원등록
	@RequestMapping(value = "/userRegister", method = RequestMethod.POST)
	public String postUserRegister(UserVO user) throws Exception{
		service.join(user);
		
		return "redircet:/admin/userList";
	}

}
