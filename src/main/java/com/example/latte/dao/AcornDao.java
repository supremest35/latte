package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import com.example.latte.vo.AcornItem;

public interface AcornDao {

	int getTotalCountByCondition(Map<String, Object> condition);
	List<AcornItem> getAcornsBycondition(Map<String, Object> condition);
	
	AcornItem getAcornByNo(int acornNo);
	
	void insertAcorn(AcornItem acorn);

	List<AcornItem> getAllAcorns();
}
