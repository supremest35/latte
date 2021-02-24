package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Product;
import com.example.latte.vo.ProductBrand;
import com.example.latte.vo.ProductColor;
import com.example.latte.vo.ProductMall;
import com.example.latte.vo.ProductPhoto;

@Mapper
@Transactional
public interface ProductDao {

	List<Product> getAllProducts();
	List<ProductBrand> getAllBrands();
	List<ProductColor> getAllColors();
	List<ProductMall> getAllMalls();
	
	int getTotalCountByCondition(Map<String, Object> condition);
	List<Product> getProductsBycondition(Map<String, Object> condition);
	
	List<Product> getHitProducts();
	Product getProductByNo(int prodNo);
	List<ProductPhoto> getPhotosByProductNo(int prodNo);
	
	void insertProduct(Product product);
	void insertPhoto(ProductPhoto photo);
	void insertBrand(ProductBrand brand);

}
