package com.example.latte.web.controller.rest;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.latte.service.MiniHomeService;
import com.example.latte.vo.Diary;

@CrossOrigin("*")
@RestController("apiMiniHomeController")
@RequestMapping("/minihome/api")
public class MiniHomeController {

	@Autowired
	MiniHomeService miniHomeService;
	
	@GetMapping("/diary/{yearMonth}&{miniHomeNo}")
	public Map<String, List<Diary>> getDiaries(@PathVariable("yearMonth") String yearMonth, @PathVariable("miniHomeNo") int miniHomeNo) {
		/*
		 * Map<String, Object> opt = System.out.println(yearMonth.substring(0,4));
		 * System.out.println(yearMonth.substring(4));
		 */
		return null;
	}
	
	
}
