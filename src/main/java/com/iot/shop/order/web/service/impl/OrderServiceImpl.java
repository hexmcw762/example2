package com.iot.shop.order.web.service.impl;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.shop.order.domain.OrderVO;
import com.iot.shop.order.web.dao.OrderDAO;
import com.iot.shop.order.web.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	@Override
	public List<OrderVO> orderList(OrderVO vo) {
		
		return orderDAO.orderList(vo);
	}

	@Override
	public int orderProcDelete(OrderVO vo) {
		// TODO Auto-generated method stub
		return orderDAO.orderProcDelete(vo);
	}

	@Override
	public int orderProcUpdate(OrderVO vo) {
		// TODO Auto-generated method stub
		return orderDAO.orderProcUpdate(vo);
	}

	@Override
	public int insertOrders(Hashtable<Integer, OrderVO> hCartList) {
		//키를 받아서 해당되는 키 만큼 리스트에 담아서 
		//주문 내역을 리스트로 받아서 데이터베이스에 리스트로 저장  
		Set<Integer> keys = hCartList.keySet();
		List<OrderVO> list = new ArrayList<OrderVO>(keys.size());
		Iterator<Integer> iterKeys = keys.iterator();
		//장바구니에 있는 상품 모두를 하나씩 리스트에 저장
		while(iterKeys.hasNext()) {
			list.add(hCartList.get(iterKeys.next()));
		}
		
		return orderDAO.insertOrders(list);
	}
}
