package com.example.latte.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.latte.form.OrderForm;
import com.example.latte.service.AcornService;
import com.example.latte.service.OrderService;
import com.example.latte.service.WishService;
import com.example.latte.vo.Order;
import com.example.latte.vo.OrderItem;
import com.example.latte.vo.User;

@Controller
@RequestMapping("/shopping/order")
public class OrderController {

	@Autowired
	OrderService orderService;
	@Autowired
	WishService wishService;
	@Autowired
	AcornService acornService;
	
	@RequestMapping("/form.do")
	public String orderForm(@RequestParam(name="acornno", required=false, defaultValue="-1") int acornNo,
			@RequestParam(name="amount", required=false, defaultValue="-1") int amount,
			@RequestParam(name="wishno", required=false) List<Integer> wishNoList,
			User user,
			Model model) {
		
			List<Map<String, Object>> orderItemList = new ArrayList<Map<String,Object>>();
			
			if (wishNoList == null) {
				Map<String, Object> item = orderService.getOrderItem(acornNo, amount);
				orderItemList.add(item);
			} else {
				orderItemList = orderService.getOrderItems(wishNoList);
			}
			int totalOrderPrice = 0;
			for (Map<String, Object> item : orderItemList) {
				int price = (Integer) item.get("acornPrice");
				int qty = (Integer) item.get("amount");
				
				totalOrderPrice += price*qty;
			}
			
			model.addAttribute("orderItemList", orderItemList);
			model.addAttribute("totalOrderPrice", totalOrderPrice);
			
		return "/shopping/order/form";
	}
	
	@RequestMapping("/insert.do")
	public String insert(OrderForm orderForm, User user) {
		Order order = new Order();
		order.setUserNo(user.getNo());
		order.setAmount(orderForm.getAcornNo().size());
		order.setStatus("결재완료");
		order.setRecNo(orderForm.getRecNo());
		order.setMessage(orderForm.getMessage());
		order.setTotalPrice(orderForm.getTotalPrice());
		
		List<Integer> acornNoList = orderForm.getAcornNo();
		List<Integer> salePriceList = orderForm.getSalePrice();
		List<Integer> amountList = orderForm.getAmount();
		
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		int loopCount = acornNoList.size();
		for (int i=0; i<loopCount; i++) {
			OrderItem item = new OrderItem();
			item.setAcornNo(acornNoList.get(i));
			item.setPrice(salePriceList.get(i));
			item.setAmount(amountList.get(i));
			
			orderItems.add(item);
		}
		
		orderService.insertOrder(order, orderItems);
		
		return "redirect:/shopping/main.do";
	}
}
