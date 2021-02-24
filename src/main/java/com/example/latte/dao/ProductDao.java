package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import com.example.latte.vo.Product;
import com.example.latte.vo.ProductPhoto;

public interface ProductDao {

	int getTotalCountByCondition(Map<String, Object> condition);
	List<Product> getProductsBycondition(Map<String, Object> condition);
	
	List<Product> getHitProducts();
	Product getProductByNo(int prodNo);
	List<ProductPhoto> getPhotosByProductNo(int prodNo);
	
	void insertProduct(Product product);
	void insertPhoto(ProductPhoto photo);

	List<Product> getAllProducts();
}
