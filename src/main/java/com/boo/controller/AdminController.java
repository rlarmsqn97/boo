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
	}

}
