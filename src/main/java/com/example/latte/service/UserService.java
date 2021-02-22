package com.example.latte.service;

import java.util.List;

import com.example.latte.vo.User;

public interface UserService {

	List<User> getAllUsers();
	
	User getUserById(String userId);

	User getUserByNo(int userNo);
}
