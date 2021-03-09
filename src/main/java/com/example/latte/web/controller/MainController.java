package com.example.latte.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.latte.Exception.FailedLoginException;
import com.example.latte.service.BoardService;
import com.example.latte.service.CategoryService;
import com.example.latte.service.DeptService;
import com.example.latte.service.MiniHomeService;
import com.example.latte.service.NoteService;
import com.example.latte.service.UserService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.BoardDto;
import com.example.latte.vo.Category;
import com.example.latte.vo.MiniHome;
import com.example.latte.vo.User;


@CrossOrigin("*")
@Controller
public class MainController {
	
	@Autowired
	UserService userService;
	@Autowired
	DeptService deptService;
	@Autowired
	NoteService noteService;
	@Autowired
	BoardService boardService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	MiniHomeService miniHomeService;

	@RequestMapping("/main.do")
	public String main(Model model) {
		// 게시판 탑10, 뉴스 불러오기
		Category category = categoryService.getCategoryByNo(100); 
		model.addAttribute("boardCategory",category);
				  
		List<BoardDto> boards = boardService.getBestByLikeCnt();
		model.addAttribute("boards", boards);
		
		return "main";
	}
	
	// 회원가입 폼 띄우기
	@RequestMapping("/register.do")
	public String register() {
		return "register";
	}
	
	
	// 하루 방문자 수 로그인으로 ???
	// 로그인시 아이디와 비밀번호 확인 후 성공하면  세션에 아이디 저장 실패하면 오류 메세지 띄우기
	@RequestMapping("/**/login.do")
	public String login(@RequestParam("id") String userId,
			@RequestParam("pwd") String password,@RequestParam("pathName") String pathName, RedirectAttributes rd) {
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("id", userId);
		param.put("pwd", password);
		try {
			userService.getLoginUser(param);
			
			// 일촌리스트 불러오기
			int userNo = ((User)SessionUtils.getAttribute("LOGINED_USER")).getNo();
			SessionUtils.setAttribute("FRIEND_LIST", userService.getMyFriendList(userNo));
			System.out.println("#$%^&*(*&^%$#@#$%^&*(*&^%$#@"+SessionUtils.getAttribute("FRIEND_LIST"));
			// 안읽은 쪽지 불러오기
			SessionUtils.setAttribute("UNREADNOTE_NORMAL_CNT", noteService.getUnreadNormalNote(userNo));
			SessionUtils.setAttribute("UNREADNOTE_FRIEND_CNT", noteService.getUnreadFriendNote(userNo));
			// 오늘 방문자수
			MiniHome mh = miniHomeService.getMiniHomeByUserNo(userNo);
			SessionUtils.setAttribute("TODAY_VISITOR", mh.getTodayCnt());
			
		} catch (FailedLoginException e) {
			rd.addFlashAttribute("message", e.getMessage());
		} 
		
		if(pathName.contains("board")) {
			return "redirect:/board/index.do";
		}else if(pathName.contains("shopping")) {
			return "redirect:/shopping/main.do";
		}else if(pathName.contains("news")) {
			return "redirect:/news/main.do";
		}else {
			return "redirect:/main.do";
		}
	}

	// 로그아웃시 세션에 저장된 정보 삭제
	@RequestMapping(path="/logout.do", produces = "text/plain")
	public @ResponseBody String logout(@RequestParam("pathName") String pathName) {
		SessionUtils.removeAttribute("LOGINED_USER");
		
		if(pathName.contains("board")) {
			return "/board/index.do";
		}else if(pathName.contains("shopping")) {
			return "/shopping/main.do";
		}else if(pathName.contains("news")) {
			return "/news/main.do";
		}else {
			return "/main.do";
		}
	}
	
	@RequestMapping("/myProfile.do")
	public String myProfile() {
		return "../common/myProfile";
	}
}
