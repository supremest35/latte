package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Order;
import com.example.latte.vo.OrderItem;

@Mapper
@Transactional
public interface OrderDao {

	List<Order> getOrdersByUserNo(int userNo);
	
	void insertOrder(Order order);
	void insertOrderItem(OrderItem orderItem);
}
