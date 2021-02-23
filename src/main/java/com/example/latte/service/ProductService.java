package com.example.latte.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.Product;

@Transactional
public interface ProductService {

	/**
	 * 모든 상품정보를 반환한다.
	 * @return 전체 상품목록
	 */
	List<Product> getAllProductList();
	
	/**
	 * 카테고리 번호에 대한 카테고리 정보를 제공한다.
	 * @param categoryNo 카테고리 번호
	 * @return 카테고리 정보
	 */
	MarketCategory getCategory(int categoryNo);
	
	/**
	 * 상위 카테고리 번호에 대한 카테고리 정보를 제공한다.
	 * @param uppCatNo 상위 카테고리 번호
	 * @return 하위 카테고리 목록
	 */
	List<MarketCategory> getCategories(int uppCatNo);
	
	/**
	 * 지정된 검색조건에 해당하는 상품목록 및 페이징정보를 반환한다.
	 * @param condition 검색조건
	 * @return 상품목록과 페이징 정보를 포함하고 있는 Map객체
	 */
	Map<String, Object> getProducts(Map<String, Object> condition);
	
	/**
	 * 지정된 상품번호의 상품정보를 제공한다.
	 * @param prodNo 상품번호
	 * @return 상품정보
	 */
	Product getProductDetail(int prodNo);
	
	/**
	 * 새로운 상품을 DB에 등록한다.
	 * @param product 등록할 상품정보
	 */
	void addNewProduct(Product product);
}
