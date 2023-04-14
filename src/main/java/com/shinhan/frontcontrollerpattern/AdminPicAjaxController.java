package com.shinhan.frontcontrollerpattern;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shinhan.model.AdminService;
import com.shinhan.vo.AdminVO;
import com.shinhan.vo.JobVO;

public class AdminPicAjaxController implements CommonControllerInterface {

	@Override
	public String excute(Map<String, Object> data) throws Exception {
		AdminService service = new AdminService();
		HttpServletRequest request = (HttpServletRequest)data.get("request");
		List<AdminVO> adminlist = service.adminList();
		request.setAttribute("adminList", adminlist);
		
		return "AdminView.jsp";
		
//		JSONArray arr = new JSONArray();
//		for(AdminVO admin:adminlist) {
//			JSONObject obj = new JSONObject();
//			obj.put("email", admin.getEmail());
//			obj.put("manager_name", admin.getManager_name());
//			obj.put("pass", admin.getPass());
//			obj.put("pic", admin.getPic());
//			arr.add(obj);	
//		}
		
		//{"jobList":[]}
			//JSONObject adminObj = new JSONObject();
			//adminObj.put("adminList", arr);
	}

}
