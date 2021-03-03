package com.example.latte.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.example.latte.service.UserService;
import com.example.latte.service.WishService;
import com.example.latte.util.SessionUtils;
import com.example.latte.util.StringUtils;
import com.example.latte.vo.AcornItem;
import com.example.latte.vo.Order;
import com.example.latte.vo.OrderItem;
import com.example.latte.vo.User;
import com.example.latte.vo.UserItem;
import com.example.latte.vo.WishItem;

@Controller
@RequestMapping("/shopping/order")
public class OrderController {

	@Autowired
	OrderService orderService;
	@Autowired
	WishService wishService;
	@Autowired
	AcornService acornService;
	@Autowired
	UserService userService;
	
	@RequestMapping("/cancel.do")
	public String cancelOrder(@RequestParam(name="orderno") int orderNo,
			Model model) {
		
		Order order = orderService.getOrderByNo(orderNo);
		
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		if (user == null) {
			return "redirect:/shopping/main.do";
		}
		
		if (order.getUserNo() != user.getNo()) {
			return "redirect:/shopping/order/detail.do?orderno="+orderNo+"&error=fail";
		}
		
		order.setStatus("주문취소");
		orderService.updateOrder(order);
		
		List<Map<String, Object>> items = orderService.getMapOrderItemsByOrderNo(orderNo);
		for (Map<String, Object> item : items) {
			int acornNo = (Integer) item.get("acornNo");
			int itemAmount = (Integer) item.get("itemAmount");
			
			AcornItem acorn = acornService.getAcornByNo(acornNo);
			acorn.setStock(acorn.getStock() + itemAmount);
			acornService.updateAcorn(acorn);
		}
		
		return "redirect:/shopping/order/list.do";
	}
	
	@RequestMapping("/detail.do")
	public String orderDetail(@RequestParam(name="orderno") int orderNo,
			Model model) {
		
		Order order = orderService.getOrderByNo(orderNo);
		String recId = order.getRecId();
		
		model.addAttribute("order", order);
		model.addAttribute("recUser", userService.getUserById(recId));
		
		List<OrderItem> orderItems = orderService.getOrderItemsByOrderNo(orderNo);
		
		model.addAttribute("orderItems", orderItems);
		
		return "/shopping/order/detail";
	}
	
	@RequestMapping("/form.do")
	public String orderForm(@RequestParam(name="acornno", required=false, defaultValue="-1") List<Integer> acornNoArr,
			@RequestParam(name="amount", required=false, defaultValue="-1") int amount,
			@RequestParam(name="wishno", required=false) List<Integer> wishNoList,
			Model model) {
		
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		if (user == null) {
			return "redirect:/shopping/main.do";
		}
		
		List<Map<String, Object>> orderItemList = new ArrayList<Map<String,Object>>();
		
		for (int i=0; i<acornNoArr.size(); i++ ) {
			if (acornNoArr.get(i) > -1) {
				AcornItem acorn = acornService.getAcornByNo(acornNoArr.get(i));
				
				Map<String, Object> item = new HashMap<>();
				item.put("acornNo", acornNoArr.get(i));
				item.put("acornCategoryNo", acorn.getCategoryNo());
				item.put("acornName", acorn.getName());
				item.put("acornPrice", acorn.getPrice());
				item.put("amount", amount);
				item.put("orderPrice", acorn.getPrice()*amount);
				
				orderItemList.add(item);
			}
		}
		
		if (wishNoList != null) {
			for (int wishNo : wishNoList) {
				WishItem wishItem = wishService.getWishItemByNo(wishNo);
				AcornItem acorn = acornService.getAcornByNo(wishItem.getAcornNo());
				
				Map<String, Object> item = new HashMap<>();
				item.put("acornNo", wishItem.getAcornNo());
				item.put("acornCategoryNo", acorn.getCategoryNo());
				item.put("acornName", acorn.getName());
				item.put("acornPrice", acorn.getPrice());
				item.put("amount", wishItem.getAmount());
				item.put("orderPrice", acorn.getPrice()*wishItem.getAmount());
				
				orderItemList.add(item);
			}
		}
		
		int totalOrderPrice = orderItemList.stream().mapToInt(item -> ((Integer) item.get("acornPrice")) * ((Integer) item.get("amount"))).sum();
		
		model.addAttribute("user", user);
		model.addAttribute("orderItemList", orderItemList);
		model.addAttribute("totalOrderPrice", totalOrderPrice);
			
		return "/shopping/order/form";
	}
	
	@RequestMapping("/insert.do")
	public String insert(@RequestParam(name="acornNo") String[] acornNoArr,
			OrderForm orderForm) {
		
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		if (user == null) {
			return "redirect:/shopping/main.do";
		}
		
		String description = null;
		int firstAcornNo = StringUtils.stringToInt(acornNoArr[0]);
		AcornItem firstAcorn = acornService.getAcornByNo(firstAcornNo); 
		
		if (orderForm.getAcornNo().size() > 1) {
			description = firstAcorn.getName() + " 외" + (orderForm.getAcornNo().size() - 1) + "종";
		} else {
			description = firstAcorn.getName();
		}
		
		Order order = new Order();
		order.setUserNo(user.getNo());
		order.setDescription(description);
		order.setAmount(orderForm.getAcornNo().size());
		order.setStatus("결재완료");
		order.setRecId(orderForm.getRecId());
		order.setMessage(orderForm.getMessage());
		order.setTotalPrice(orderForm.getTotalPrice());
		
		orderService.insertOrder(order);
		
		List<Integer> acornNoList = orderForm.getAcornNo();
		List<AcornItem> acorns = new ArrayList<>();
		for (int i=0; i<acornNoList.size(); i++) {
			AcornItem acorn = acornService.getAcornByNo(acornNoList.get(i));
			acorns.add(acorn);
		}
		List<Integer> priceList = orderForm.getPrice();
		List<Integer> amountList = orderForm.getAmount();
		
		int loopCount = acornNoList.size();
		for (int i=0; i<loopCount; i++) {
			OrderItem item = new OrderItem();
			item.setOrderNo(order.getNo());
			item.setAcornNo(acornNoList.get(i));
			item.setAcornName(acorns.get(i).getName());
			item.setPrice(priceList.get(i));
			item.setAmount(amountList.get(i));
			
			orderService.insertOrderItem(item);
			
			AcornItem acorn = acornService.getAcornByNo(acornNoList.get(i));
			acorn.setStock(acorn.getStock() - amountList.get(i));
			acornService.updateAcorn(acorn);
			
			wishService.deleteWishItemByUserNoAndAcornNo(user.getNo(), acornNoList.get(i));
		}
		
		// 유저아이템 등록
		for (int i=0; i<loopCount; i++) {
			UserItem item = new UserItem();
			item.setUserNo(user.getNo());
			item.setAcornNo(acornNoList.get(i));
			item.setAcornName(acorns.get(i).getName());
			acornService.insertUserItem(item);
		}
		
		return "redirect:/shopping/order/list.do";
	}
	
	@RequestMapping("/list.do")
	public String orderList(Model model) {
		
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		if (user == null) {
			return "redirect:/shopping/main.do";
		}
		
		model.addAttribute("orders", orderService.getOrdersByUserNo(user.getNo()));
		
		return "/shopping/order/list";
	}
}
