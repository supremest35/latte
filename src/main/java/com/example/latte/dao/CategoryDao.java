package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.latte.vo.Category;

@Mapper
public interface CategoryDao {

	List<Category> getAllCategories();
	
	Category getCategoryByNo(int categoryNo);
}
