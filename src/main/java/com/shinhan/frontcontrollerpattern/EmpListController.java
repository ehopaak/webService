package com.shinhan.frontcontrollerpattern;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.shinhan.model.AdminService;
import com.shinhan.model.EmpService;
import com.shinhan.vo.AdminVO;
import com.shinhan.vo.EmpVO;

public class EmpListController implements CommonControllerInterface {

	@Override
	public String excute(Map<String, Object> data) {
		EmpService service = new EmpService();
		List<EmpVO> emplist = service.selectAll();
		//request가 유지되는 동안 저장한다. 
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		request.setAttribute("empAll", emplist);
		
		
		return "empSelect.jsp";
	}
	
}
