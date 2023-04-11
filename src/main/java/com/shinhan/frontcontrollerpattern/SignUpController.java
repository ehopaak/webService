package com.shinhan.frontcontrollerpattern;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import com.shinhan.model.AdminService;
import com.shinhan.vo.AdminVO;

public class SignUpController implements CommonControllerInterface {

	@Override
	public String excute(Map<String, Object> data) throws Exception {
   		HttpServletRequest request = (HttpServletRequest)data.get("request");
		
		String mname = request.getParameter("manager_name");
   		System.out.println(mname);
   		String email = request.getParameter("email");
   		String pass = request.getParameter("pass");
   		AdminVO vo = new AdminVO(email, mname, pass);
   		AdminService service = new AdminService();
   		int result = service.registerAdmin(vo);
   		
		return "redirect:loginCheck.do";
	}

}
