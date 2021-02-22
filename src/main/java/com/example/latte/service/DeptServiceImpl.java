package com.example.latte.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.DeptDao;
import com.example.latte.vo.Dept;

@Service
public class DeptServiceImpl implements DeptService{
	
	@Autowired
	DeptDao deptDao;
	
	@Override
	public List<Dept> getAllDepts() {
		return deptDao.getAllDepts();
	}
}
