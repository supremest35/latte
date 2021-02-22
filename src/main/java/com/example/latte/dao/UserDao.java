package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.latte.vo.User;

@Mapper
public interface UserDao {

	List<User> getAllUsers();
	User getUserById(String userId);
	User getUserByNo(int userNo);
}
