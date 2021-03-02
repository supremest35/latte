package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Order;
import com.example.latte.vo.OrderItem;

@Mapper
@Transactional
public interface OrderDao {
	
	Order getOrderByNo(int orderNo);

	List<Map<String, Object>> getgetMapOrderItemsByOrderNo(int orderNo);
	List<Order> getOrdersByUserNo(int userNo);
	List<OrderItem> getOrderItemsByOrderNo(int orderNo);
	
	void insertOrder(Order order);
	void insertOrderItem(OrderItem orderItem);
	void updateOrder(Order order);
}
