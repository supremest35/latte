package com.example.latte.service;

import java.util.List;

import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.MarketMidCategory;

public interface MarketCategoryService {

	List<MarketCategory> getAllCategories();
	
	MarketMidCategory getMidCategory(int categoryNo);
	MarketMidCategory getLowCategory(int categoryNo);
	
}
