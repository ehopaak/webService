package com.shinhan.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class JobVO {
	 String job_id;
	 String job_title;
	 int min_salary;
	 int max_salary;

}
