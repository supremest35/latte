package com.example.latte.web.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.latte.service.MarketCategoryService;
import com.example.latte.service.ProductService;
import com.example.latte.vo.MarketCategory;

@RestController("apiCategoryController")
@RequestMapping("/api/category")
public class MarketCategoryController {

	@Autowired
	ProductService productService;
	
	@Autowired
	MarketCategoryService marketCategoryService;
	
	@RequestMapping("/list.do")
	public List<MarketCategory> getCategories(@RequestParam("no") int uppCatNo) {
		return null;
	}
}
