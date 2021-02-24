package com.example.latte.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.latte.Exception.FailedLoginException;
import com.example.latte.service.DeptService;
import com.example.latte.service.UserService;
import com.example.latte.util.SessionUtils;

@CrossOrigin("*")
@Controller
public class MainController {
	
	@Autowired
	UserService userService;
	@Autowired
	DeptService deptService;

	@RequestMapping("/main.do")
	public String main(Model model) {
		return "main";
	}
	
	// 회원가입 폼 띄우기
	@RequestMapping("/register.do")
	public String register() {
		return "register";
	}
	
	
	// 하루 방문자 수 로그인으로 ???
	// 로그인시 아이디와 비밀번호 확인 후 성공하면  세션에 아이디 저장 실패하면 오류 메세지 띄우기
	@RequestMapping("/login.do")
	public String login(@RequestParam("id") String userId,
			@RequestParam("pwd") String password, RedirectAttributes rd) {
		System.out.println("전달받은 아이다: " + userId);
		System.out.println("전달받은 비번: " + password);
		Map<String, String> param = new HashMap<String, String>();
		param.put("id", userId);
		param.put("pwd", password);
		try {
			userService.getLoginUser(param);
			System.out.println("## 서비스 메서드  호출");
		} catch (FailedLoginException e) {
			rd.addFlashAttribute("message", e.getMessage());
		} 
		System.out.println("# 리다이렉트 전");
		return "redirect:../main.do";
	}

	// 로그아웃시 세션에 저장된 정보 삭제
	@RequestMapping("/logout.do")
	public String logout() {
		//System.out.println("####전 : "+((User)SessionUtils.getAttribute("LOGINED_USER")).getName());
		SessionUtils.removeAttribute("LOGINED_USER");
		//System.out.println("####후 : "+SessionUtils.getAttribute("LOGINED_USER"));
		return "redirect:../main.do";
	}
	
	
}
