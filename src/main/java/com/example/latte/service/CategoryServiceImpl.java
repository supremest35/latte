package com.example.latte.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.CategoryDao;
import com.example.latte.vo.Category;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryDao categoryDao;
	
	@Override
	public Category getCategoryByNo(int catno) {
		return categoryDao.getCategoryByNo(catno);
	}

}
