package com.example.latte.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.MarketCategoryDao;
import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.MarketMidCategory;

@Service
public class MarketCategoryServiceImpl implements MarketCategoryService {

	@Autowired
	MarketCategoryDao marketCategoryDao;
	
	@Override
	public List<MarketCategory> getAllCategories() {
		return marketCategoryDao.getAllCategories();
	}
	
	@Override
	public MarketMidCategory getMidCategory(int categoryNo) {
		return marketCategoryDao.getMidCategory();
	}
	
	@Override
	public MarketMidCategory getLowCategory(int categoryNo) {
		return marketCategoryDao.getLowCategory();
	}
	
}
