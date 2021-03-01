package com.example.latte.web.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.latte.form.UserModifyForm;
import com.example.latte.service.UserService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.User;

@CrossOrigin("*")
@Controller
@RequestMapping("/users")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/modifyProfile.do")
	public void modifyProfile(UserModifyForm userForm) {
		User loginedUser = userService.getUserByNo(((User)SessionUtils.getAttribute("LOGINED_USER")).getNo());
		loginedUser.setNickName(userForm.getNickName());
		loginedUser.setTel(userForm.getTel());
		userService.updateUser(loginedUser);
	}



}
