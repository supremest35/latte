package com.example.latte.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.MiniHome;

@Mapper
@Transactional
public interface MiniHomeDao {
	void insertMiniHome(MiniHome miniHome);
	void updateMiniHome(MiniHome miniHome);
	MiniHome getMiniHomeByNo(int miniHomeNo);
	MiniHome getMiniHomeByUserNo(int userNo);
	MiniHome getMiniHomeByOption(Map<String, Object> opt);
	
	
	
}
