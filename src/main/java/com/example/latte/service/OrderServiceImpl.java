package com.example.latte.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.AcornDao;
import com.example.latte.dao.OrderDao;
import com.example.latte.dao.UserDao;
import com.example.latte.dao.WishItemDao;
import com.example.latte.vo.AcornItem;
import com.example.latte.vo.Order;
import com.example.latte.vo.OrderItem;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	AcornDao acornDao;
	@Autowired
	WishItemDao wishItemDao;
	@Autowired
	OrderDao orderDao;
	@Autowired
	UserDao userDao;

	@Override
	public Order getOrderByNo(int orderNo) {
		return orderDao.getOrderByNo(orderNo);
	}
	
	@Override
	public List<Map<String, Object>> getMapOrderItemsByOrderNo(int orderNo) {
		List<Map<String, Object>> orderItems = new ArrayList<Map<String,Object>>();
		List<OrderItem> items = orderDao.getOrderItemsByOrderNo(orderNo);
		
		for (OrderItem item : items) {
			Map<String, Object> orderItem = new HashMap<>();
			orderItem.put("itemNo", item.getNo());
			orderItem.put("orderNo", item.getOrderNo());
			orderItem.put("acornNo", item.getAcornNo());
			orderItem.put("acornName", item.getAcornName());
			orderItem.put("acornPrice", item.getPrice());
			orderItem.put("itemAmount", item.getAmount());
			orderItem.put("orderPrice", item.getPrice()*item.getAmount());
			
			orderItems.add(orderItem);
		}
		return orderItems;
	}
	@Override
	public List<Order> getOrdersByUserNo(int userNo) {
		return orderDao.getOrdersByUserNo(userNo);
	}
	@Override
	public List<OrderItem> getOrderItemsByOrderNo(int orderNo) {
		return orderDao.getOrderItemsByOrderNo(orderNo);
	}
	
	@Override
	public Map<String, Object> getOrderItem(int acornNo, int amount) {
		AcornItem acorn = acornDao.getAcornByNo(acornNo);
		
		Map<String, Object> item = new HashMap<String, Object>();
		item.put("acornno", acornNo);
		item.put("acornCategoryNo", acorn.getCategoryNo());
		item.put("acornCategoryMidNo", acorn.getCategoryMidNo());
		item.put("acornName", acorn.getName());
		item.put("acornPrice", acorn.getPrice());
		item.put("amount", amount);
		item.put("orderPrice", acorn.getPrice()*amount);
		
		return item;
	}
	
	@Override
	public void insertOrder(Order order) {
		orderDao.insertOrder(order);
	}
	@Override
	public void insertOrderItem(OrderItem orderItems) {
		orderDao.insertOrderItem(orderItems);
	}
	@Override
	public void updateOrder(Order order) {
		orderDao.updateOrder(order);
	}
}
