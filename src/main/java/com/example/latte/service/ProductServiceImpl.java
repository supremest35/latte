package com.example.latte.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.dao.MarketCategoryDao;
import com.example.latte.dao.ProductDao;
import com.example.latte.dto.Pagination;
import com.example.latte.dto.ProductDto;
import com.example.latte.vo.Product;
import com.example.latte.vo.ProductBrand;
import com.example.latte.vo.ProductColor;
import com.example.latte.vo.ProductMall;
import com.example.latte.vo.ProductPhoto;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;
	
	@Autowired
	MarketCategoryDao marketCategoryDao;
	
	@Override
	public List<Product> getAllProductList() {
		return productDao.getAllProducts();
	}
	@Override
	public List<Product> getProductDetailsByProdNo(int prodNo) {
		return productDao.getProductDetailsByProdNo(prodNo);
	}
	@Override
	public List<ProductBrand> getAllBrands() {
		return productDao.getAllBrands();
	}
	@Override
	public List<ProductColor> getAllColors() {
		return productDao.getAllColors();
	}
	@Override
	public List<ProductDto> getHitProducts() {
		List<ProductDto> dtos = productDao.getHitProducts();
		
		for (ProductDto dto : dtos) {
			 ProductDto productPrice = productDao.getProductMinAndMaxPrice(dto.getNo());
			 dto.setMinPrice(productPrice.getMinPrice());
			 dto.setMaxPrice(productPrice.getMaxPrice());
		}
		return dtos;
	}
	@Override
	public List<ProductMall> getAllMalls() {
		return productDao.getAllMalls();
	}
	
	@Override
	public Map<String, Object> getProducts(Map<String, Object> condition) {
		Map<String, Object> result = new HashMap<String, Object>();
		
//		int totalRows = productDao.getTotalCountByCondition(condition);
//		
//		Pagination pagination = new Pagination((Integer) condition.get("pageNo"), totalRows);
		
		List<ProductDto> products = productDao.getProductsBycondition(condition);
		
		for (ProductDto dto : products) {
			 ProductDto productPrice = productDao.getProductMinAndMaxPrice(dto.getNo());
			 dto.setMinPrice(productPrice.getMinPrice());
			 dto.setMaxPrice(productPrice.getMaxPrice());
		}
		
		result.put("products", products);
//		result.put("pagination", pagination);
		
		return result;
	}
	
	@Override
	public Product getProductByNo(int prodNo) {
		return productDao.getProductByNo(prodNo);
	}
	@Override
	public Product getProductDetail(int prodNo) {
		return productDao.getProductByNo(prodNo);
	}
	@Override
	public ProductDto getProductMinAndMaxPrice(int prodNo) {
		return productDao.getProductMinAndMaxPrice(prodNo);
	}
	
	@Transactional
	@Override
	public void addNewProduct(Product product) {
		productDao.insertProduct(product);
		productDao.insertProductDetail(product);
	}
	@Override
	public void addNewProductPhoto(ProductPhoto photo) {
		productDao.insertPhoto(photo);
	}
	@Override
	public void addNewProductBrand(ProductBrand brand) {
		productDao.insertBrand(brand);
	}
	@Override
	public void updateProduct(Product product) {
		productDao.updateProduct(product);
	}
}
