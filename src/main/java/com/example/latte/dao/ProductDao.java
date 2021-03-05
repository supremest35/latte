package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.dto.ProductDto;
import com.example.latte.vo.Product;
import com.example.latte.vo.ProductBrand;
import com.example.latte.vo.ProductColor;
import com.example.latte.vo.ProductMall;
import com.example.latte.vo.ProductPhoto;

@Mapper
@Transactional
public interface ProductDao {

	int getTotalCountByCondition(Map<String, Object> condition);
	
	Product getProductByNo(int prodNo);
	ProductDto getProductMinAndMaxPrice(int prodNo);

	List<Product> getAllProducts();
	List<Product> getAllProductDetails();
	List<Product> getProductDetailsByProdNo(int prodNo);
	List<ProductBrand> getAllBrands();
	List<ProductColor> getAllColors();
	List<ProductDto> getHitProducts();
	List<ProductDto> getProductsBycondition(Map<String, Object> condition);
	List<ProductMall> getAllMalls();
	List<ProductPhoto> getPhotosByProductNo(int prodNo);
	
	void insertBrand(ProductBrand brand);
	void insertPhoto(ProductPhoto photo);
	void insertProduct(Product product);
	void insertProductDetail(Product product);
	void updateProduct(Product product);
}
