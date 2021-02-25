package com.example.latte.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.OrderItem;

@Mapper
@Transactional
public interface OrderItemDao {

	void insertOrderItem(OrderItem orderItem);
}
