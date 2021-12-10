package com.iot.shop.index.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iot.shop.mem.domain.MemberVO;

@Controller
public class IndexController {

	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping("/")
	private String index(HttpServletRequest request, HttpServletResponse response,Model model,MemberVO vo) {
	 
		return "Index";
	}
	
	@RequestMapping("/admin")
	private String adminIndex(HttpServletRequest request, HttpServletResponse response,Model model,MemberVO vo) {
	 
		return "admin/Index";
	}
}
