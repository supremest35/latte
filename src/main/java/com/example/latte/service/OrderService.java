package com.example.latte.service;

import java.util.List;
import java.util.Map;

import com.example.latte.vo.Order;
import com.example.latte.vo.OrderItem;

public interface OrderService {

	List<Map<String, Object>> getOrderItems(List<Integer> wishNoList);
	
	Map<String, Object> getOrderItem(int acornNo, int amount);

	void insertOrder(Order order, List<OrderItem> orderItems);

}
