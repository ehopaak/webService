package com.shinhan.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class TImeCheckFilter
 */
//@WebFilter("/*")
public class TimeCheckFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public TimeCheckFilter() {
      System.out.println("TimeCheckFilter 생성자");
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		System.out.println("TimeCheckFilter 소멸자");	
		}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// 요청 filter
		long startTime = System.nanoTime();
		chain.doFilter(request, response);
		
		//응답 filter
		long endTime = System.nanoTime();
		String uri = ((HttpServletRequest)request).getRequestURI();
		System.out.println(uri + "처리하는데 걸린시간:" + (endTime-startTime) + "ns");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("TimeCheckFilter init");
	}

}
