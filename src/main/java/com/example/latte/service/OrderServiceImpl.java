package com.example.latte.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.AcornDao;
import com.example.latte.dao.OrderDao;
import com.example.latte.dao.OrderItemDao;
import com.example.latte.dao.UserDao;
import com.example.latte.dao.WishItemDao;
import com.example.latte.vo.AcornItem;
import com.example.latte.vo.Order;
import com.example.latte.vo.OrderItem;
import com.example.latte.vo.User;
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
	OrderItemDao orderItemDao;
	@Autowired
	UserDao userDao;

	@Override
	public List<Map<String, Object>> getOrderItems(List<Integer> wishItemNoList) {
		List<Map<String, Object>> orderItemList = new ArrayList<Map<String,Object>>();
		
		for (int wishItemNo : wishItemNoList) {
			WishItem wishItem = wishItemDao.getCartItemByNo(wishItemNo);
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
	public void insertOrder(Order order, List<OrderItem> orderItems) {
		
		AcornItem firstAcorn = acornDao.getAcornByNo(orderItems.get(0).getAcornNo());
		String description = firstAcorn.getName()
				+ (orderItems.size() > 1 ? "외 " + (orderItems.size()-1) + "종" : "");
		order.setDescription(description);
		
		orderDao.insertOrder(order);
		
		for (OrderItem orderItem : orderItems) {
			orderItem.setOrderNo(order.getNo());
			orderItemDao.insertOrderItem(orderItem);
			
			AcornItem acorn = acornDao.getAcornByNo(orderItem.getAcornNo());
			acorn.setStock(acorn.getStock() - orderItem.getAmount());
			acornDao.updateAcorn(acorn);
		}
		
		User user = userDao.getUserByNo(order.getUserNo());
		user.setAcornCnt(user.getAcornCnt() - order.getUsedAcornAmount());
		userDao.updateUser(user);
	}
}
