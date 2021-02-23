package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.AcornItem;

@Mapper
@Transactional
public interface AcornDao {

	int getTotalCountByCondition(Map<String, Object> condition);
	List<AcornItem> getAcornsBycondition(Map<String, Object> condition);
	
	AcornItem getAcornByNo(int acornNo);
	
	void insertAcorn(AcornItem acorn);

	List<AcornItem> getAllAcorns();
}
