package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import javax.management.relation.Relation;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.User;

@Mapper
@Transactional
public interface UserDao {

	User getUserByOption(Map<String, Object> option);
	void insertUser(User user);
	List<User> getAllUsers(Map<String, String> condition);
	User getUserByNo(int userNo);
	User getUserById(String userId);
	void updateUser(User user);
	void deleteUserByNo(int userNo);
	List<Relation> getMyFriendListByOpt(Map<String, Object> opt);
	Relation getFriendByNo(int userNo, int friendNo);
}
