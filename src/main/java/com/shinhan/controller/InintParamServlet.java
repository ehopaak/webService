package com.shinhan.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InintParamServlet
 */
//@WebServlet(urlPatterns = {"/initparam"},
//		initParams = {
//				@WebInitParam(name="address", value="서울시"),
//				@WebInitParam(name="phone", value="123")
//		}
//		)
public class InintParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public InintParamServlet() {
		System.out.println("InintParamServlet의 생성자");
	}
	
	
	@Override
	public void init() throws ServletException {
		System.out.println("InintParamServlet 초기화");
	}
	


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String address = getInitParameter("address");
		String phone = getInitParameter("phone");
		
		System.out.println(address);
		System.out.println(phone);

	}


}
