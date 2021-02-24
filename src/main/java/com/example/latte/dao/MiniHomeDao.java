package com.example.latte.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.MiniHome;

@Mapper
@Transactional
public interface MiniHomeDao {

	MiniHome getMiniHomeByOption(Map<String, Object> opt);
}
