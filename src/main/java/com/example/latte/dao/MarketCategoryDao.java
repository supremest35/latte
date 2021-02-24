package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.latte.vo.MarketCategory;

@Mapper
public interface MarketCategoryDao {

	/**
	 * 모든 상품의 카테고리 정보를 반환한다.
	 * @return 카테고리 리스트
	 */
	List<MarketCategory> getAllCategories();
	
	/**
	 * 카테고리 번호로 카테고리정보를 조회해서 반환한다.
	 * @param categoryNo 카테고리 번호
	 * @return 카테고리
	 */
	MarketCategory getCategoryByNo(int categoryNo);
	
	/**
	 * 상위 카테고리의 번호로 하위 카테고리 정보를 반환한다.
	 * @param uppNo 상위 카테고리 번호
	 * @return 카테고리 리스트
	 */
	List<MarketCategory> getCategoriesByUppCatNo(int uppCatNo);
	
	List<MarketCategory> getCategoriesByOption(Map<String, Integer> option);
}
