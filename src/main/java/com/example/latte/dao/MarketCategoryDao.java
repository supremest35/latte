package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.MarketCategory;
import com.example.latte.vo.MarketMidCategory;

@Mapper
@Transactional
public interface MarketCategoryDao {

	List<MarketCategory> getAllCategories();
	
	MarketMidCategory getMidCategory();
	MarketMidCategory getLowCategory();

	MarketCategory getCategoryByNo(int categoryNo);
	List<MarketCategory> getCategoriesByUppCatNo(int uppCatNo);

	
}
