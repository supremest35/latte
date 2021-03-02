package com.example.latte.web.controller.rest;


import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.relation.Relation;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.latte.form.UserRegisterForm;
import com.example.latte.service.DeptService;
import com.example.latte.service.UserService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.User;

@RestController("apiUserController")
@RequestMapping("/api/users/")
public class UserController {

	@Value("${directory.images.photo}")
	String savedDrectory;
	
	@Autowired
	UserService userService;
	@Autowired
	DeptService deptService;

	@GetMapping("findId.do")
	public User findId(@RequestParam(value="name") String name, 
					   @RequestParam(value="tel") String tel) {
		User user = userService.getUserWithIdOption(name, tel);
		if (user == null) {
			return new User();
		}
		return user;
	}
	
	@GetMapping("findPwd.do")
	public Map<String, String> findPwd(@RequestParam(value="name") String name,
						@RequestParam(value="tel") String tel,
						@RequestParam(value="id") String id) {
		
		Map<String, String> result = new HashMap<>();
		User user =  userService.getUserWithPwdOption(name, tel, id);
		if (user == null) {
			result.put("status", "fail");
			return result; 
		}
		result.put("status", "success");
		result.put("id", user.getId());
		result.put("userName", user.getName());
		return result;
	}
	
	// 회원가입시 아이디 중복 체크
	@RequestMapping("ckeckDupId.do")
	public User dupIdCheck(@RequestParam("id") String userId) {
		User user = userService.getUserById(userId);
		
		if (user == null) {
			return new User();
		}
		return user;
	}
	
	// 회원가입시 사용자 정보 저장
	@RequestMapping("/addUser.do") // 사진 전용 변수를 하나 더 받기(false) -> 값이 있을 경우에 user에 저장 없으면 기본값 저장
	public Map<String, Object> addUser(UserRegisterForm userForm) {
		System.out.println("###컨트롤러 addUser 실행-----");
		Map<String, Object> result = new HashMap<>();
		
		User user = new User();
		BeanUtils.copyProperties(userForm, user);
		System.out.println("### 유저폼 사진" + userForm.getPhotoFile());
		try {
			if(!userForm.getPhotoFile().isEmpty()) {
				MultipartFile upLoadFile = userForm.getPhotoFile();
				String fileName = upLoadFile.getOriginalFilename();
				
				File file = new File(savedDrectory, fileName);
				FileOutputStream out = new FileOutputStream(file);
				FileCopyUtils.copy(upLoadFile.getInputStream(), out);
				
				user.setPhoto(fileName);
				result.put("message", "프로필 사진 등록이 완료되었습니다.");
			}else {
			}
		} catch (Exception e) {
			user.setPhoto("user.jpg");
			result.put("message", "프로필 사진을 기본 이미지로 설정합니다.");
		}
		
		userService.addUser(user);
		return result;
	}
	
	// 일촌 불러오기
	@RequestMapping("getFriends.do")
	public List<Relation> getMyFriendList(@RequestParam(value = "userNo") int userNo, 
					@RequestParam(value="stauts") String status){
		
		Map<String, Object> opt = new HashMap<>();
		opt.put("userNo", userNo);
		opt.put("status", "connected");
		
		return userService.getMyFriendListByOpt(opt);
	}
	
	// 가입된 모든 사용자 (탍퇴회원 제외)
	@RequestMapping("getAllAvailableUser")
	public List<User> getAllUser(){
		Map<String, String> condition = new HashMap<>();
		condition.put("available", "Y");
		return userService.getAllUsers(condition);
	}
	
	@RequestMapping("/modifyProfile")
	public String modify(@RequestParam(value="id") String id, @RequestParam(value="nickName") String nickName, 
		@RequestParam(value="tel") String tel, @RequestParam(value="photoFile", required = false)MultipartFile photo) {
		User user = userService.getUserById(id);
		System.out.println(photo);
		System.out.println("프로필 변경 전 유저" + user.toString());
		if(!nickName.equals("")) {
			user.setNickName(nickName);
		}
		if(!tel.equals("")) {
			user.setTel(tel);
		}
		try {
			if(photo != null) {
				String fileName = photo.getOriginalFilename();
				File file = new File(savedDrectory, fileName);
				FileOutputStream out = new FileOutputStream(file);
				FileCopyUtils.copy(photo.getInputStream(), out);
				
				user.setPhoto(fileName);
			}
		}catch (Exception e) {
			e.printStackTrace();
			return "프로필 변경에 실패하였습니다.";
		}
		
		System.out.println("프로필 변경 후 유저" + user.toString());
		userService.update(user);
		
		SessionUtils.setAttribute("LOGINED_USER", user);
		
		return "프로필이 정상적으로 변경되었습니다.";
	}

	
	
}
