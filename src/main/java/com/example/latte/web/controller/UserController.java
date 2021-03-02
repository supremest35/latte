package com.example.latte.web.controller;



import java.io.File;
import java.io.FileOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.latte.service.UserService;
import com.example.latte.vo.User;

@CrossOrigin("*")
@Controller
@RequestMapping("/users")
public class UserController {
	
	@Value("${directory.images.photo}")
	String savedDrectory;
	
	@Autowired
	UserService userService;
	
	

}
