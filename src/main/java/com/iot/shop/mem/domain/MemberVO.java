package com.iot.shop.mem.domain;

import lombok.Data;

@Data
public class MemberVO {

	 private String mem_id; 
	 private String m_passwd; 
	 private String m_name; 
	 private String m_email; 
	 private String m_phone;
	 private String zipcode; 
	 private String address; 
	 private String address2; 
	 private String m_job; 
	 private String m_role;
	 private String m_regDate; 
}
