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
import com.example.latte.vo.Dept;
import com.example.latte.vo.User;

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
			@RequestParam("pwd") String password,@RequestParam("pathName") String pn, RedirectAttributes rd) {
		System.out.println("로그인 호출");
		System.out.println("####URL ===>" + pn);
		System.out.println("####ID ===>"+ userId);
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("id", userId);
		param.put("pwd", password);
		try {
			userService.getLoginUser(param);
			
			// 일촌리스트 저장할 경우 사용할 코드
			//Map<String, Object> opt = new HashMap<>();
			//opt.put("userNo", ((User)SessionUtils.getAttribute("LOGINED_USER")).getNo());
			//opt.put("status", "connected");
			//SessionUtils.setAttribute("freindList", userService.getMyFriendListByOpt(opt));
			
		} catch (FailedLoginException e) {
			rd.addFlashAttribute("message", e.getMessage());
		} 
		
		if(pn.contains("board")) {
			return "redirect:/board/index.do";
		}else if(pn.contains("shopping")) {
			return "redirect:/shopping/main.do";
		}else {
			return "redirect:/main.do";
		}
	}

	// 로그아웃시 세션에 저장된 정보 삭제
	@RequestMapping("/logout.do")
	public String logout() {
		SessionUtils.removeAttribute("LOGINED_USER");
		return "redirect:/main.do";
	}
	
	@RequestMapping("/myProfile.do")
	public String myProfile(Model model) {
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		System.out.println(user.getDeptNo());
		Dept dept = deptService.getDeptByNo(user.getDeptNo());
		model.addAttribute("deptName", dept.getName());
		return "../common/myProfile";
	}
}
