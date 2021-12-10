package com.iot.shop.order.web.service;

import java.util.Hashtable;
import java.util.List;

import com.iot.shop.order.domain.OrderVO;

public interface OrderService {

	List<OrderVO> orderList(OrderVO vo);

	int orderProcDelete(OrderVO vo);

	int orderProcUpdate(OrderVO vo);

	int insertOrders(Hashtable<Integer, OrderVO> hCartList);

}
