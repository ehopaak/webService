package com.shinhan.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RequestTestServlet
 */
@WebServlet("/requestTest")
public class RequestTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("=======요청정보 얻기=========");
		System.out.println(request.getContextPath());
		System.out.println(request.getMethod());
		System.out.println(request.getRequestURI());
		System.out.println(request.getLocalPort());
		System.out.println(request.getLocalAddr());
		System.out.println(request.getRemoteAddr());
		System.out.println(request.getPathInfo());
		
		Enumeration<String> hs = request.getHeaderNames();
		while(hs.hasMoreElements()) {
			String name = hs.nextElement();
			System.out.println("headerName:" + name);
			System.out.println(request.getHeader(name));
			System.out.println("---------------------");
		}
		
		response.getWriter().append("ehopaak.....server..at: ").append(request.getContextPath());
	}

}
