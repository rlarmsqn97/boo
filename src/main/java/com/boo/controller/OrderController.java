package com.boo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boo.dto.OrderDetailVO;
import com.boo.dto.OrderVO;
import com.boo.dto.UserVO;
import com.boo.service.ShopService;
@Controller
@RequestMapping(value = "order/*")
public class OrderController {
	
    @Inject
    ShopService service;
	    
    @RequestMapping(value = "/buy", method = RequestMethod.GET)
	public void getorder() {
		
	}
	
	@RequestMapping(value = "/buy", method = RequestMethod.POST)
	public void order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
		UserVO user = (UserVO)session.getAttribute("user");
		String userId = user.getUserId();
		
		service.orderInfo(order);
		service.orderInfo_Details(orderDetail);
	}

}
