package com.example.latte.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.MarketCategoryDao;
import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.MarketLowCategory;
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
	public List<MarketMidCategory> getAllMidCategories() {
		return marketCategoryDao.getAllMidCategories();
	}
	@Override
	public List<MarketLowCategory> getAllLowCategories() {
		return marketCategoryDao.getAllLowCategories();
	}
	
	@Override
	public List<MarketMidCategory> getMidCategories(int uppNo) {
		return marketCategoryDao.getMidCategories(uppNo);
	}
	@Override
	public List<MarketLowCategory> getLowCategories(int midCategoryNo) {
		return marketCategoryDao.getLowCategories(midCategoryNo);
	}
	
	@Override
	public MarketCategory getCategoryByNo(int categoryNo) {
		return marketCategoryDao.getCategoryByNo(categoryNo);
	}
	@Override
	public MarketMidCategory getMidCategory(int categoryNo) {
		return marketCategoryDao.getMidCategory(categoryNo);
	}
	@Override
	public MarketLowCategory getLowCategory(int categoryNo) {
		return marketCategoryDao.getLowCategory(categoryNo);
	}
	
}
