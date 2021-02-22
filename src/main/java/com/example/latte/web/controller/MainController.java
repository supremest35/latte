package com.example.latte.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

@CrossOrigin("*")
@Controller
public class MainController {

	@RequestMapping("/main.do")
	public String main(Model model) {
		return "main";
	}
	
	// 회원가입 폼 띄우기
	@RequestMapping("/register.do")
	public String register() {
		return "register";
	}
	
}
