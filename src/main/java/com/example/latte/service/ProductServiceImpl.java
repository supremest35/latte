package com.example.latte.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.MarketCategoryDao;
import com.example.latte.dao.ProductDao;
import com.example.latte.dto.Pagination;
import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.Product;
import com.example.latte.vo.ProductBrand;
import com.example.latte.vo.ProductColor;

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
	public List<ProductBrand> getAllBrands() {
		return productDao.getAllBrands();
	}
	@Override
	public List<ProductColor> getAllColors() {
		return productDao.getAllColors();
	}
	
	@Override
	public Map<String, Object> getProducts(Map<String, Object> condition) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int totalRows = productDao.getTotalCountByCondition(condition);
		
		Pagination pagination = new Pagination((Integer) condition.get("pageNo"), totalRows);
		
		List<Product> products = productDao.getProductsBycondition(condition);
		
		result.put("products", products);
		result.put("pagination", pagination);
		
		return result;
	}
	
	@Override
	public Product getProductDetail(int prodNo) {
		return productDao.getProductByNo(prodNo);
	}
	
	@Override
	public void addNewProduct(Product product) {
		productDao.insertProduct(product);
	}
}
