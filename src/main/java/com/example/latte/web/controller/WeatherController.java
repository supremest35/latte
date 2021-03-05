package com.example.latte.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/weather")
public class WeatherController {

	@RequestMapping("/main.do")
	public String weatherMain() {
		return "weather/main";
	}
	
	@RequestMapping("/lib.do")
	public String lib() {
		return "weather/lib";
	}
}
