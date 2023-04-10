package com.shinhan.controller2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class URLPatternTest
 */
//@WebServlet("/url/test/*")
@WebServlet("*.go")	//확장자 URL pattern인 경우 폴더와 같이 사용안됨
public class URLPatternTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public URLPatternTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("getContextPath:" + request.getContextPath());
		//webshop
		System.out.println("getRequestURI:" + request.getRequestURI());
		//webshop/url/test
		System.out.println("getRequestURL:" + request.getRequestURL());
		System.out.println("getMethod:" + request.getMethod());
		System.out.println("getRemoteAddr:" + request.getRemoteAddr());
		System.out.println("getServletPath:" + request.getServletPath());
		
		//getContextPath제외한 나머지 url=> /url/test
		System.out.println("getPathInfo:" + request.getPathInfo());
		//url/test/*
		//요청한 URL이름 뒷부분의 url
		System.out.println("getQueryString:" + request.getQueryString());
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
