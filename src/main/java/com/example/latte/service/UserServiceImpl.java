package com.example.latte.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.relation.Relation;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.Exception.FailedLoginException;
import com.example.latte.Exception.PasswordMismatchException;
import com.example.latte.Exception.UserNotFoundException;
import com.example.latte.dao.UserDao;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	

	@Override
	public void addUser(User user) {
		//전달받은 사용자 정보의 비밀번호를 암호화해서 데이터베이스에 저장 
		System.out.println("회원가입 서비스 메소드 호출");
		String codePwd = DigestUtils.sha256Hex(user.getPassword());
		user.setPassword(codePwd);
		userDao.insertUser(user);
	}
	
	@Override
	public User getUserById(String userId) {
		return userDao.getUserById(userId);
	}
	
	@Override
	public User getLoginUser(Map<String, String> param){
		// 전달받은 아이디로 사용자정보를 불러오고 전달받은 비밀번호를 암호화해 비교 데이터를 생성
		User savedUser = getUserById(param.get("id"));
		String codePwd = DigestUtils.sha256Hex(param.get("pwd"));
		
		// 생성한 비교 데이터로 로그인 가능 여부 확인 -> 로그인 불가: 예외발생
		if(savedUser == null || !codePwd.equals(savedUser.getPassword())){
			throw new FailedLoginException("아이디와 비밀번호를 확인해주세요.");
		}
		SessionUtils.setAttribute("LOGINED_USER_NO", savedUser.getNo());
		SessionUtils.setAttribute("LOGINED_USER_NAME", savedUser.getName());
		SessionUtils.setAttribute("LOGINED_USER_NICKNAME", savedUser.getNickName());
		
		return savedUser;
	}                         
	
	@Override
	public User getLoginedUserInfo(String userId, String password) {
		User savedUser = userDao.getUserById(userId);
		
		if(savedUser == null) {
			throw new UserNotFoundException("아이디: ["+userId+"]");
		}
		
		String secretPassword = DigestUtils.sha256Hex(password);
		if(!secretPassword.equals(savedUser.getPassword())) {
			throw new PasswordMismatchException("");
		}
		SessionUtils.setAttribute("LOGINED_USER", savedUser);
		SessionUtils.setAttribute("LOGINED_USER_NO", savedUser.getNo());
		
		return savedUser;
	}
	
	
	@Override
	public User getUserWithIdOption(String name, String tel) {
		Map<String, Object> option = new HashMap<String, Object>();
		option.put("name", name);
		option.put("tel", tel);
		return userDao.getUserByOption(option);
	}
	
	@Override
	public User getUserWithPwdOption(String name, String tel, String id) {
		Map<String, Object> option = new HashMap<String, Object>();
		option.put("name", name);
		option.put("tel", tel);
		option.put("id", id);
		return userDao.getUserByOption(option);
	}
	
	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}


	@Override
	public void removeUser(int userNo) {
		userDao.deleteUserByNo(userNo);
	}
	
	public List<Relation> getMyFriendListByOpt(Map<String, Object> opt){
		return userDao.getMyFriendListByOpt(opt);
	};
	
	@Override
	public Relation getFriendByNo(int userNo, int friendNo) {
		return userDao.getFriendByNo(userNo, friendNo);
	}
	
}
