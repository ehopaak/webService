package com.shinhan.frontcontrollerpattern;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.shinhan.model.EmpService;

public class EmpDelteController implements CommonControllerInterface {

	@Override
	public String excute(Map<String, Object> data) throws Exception {
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		int empid = Integer.parseInt(request.getParameter("empid"));
		
		EmpService service = new EmpService();
		service.empDelete(empid);
	
		return "redirect:emplist.do";
	}

}
