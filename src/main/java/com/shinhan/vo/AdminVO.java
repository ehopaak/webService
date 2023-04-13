package com.shinhan.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//DTO,VO,JavaBeans : data를 저장해서 전송하기위해 
@AllArgsConstructor
@Getter@Setter
@NoArgsConstructor
@ToString
public class AdminVO {
	private String email;
	private String manager_name;
	private String pass;
	private String pic;

	public AdminVO(String email, String manager_name, String pass) {
		super();
		this.email = email;
		this.manager_name = manager_name;
		this.pass = pass;
	}
	
}

 