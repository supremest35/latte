package com.example.latte.web.controller.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.latte.service.DeptService;
import com.example.latte.service.UserService;
import com.example.latte.vo.Dept;
import com.example.latte.vo.User;

@CrossOrigin("*")
@RestController("apiMainController")
@RequestMapping("/api/")
public class MainController {

	@Autowired
	UserService userService;
	@Autowired
	DeptService deptService;
	
	// 회원가입시 선택할 부서 목록
	@GetMapping("depts")
	public List<Dept> getAllDepts(){
//		List<Dept> depts = deptService.getAllDepts(); 
//		System.out.println(depts);
		return deptService.getAllDepts();
	}
	
}
