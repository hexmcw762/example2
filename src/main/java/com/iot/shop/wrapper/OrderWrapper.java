package com.iot.shop.wrapper;

import java.util.HashMap;
import java.util.Hashtable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.shop.mem.web.service.MemberService;
import com.iot.shop.order.domain.OrderVO;
import com.iot.shop.order.web.service.OrderService;
import com.iot.shop.product.web.service.ProductService;

@Service("orderWrapper")
public class OrderWrapper {

	@Autowired
	private OrderService orderService;
	@Autowired
	MemberService memberService;
	@Autowired
	private ProductService productService;

	
	public HashMap<String, String> orderProc(OrderVO ovo, Hashtable<Integer, OrderVO> hCartList) throws Exception{
		
		HashMap <String,String> map =
					new HashMap<String,String>();
		
		String url;
		String msg;
		int r = orderService.insertOrders(hCartList); 
		if(r>0) {
			productService.updateStock(hCartList);
			msg = "주문 완료 했습니다.";
			url = "orderList";
		}else {
			msg = "주문실패";
			url ="cartList";
		}
		
		map.put("url",url);
		map.put("msg",msg);
		return map;
	}
}
