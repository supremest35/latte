package com.example.latte.web.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.latte.service.UserService;

@CrossOrigin("*")
@Controller
@RequestMapping("/users")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/modifyMyProfile.do")
	public String modify() {
		
		return "";
	}



}
