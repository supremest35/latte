package com.example.latte.web.controller;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.latte.Exception.FailedLoginException;
import com.example.latte.service.DeptService;
import com.example.latte.service.UserService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.User;

@CrossOrigin("*")
@Controller
@RequestMapping("/users")
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	DeptService deptService;


	// 회원가입시 사용자 정보 저장
	@RequestMapping("/addUser.do")
	public void addUser(@RequestBody User user) {
		
		// 회원가입 시 생일 받아와서 성별과 날짜 분류 (생년월일 input text로 입력+성별 93/0903/02)
		//userService.addUser(user);
	}
	
	// 하루 방문자 수 로그인으로 ???
	// 로그인시 아이디와 비밀번호 확인 후 성공하면  세션에 아이디 저장 실패하면 오류 메세지 띄우기
	@RequestMapping("/login.do")
	public String login(@RequestParam("id") String userId,
			@RequestParam("pwd") String password, RedirectAttributes rd) {
//		System.out.println("전달받은 아이다: " + userId);
//		System.out.println("전달받은 비번: " + password);
		Map<String, String> param = new HashMap<String, String>();
		param.put("id", userId);
		param.put("pwd", password);
		try {
			userService.getLoginUser(param);
		} catch (FailedLoginException e) {
			rd.addFlashAttribute("message", e.getMessage());
		}
		
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
