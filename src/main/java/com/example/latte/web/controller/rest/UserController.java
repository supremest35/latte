package com.example.latte.web.controller.rest;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.latte.service.DeptService;
import com.example.latte.service.UserService;
import com.example.latte.vo.User;

@RestController("apiUserController")
@RequestMapping("/api/users/")
public class UserController {

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
		System.out.println("###: " + userId);
		User user = userService.getUserById(userId);
		
		if (user == null) {
			System.out.println("###: 유저가 null");		
			return new User();
		}
		return user;
	}
	
}
