package com.shinhan.frontcontrollerpattern;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.shinhan.vo.AdminVO;

public class JSTLController implements CommonControllerInterface {

	@Override
	public String excute(Map<String, Object> data) throws Exception {
		// /로 시작하면 절대 / 가 없으면 상대경로이다.
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		ServletContext application = request.getServletContext();
		HttpSession session = request.getSession();
		application.setAttribute("myName", "노홍철");
		session.setAttribute("myName", "하하");
		request.setAttribute("myName", "박명수");
		
		List<AdminVO> adminList = new ArrayList<>();
		adminList.add(new AdminVO("abc1@daum.net","형돈","1234"));
		adminList.add(new AdminVO("abc2@daum.net","길","1234"));
		adminList.add(new AdminVO("abc3@daum.net","재석","1234"));
		request.setAttribute("admins", adminList);
		
		request.setAttribute("score", 90);
		request.setAttribute("today", new Date());
		
		//int count=0
		//request.setAttribute("count",0);
		return "jsptest/jstlTest3.jsp";
	}

}
