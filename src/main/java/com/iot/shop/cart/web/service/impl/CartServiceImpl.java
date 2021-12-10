package com.iot.shop.cart.web.service.impl;

import java.util.Hashtable;

import org.springframework.stereotype.Service;

import com.iot.shop.cart.web.service.CartService;
import com.iot.shop.order.domain.OrderVO;

@Service("cartService")
public class CartServiceImpl implements CartService {

	private Hashtable<Integer,OrderVO> hCartList;
	
	@Override
	public void setCartList(Hashtable<Integer, OrderVO> hCartList) {
		
		this.hCartList = hCartList;
	}

	@Override
	public Hashtable<Integer, OrderVO> getCartList() {
		
		return hCartList;
	}

	@Override
	public Hashtable<Integer, OrderVO> addCart(OrderVO ovo) {
		
		int p_no = ovo.getP_no();
		int quantity = ovo.getQuantity();
		
		if(quantity>0) {
			if(hCartList.containsKey(p_no)) {
				
				OrderVO tempOvo = (OrderVO)hCartList.get(p_no);
				quantity += tempOvo.getQuantity();
				hCartList.put(p_no, tempOvo);
			}else {
		 
			hCartList.put(p_no, ovo);
		}
		}
		return hCartList;
	}

	@Override
	public Hashtable<Integer, OrderVO> updateCart(OrderVO ovo) {
		
		int p_no = ovo.getP_no();
		int quantity = ovo.getQuantity();
		if(hCartList.containsKey(p_no)) {
			OrderVO tempOvo = (OrderVO)hCartList.get(p_no); 
			tempOvo.setQuantity(quantity);
			hCartList.put(p_no, tempOvo);
		}
		
		return hCartList;
	}

	@Override
	public Hashtable<Integer, OrderVO> deleteCart(OrderVO ovo) {
		
		int p_no = ovo.getP_no();
		hCartList.remove(p_no);
	
		return hCartList;
	}

	}
