package com.example.latte.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.latte.dao.ProductDao;
import com.example.latte.service.MarketCategoryService;
import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.Product;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	MarketCategoryService marketCategoryService;
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		List<Product> hitProducts = productDao.getHitProducts();
		model.addAttribute("hitProducts", hitProducts);
		
		return "/shopping/main";
	}
	
}
