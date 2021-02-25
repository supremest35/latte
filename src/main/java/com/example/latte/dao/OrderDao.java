package com.example.latte.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Order;

@Mapper
@Transactional
public interface OrderDao {

	void insertOrder(Order order);

}
