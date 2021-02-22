package com.example.latte.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.AcornDao;
import com.example.latte.dao.MarketCategoryDao;
import com.example.latte.dto.Pagination;
import com.example.latte.vo.AcornItem;
import com.example.latte.vo.MarketCategory;

@Service
public class AcornServiceImpl implements AcornService {

	@Autowired
	AcornDao acornDao;
	
	@Autowired
	MarketCategoryDao marketCategoryDao;
	
	@Override
	public List<AcornItem> getAllAcornList() {
		return acornDao.getAllAcorns();
	}
	
	@Override
	public MarketCategory getCategory(int categoryNo) {
		return marketCategoryDao.getCategoryByNo(categoryNo);
	}
	
	@Override
	public List<MarketCategory> getCategories(int uppCatNo) {
		return marketCategoryDao.getCategoriesByUppCatNo(uppCatNo);
	}
	
	@Override
	public Map<String, Object> getAcorns(Map<String, Object> condition) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int totalRows = acornDao.getTotalCountByCondition(condition);
		
		Pagination pagination = new Pagination((Integer) condition.get("pageNo"), totalRows);
		
		List<AcornItem> acorns = acornDao.getAcornsBycondition(condition);
		
		result.put("acorns", acorns);
		result.put("pagination", pagination);
		
		return result;
	}
	
	@Override
	public AcornItem getAcornDetail(int acornNo) {
		return acornDao.getAcornByNo(acornNo);
	}
	
	@Override
	public void addNewAcorn(AcornItem acorn) {
		acornDao.insertAcorn(acorn);
	}
}
