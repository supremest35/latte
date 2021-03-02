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
import com.example.latte.vo.WishItem;

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
	public List<Map<String, Object>> getOrderItems(List<Integer> wishNoList) {
		List<Map<String, Object>> orderItemList = new ArrayList<Map<String,Object>>();
		
		for (int wishNo : wishNoList) {
			WishItem wishItem = wishItemDao.getWishItemByNo(wishNo);
			AcornItem acorn = acornDao.getAcornByNo(wishItem.getAcornNo());
			
			Map<String, Object> item = new HashMap<String, Object>();
			item.put("acornNo", acorn.getNo());
			item.put("acornCategoryNo", acorn.getCategoryNo());
			item.put("acornCategoryMidNo", acorn.getCategoryMidNo());
			item.put("acornName", acorn.getName());
			item.put("acornPrice", acorn.getPrice());
			item.put("amount", wishItem.getAmount());
			item.put("orderPrice", acorn.getPrice()*wishItem.getAmount());
			
			orderItemList.add(item);
		}
		
		return orderItemList;
	}
	@Override
	public List<Order> getOrdersByUserNo(int userNo) {
		return orderDao.getOrdersByUserNo(userNo);
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
}
