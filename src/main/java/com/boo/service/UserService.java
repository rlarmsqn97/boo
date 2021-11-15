package com.boo.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.boo.dao.UserDAO;
import com.boo.dto.ProductVO;
import com.boo.dto.UserVO;

@Service
public class UserService {
	
	@Inject
	private UserDAO dao;
	
	public void join(UserVO vo) throws Exception {
		dao.join(vo);
	}
	
	public UserVO login(UserVO vo) throws Exception {
		return dao.login(vo);
	}
	
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}
}
