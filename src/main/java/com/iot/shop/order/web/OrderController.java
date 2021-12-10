package com.iot.shop.order.web;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iot.shop.cart.web.service.CartService;
import com.iot.shop.mem.domain.MemberVO;
import com.iot.shop.order.domain.OrderVO;
import com.iot.shop.order.web.service.OrderService;
import com.iot.shop.wrapper.OrderWrapper;


@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	OrderWrapper orderWrapper;
	
	@Autowired
	CartService cartService;
	
	@RequestMapping("orderList")
	public String orderList(HttpServletRequest request, HttpServletResponse response, Model model, OrderVO ovo) {
		
		HttpSession session = request.getSession();
		MemberVO custom = (MemberVO) session.getAttribute("custom");
		//해당 고객의 주문내역 
		if(ovo!=null) {
			ovo.setM_id(custom.getMem_id());
		}
		List<OrderVO> oList = orderService.orderList(ovo);
		model.addAttribute("oList",oList);
		session.setAttribute("custom", custom);
		return"orderList";
	}
	
	
	@RequestMapping("customorderProc")
	public String customorderProc(HttpServletRequest request, Model model, OrderVO ovo) throws Exception {
		
		HttpSession session = request.getSession(true);
		MemberVO custom = (MemberVO)session.getAttribute("custom");
		Hashtable<Integer, OrderVO> hCartList = cartService.getCartList();
		//order에서 주문완료하면 재고가 하나 줄어야함 product에있는
		//transaction필요
		HashMap<String,String> map = orderWrapper.orderProc(ovo,hCartList);
		
		model.addAttribute("msg",map.get("msg"));
		session.setAttribute("custom", custom);
		return "redirect:orderList";
	}
	
	@RequestMapping("orderDetail")
	public String orderDetail(HttpServletRequest request, HttpServletResponse response, Model model, OrderVO vo) {
		
		String page="";
		HttpSession session = request.getSession();
		MemberVO mvo = null;
		if((MemberVO) session.getAttribute("admin")!=null) {
			mvo = (MemberVO) session.getAttribute("admin");
		}else if((MemberVO) session.getAttribute("custom")!=null) {
			mvo = (MemberVO) session.getAttribute("custom");
		}
		if(mvo!=null && mvo.getM_role().equals("admin")) {
			session.setAttribute("admin",mvo);
			page ="admin/orderDetail";
		}else if(mvo!=null && mvo.getM_role().equals("custom")) {
			session.setAttribute("custom", mvo);
			page = "orderDetail";
		}
		List<OrderVO> oList = orderService.orderList(vo);
		model.addAttribute("ovo",oList.get(0));
		return page;
	}
	
	//관리자 권한
	
	@RequestMapping("/orderMgr")
	public String orderMgr(HttpServletRequest request, HttpServletResponse response, Model model, OrderVO vo) {
		
		HttpSession session = request.getSession();
		MemberVO admin = (MemberVO) session.getAttribute("admin");
		List<OrderVO> oList = orderService.orderList(vo);
		model.addAttribute("oList",oList);
		session.setAttribute("admin", admin);
		return"admin/orderMgr";
	}
	
	@RequestMapping("/orderProc")
	public String orderProc(HttpServletRequest request, HttpServletResponse response, Model model, OrderVO vo) {
		
		HttpSession session = request.getSession();
		MemberVO admin = (MemberVO) session.getAttribute("admin");
		
		String url="orderMgr";
		String msg = "정상 수정 완료";
		
		String flag = request.getParameter("flag");
		int r = 0;
		if(flag.equals("U")) {
			r = orderService.orderProcUpdate(vo);
 			if(r>0) {
 				msg = "주문 상태 수정 완료";
 			}else {
 				msg = "주문 상태 수정 실패";
 			}
 			
		}else if(flag.equals("D")) {
			r = orderService.orderProcDelete(vo);
			if(r>0) {
 				msg = "주문 삭제 완료";
 			}else {
 				msg = "주문 삭제 실패";
 			}
		}
		
		session.setAttribute("msg",msg);
		session.setAttribute("url",url);
		session.setAttribute("admin", admin);
		return"MsgPage";
	}
	
	
}
