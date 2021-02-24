package com.example.latte.web.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.latte.service.ProductService;
import com.example.latte.vo.Product;

@RestController("apiProductController")
@RequestMapping("/api/product")
public class ProductController {

	@Autowired
	ProductService productService;
	
	@RequestMapping("/detail.do")
	public Product detail(@RequestParam("prodno") int prodNo) {
		Product product = productService.getProductDetail(prodNo);
		return product;
	}
}
