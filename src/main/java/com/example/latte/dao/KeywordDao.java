package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Keyword;

@Mapper
@Transactional
public interface KeywordDao {

	void insertKeyword(Keyword keyword);
	void deleteKeyword(int miniHomeNo);
	List<Keyword> getKeywordsByProfileNo(int miniHomeNo);
}
