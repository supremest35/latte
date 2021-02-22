package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.latte.vo.User;

@Mapper
public interface UserDao {

	User getUserByOption(Map<String, Object> option);
	void insertUser(User user);
	List<User> getAllUsers();
	User getUserByNo(int userNo);
	User getUserById(String userId);
	void updateUser(User user);
	void deleteUserByNo(int userNo);
}
