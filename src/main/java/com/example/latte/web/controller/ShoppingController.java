package com.example.latte.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.latte.dao.ProductDao;
import com.example.latte.service.AcornHistoryService;
import com.example.latte.service.AcornService;
import com.example.latte.service.MarketCategoryService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.Product;
import com.example.latte.vo.User;
import com.example.latte.vo.UserItem;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Autowired
	ProductDao productDao;
	@Autowired
	AcornHistoryService acornHistoryService;
	@Autowired
	AcornService acornService;
	@Autowired
	MarketCategoryService marketCategoryService;
	
	@RequestMapping("/my/acornhistory.do")
	public String acornHistory(Model model) {
		
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		if (user == null) {
			return "redirect:/shopping/main.do";
		}
		
		model.addAttribute("acornHistories", acornHistoryService.getAcornHistoriesByUserNo(user.getNo()));
		
		return "/shopping/my/acornhistory";
	}
	
	@RequestMapping("/my/havingitem.do")
	public String havingItem(Model model) {
		
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		if (user == null) {
			return "redirect:/shopping/main.do";
		}
		
		List<UserItem> userItems = acornService.getUserItems(user.getNo());
		
		model.addAttribute("userItems", userItems);
		
		return "/shopping/my/havingitem";
	}
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		List<Product> hitProducts = productDao.getHitProducts();
		model.addAttribute("hitProducts", hitProducts);

		return "/shopping/main";
	}
}
