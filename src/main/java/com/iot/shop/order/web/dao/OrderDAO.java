package com.iot.shop.order.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.iot.shop.order.domain.OrderVO;

@Mapper
public interface OrderDAO {

	List<OrderVO> orderList(OrderVO vo);

	int orderProcDelete(OrderVO vo);

	int orderProcUpdate(OrderVO vo);

	int insertOrders(List<OrderVO> list);

}
