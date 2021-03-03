package com.example.latte.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.AcornItem;
import com.example.latte.vo.UserItem;

@Mapper
@Transactional
public interface AcornDao {

	AcornItem getAcornByNo(int acornNo);
	
	int getTotalCountByCondition(Map<String, Object> condition);
	
	List<AcornItem> getAcornsBycondition(Map<String, Object> condition);
	List<AcornItem> getAllAcorns();
	List<UserItem> getUserItems(int userNo);
	
	void insertAcorn(AcornItem acorn);
	void insertUserItem(UserItem userItem);
	void updateAcorn(AcornItem acorn);
}
