package com.example.latte.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.latte.service.UserService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.User;

@Controller
public class HomeController {
	
	@Autowired
	UserService userService;

	@RequestMapping("/home.do")
	public String home(Model model) {
		model.addAttribute("users", userService.getAllUsers());
		return "home";
	}

	
	
	@RequestMapping("/login.do")
	public String login(Model model) {
		User user = userService.getUserById("m@abc.com");

		SessionUtils.setAttribute("LOGINED_USER", user);
		SessionUtils.setAttribute("MINIHOME_NO", 1);
		
		return "redirect:/home.do";
	}

	@RequestMapping("/logout.do")
	public String login() {
		SessionUtils.removeAttribute("LOGINED_USER");
		return "redirect:/home.do";
	}
}
