package com.iot.shop.order.domain;

import lombok.Data;

@Data
public class OrderVO {

	private int o_no 		;
	private int price 		;
	private int quantity 	;
	private String o_regdate;
	private String state 	; 
	private String m_id 	;
	private String m_name;
	private int    p_no 	;
	private int    stock 	;
	private String p_name;
}


