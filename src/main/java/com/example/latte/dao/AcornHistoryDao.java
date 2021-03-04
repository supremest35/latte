package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.AcornHistory;

@Mapper
@Transactional
public interface AcornHistoryDao {

	List<AcornHistory> getAcornHistoriesByUserNo(int userNo);
	
	void insertAcornHistory(AcornHistory acornHistory);
}
