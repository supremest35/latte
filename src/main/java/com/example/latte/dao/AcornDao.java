package com.example.latte.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.latte.vo.AcornItem;
@Mapper
public interface AcornDao {

	int getTotalCountByCondition(Map<String, Object> condition);
	List<AcornItem> getAcornsBycondition(Map<String, Object> condition);
	
	AcornItem getAcornByNo(int acornNo);
	
	void insertAcorn(AcornItem acorn);

	List<AcornItem> getAllAcorns();
}
