package com.example.latte.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.MiniHome;

@Mapper
@Transactional
public interface MiniHomeDao {

	MiniHome getMiniHomeByUserNo(int userNo);
}
