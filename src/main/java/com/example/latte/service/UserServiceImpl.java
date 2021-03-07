package com.example.latte.service;


import java.util.ArrayList;
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
import com.example.latte.dao.FolderDao;
import com.example.latte.dao.MiniHomeBoardDao;
import com.example.latte.dao.MiniHomeDao;
import com.example.latte.dao.RelationshipDao;
import com.example.latte.dao.UserDao;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.MiniHome;
import com.example.latte.vo.MiniHomeBoard;
import com.example.latte.vo.Relationship;
import com.example.latte.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	@Autowired
	MiniHomeDao miniHomeDao;
	@Autowired
	FolderDao folderDao;
	@Autowired 
	RelationshipDao relationshipDao;
	

	@Override
	public void addUser(User user) {
		//전달받은 사용자 정보의 비밀번호를 암호화해서 데이터베이스에 저장 
		System.out.println("회원가입 서비스 메소드 호출");
		String codePwd = DigestUtils.sha256Hex(user.getPassword());
		user.setPassword(codePwd);
		userDao.insertUser(user);
		
		MiniHome myHome = new MiniHome();
		myHome.setUserNo(user.getNo());
		String[] subId= user.getId().split("@");
		myHome.setAddress(subId[0]);
		miniHomeDao.insertMiniHome(myHome);
		
		folderDao.insertRootFolder(myHome.getNo(), 100);
		folderDao.insertRootFolder(myHome.getNo(), 200);
		folderDao.insertRootFolder(myHome.getNo(), 300);
	}
	
	@Override
	public User getUserById(String userId) {
		return userDao.getUserById(userId);
	}
	
	@Override
	public User getUserByNo(int userNo) {
		return userDao.getUserByNo(userNo);
	}
	
	@Override
	public void getLoginUser(Map<String, String> param){
		// 전달받은 아이디로 사용자정보를 불러오고 전달받은 비밀번호를 암호화해 비교 데이터를 생성
		User savedUser = getUserById(param.get("id"));
		String codePwd = DigestUtils.sha256Hex(param.get("pwd"));
		
		// 생성한 비교 데이터로 로그인 가능 여부 확인 -> 로그인 불가: 예외발생
		if(savedUser == null || !codePwd.equals(savedUser.getPassword())){
			throw new FailedLoginException("아이디와 비밀번호를 확인해주세요.");
		}
		SessionUtils.setAttribute("LOGINED_USER", savedUser);
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
	public List<User> getAllUsers(Map<String, String> condition) {
		return userDao.getAllUsers(condition);
	}


	@Override
	public void removeUser(int userNo) {
		userDao.deleteUserByNo(userNo);
	}
	
	@Override
	public void update(User user) {
		userDao.updateUser(user);
	}
	
	public List<Map<String, Object>> getMyFriendList(int userNo){
		
		List<Map<String, Object>> friendList = new ArrayList<>();
		
		for(Relationship re : relationshipDao.getMyFriendList(userNo)) {
			User user1 = userDao.getUserByNo(re.getUserNo());
			User user2 = userDao.getUserByNo(re.getFriendNo());
			if(user1.getNo()==userNo) {
				Map<String, Object> friend = new HashMap<>();
				friend.put("friendNo", user2.getNo());
				friend.put("friendTotalName", user2.getName()+" ("+user2.getNickName()+")");
				friend.put("friendMiniHomeNo", miniHomeDao.getMiniHomeByUserNo(user2.getNo()).getNo());
				friendList.add(friend);
			}else {
				Map<String, Object> friend = new HashMap<>();
				friend.put("friendNo", user1.getNo());
				friend.put("friendTotalName", user1.getName()+" ("+user1.getNickName()+")");
				friend.put("friendMiniHomeNo", miniHomeDao.getMiniHomeByUserNo(user1.getNo()).getNo());
				friendList.add(friend);
			}
		}
		
		return friendList;
	};
	
	
	
}
