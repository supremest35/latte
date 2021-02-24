package com.example.latte.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.MarketCategory;

@Transactional
public interface MarketCategoryService {

	List<MarketCategory> getCategories(int uppNo);
	
	List<MarketCategory> getCategoriesByOption();
}
