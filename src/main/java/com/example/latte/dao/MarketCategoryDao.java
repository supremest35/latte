package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.MarketLowCategory;
import com.example.latte.vo.MarketMidCategory;

@Mapper
@Transactional
public interface MarketCategoryDao {

	List<MarketCategory> getAllCategories();
	List<MarketMidCategory> getMidCategories();
	List<MarketLowCategory> getLowCategories();
	
	List<MarketMidCategory> getMidCategories(int uppNo);
	List<MarketLowCategory> getLowCategories(int midCategoryNo);
	
	MarketMidCategory getMidCategory(int categoryNo);
	MarketLowCategory getLowCategory(int categoryNo);

	MarketCategory getCategoryByNo(int categoryNo);
	List<MarketCategory> getCategoriesByUppCatNo(int uppCatNo);

}
