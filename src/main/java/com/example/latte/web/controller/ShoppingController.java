package com.example.latte.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.latte.dao.MarketCategoryDao;
import com.example.latte.dao.ProductDao;
import com.example.latte.vo.Product;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	MarketCategoryDao marketCategoryDao;
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		List<Product> hitProducts = productDao.getHitProducts();
		
		model.addAttribute("hitProducts", hitProducts);
		
		return "/shopping/main";
	}
	
}