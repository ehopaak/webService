package com.shinhan.frontcontrollerpattern;

import java.util.Map;

public class LayoutTestController implements CommonControllerInterface {

	@Override
	public String excute(Map<String, Object> data) throws Exception {
		String page = "layoutTest.jsp";
		return page;
	}

}
