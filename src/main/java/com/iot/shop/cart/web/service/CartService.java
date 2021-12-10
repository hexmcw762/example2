package com.iot.shop.cart.web.service;

import java.util.Hashtable;

import com.iot.shop.order.domain.OrderVO;

public interface CartService {

	void setCartList(Hashtable<Integer, OrderVO> hCartList);

	public Hashtable<Integer,OrderVO> getCartList();

	Hashtable<Integer, OrderVO> addCart(OrderVO ovo);

	Hashtable<Integer, OrderVO> updateCart(OrderVO ovo);

	Hashtable<Integer, OrderVO> deleteCart(OrderVO ovo);
}
