package com.boo.visit;


import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.boo.dao.VisitDAO;
import com.boo.dto.VisitVO;



public class SessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent arg0){
		System.out.println("=========== 리스너 실행 ==========");
		
		  // DAO 객체 생성
        VisitDAO dao = new VisitDAO();
        VisitVO vo = new VisitVO();
         
        // 전체 방문자 수 +1
        dao.aa();
        try {
			dao.total();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         

      
		
	}	     	      
	    
	
	@Override
    public void sessionDestroyed(HttpSessionEvent arg0) {
 
    }
}
