package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Qna;

@Mapper
@Transactional
public interface QnaDao {

	void insertQna(Qna qna);
	void deleteQna(int miniHomeNo);
	List<Qna> getQnasByMiniHomeNo(int miniHomeNo);
}
