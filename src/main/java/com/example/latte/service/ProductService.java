package com.example.latte.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.Product;

public interface ProductService {

	List<Product> getAllProductList();
	
	Map<String, Object> getProducts(Map<String, Object> condition);
	
	Product getProductDetail(int prodNo);
	
	void addNewProduct(Product product);
}
