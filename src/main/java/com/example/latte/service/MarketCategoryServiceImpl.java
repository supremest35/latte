package com.example.latte.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.MarketCategoryDao;
import com.example.latte.vo.MarketCategory;

@Service
public class MarketCategoryServiceImpl implements MarketCategoryService {

	@Autowired
	MarketCategoryDao marketCategoryDao;
	
	@Override
	public List<MarketCategory> getCategories(int uppNo) {
		return marketCategoryDao.getCategoriesByUppCatNo(uppNo);
		
	}
	
	@Override
	public List<MarketCategory> getCategoriesByOption() {
		// TODO Auto-generated method stub
		return null;
	}
}
