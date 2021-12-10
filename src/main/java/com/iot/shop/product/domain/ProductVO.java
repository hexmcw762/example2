package com.iot.shop.product.domain;

import lombok.Data;

@Data
public class ProductVO {

	private int p_no;
	private int stock;
	private int price;
	private String p_name;
	private String detail;
	private String pr_date;
	private String image;
	private String path;
}
