package com.example.latte.service;

import java.util.List;
import java.util.Map;

import javax.management.relation.Relation;

import com.example.latte.vo.User;

public interface UserService {

	User getUserById(String userId);
	void getLoginUser(Map<String, String> param);
	List<User> getAllUsers();
	User getUserDetail(int userNo);
	void removeUser(int userNo);
	void addUser(User user);
	
	User getUserWithIdOption(String name, String tel);
	User getUserWithPwdOption(String name, String tel, String id);
	
	List<Relation> getMyFriendListByOpt(Map<String, Object> opt);
	Relation getFriendByNo(int userNo, int friendNo);
}
