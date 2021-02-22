package com.example.latte.form;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardForm {

	private int categoryNo;
	private String title;
	private String content;
	private MultipartFile photofile; // 첨부파일
	private int userNo;
	
	public BoardForm() {}
	
}
