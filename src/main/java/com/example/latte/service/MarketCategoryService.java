package com.example.latte.service;

import java.util.List;

import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.MarketLowCategory;
import com.example.latte.vo.MarketMidCategory;

public interface MarketCategoryService {

	List<MarketCategory> getAllCategories();
	List<MarketMidCategory> getAllMidCategories();
	List<MarketLowCategory> getAllLowCategories();
	
	List<MarketMidCategory> getMidCategories(int uppNo);
	List<MarketLowCategory> getLowCategories(int midCategoryNo);
	
	MarketCategory getCategoryByNo(int categoryNo);
	MarketMidCategory getMidCategory(int categoryNo);
	MarketLowCategory getLowCategory(int categoryNo);
}
