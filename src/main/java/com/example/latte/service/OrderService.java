package com.example.latte.service;

import java.util.List;
import java.util.Map;

import com.example.latte.vo.Order;
import com.example.latte.vo.OrderItem;

public interface OrderService {
	
	Order getOrderByNo(int orderNo);

	List<Map<String, Object>> getMapOrderItemsByOrderNo(int orderNo);
	List<Order> getOrdersByUserNo(int userNo);
	List<OrderItem> getOrderItemsByOrderNo(int orderNo);
	
	Map<String, Object> getOrderItem(int acornNo, int amount);

	void insertOrder(Order order);
	void insertOrderItem(OrderItem orderItems);
	void updateOrder(Order order);
}
