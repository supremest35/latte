package com.example.latte.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.latte.dto.WishItemDto;
import com.example.latte.service.WishService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.User;
import com.example.latte.vo.WishItem;

@Controller
@RequestMapping("/shopping/wish")
public class WishItemController {
	
	@Autowired
	WishService wishService;

	@RequestMapping("/insertItem.do")
	public String insertItem(@RequestParam("acornno") int acornNo,
			@RequestParam("amount") int amount) {
		
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		
		if (user == null) {
			return "redirect:/main.do";	// '로그인이 필요한 서비스입니다' 에러화면 추가.
		}
		WishItem wishItem = wishService.getWishItemByAcornNoAndUserNo(acornNo, user.getNo());
		if (wishItem == null) {
			wishItem = new WishItem();
			wishItem.setAcornNo(acornNo);
			wishItem.setUserNo(user.getNo());
			wishItem.setAmount(amount);
			wishService.insertWishItem(wishItem);
		} else {
			return "redirect:/shopping/wish/list.do?error=exist";
		}
		
		return "redirect:/shopping/wish/list.do";
	}
	
	@RequestMapping("/list.do")
	public String wishList(Model model) {
		
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		if (user == null) {
			return "redirect:/shopping/main.do";
		}
		
		List<WishItemDto> wishItemDtoList = wishService.getWishItemsList(user.getNo());
		
		int totalPrice = 0;
		for (WishItemDto dto : wishItemDtoList) {
			totalPrice += dto.getAcornPrice()*dto.getAcornAmount();
		}
		model.addAttribute("wishItems", wishItemDtoList);
		model.addAttribute("totalPrice", totalPrice);
		
		return "/shopping/wish/list";
	}
	
	@RequestMapping("/deleteItem.do")
	public String deleteCartItem(@RequestParam("wishno") List<Integer> wishNoList) {
		
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		if (user == null) {
			return "redirect:/shopping/main.do";
		}
		
		for (int wishNo : wishNoList) {
			wishService.deleteWishItem(wishNo);
		}
		
		return "redirect:/shopping/wish/list.do";
	}
	
	
}
