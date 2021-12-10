package com.iot.shop.home.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class examController {

	@RequestMapping("/h")
	public String con() {
		return "gi";
	}
	
	@GetMapping("/hi")
	public String helloo(String name) {
		return "Hello "+name;
	}
}
