package com.example.latte.service;

import java.util.List;
import java.util.Map;

import com.example.latte.vo.Product;
import com.example.latte.vo.ProductBrand;
import com.example.latte.vo.ProductColor;
import com.example.latte.vo.ProductMall;
import com.example.latte.vo.ProductPhoto;

public interface ProductService {

	List<Product> getAllProductList();
	List<ProductBrand> getAllBrands();
	List<ProductColor> getAllColors();
	List<ProductMall> getAllMalls();
	
	Map<String, Object> getProducts(Map<String, Object> condition);
	
	Product getProductByNo(int prodNo);
	Product getProductDetail(int prodNo);
	
	void addNewProduct(Product product);
	void addNewProductPhoto(ProductPhoto photo);
	void addNewProductBrand(ProductBrand brand);
	void updateProduct(Product product);
}
