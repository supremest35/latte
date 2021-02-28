package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Dept;

@Mapper
@Transactional
public interface DeptDao {
	
	List<Dept> getAllDepts();
	Dept getDeptByNo(int no);
}
