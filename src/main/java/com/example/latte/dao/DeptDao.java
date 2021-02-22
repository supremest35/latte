package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.latte.vo.Dept;

@Mapper
public interface DeptDao {
	
	List<Dept> getAllDepts();
}
