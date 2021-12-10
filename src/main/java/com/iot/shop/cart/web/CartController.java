package com.iot.shop.cart.web;

import java.util.Hashtable;

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

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("cartList")
	public String cartList(HttpServletRequest request, HttpServletResponse response,OrderVO ovo, Model model) {
		
		HttpSession session = request.getSession(true);
		Hashtable<Integer,OrderVO> hCartList = 
				(Hashtable<Integer,OrderVO>)session.getAttribute("hCartList");
		
		MemberVO mvo = (MemberVO) session.getAttribute("custom");
		
		if(hCartList==null || hCartList.size()==0) {
			hCartList = new Hashtable<Integer,OrderVO>();
		}
		
		session.setAttribute("hCartList", hCartList);
		session.setAttribute("custom", mvo);
		
		return "cartList";
	}
	
	@RequestMapping("cartProc")
	public String cartProc(HttpServletRequest request, HttpServletResponse response,OrderVO ovo, Model model) {
		
		//해시테이블 사용
		String flag = request.getParameter("flag");
		//세션에 cart해시테이블 저장
		HttpSession session = request.getSession(true);
		Hashtable<Integer, OrderVO> hCartList = 
				(Hashtable<Integer, OrderVO>) session.getAttribute("hCartList");
		if(hCartList == null) {
			hCartList = new Hashtable<Integer,OrderVO>();
		}
		//해당 장바구니를 우선 저장해 둬야 함
		cartService.setCartList(hCartList);
		
		MemberVO mvo = (MemberVO) session.getAttribute("custom");
		
		if(mvo!=null) {//누가 구매하는지 정보 저장
			ovo.setM_id(mvo.getMem_id());
		}
		
		if("add".equals(flag)) {
			//카트테이블인 해시 테이블에 추가하는 서비스 호출
			hCartList = cartService.addCart(ovo);
		}else if("update".equals(flag)) {
			//카트테이블인 해시 테이블에 수정하는 서비스 호출
			hCartList = cartService.updateCart(ovo);
		}else if("delete".equals(flag)) {
			//카트테이블인 해시 테이블에 삭제하는 서비스 호출
			hCartList = cartService.deleteCart(ovo);
		}
		
		session.setAttribute("hCartList",hCartList);
		session.setAttribute("custom", mvo);
		
		return "cartList"; //세션 없을시 바로 로그인 나오게 
	}
}
