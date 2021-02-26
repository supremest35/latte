package com.example.latte.form;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ModifyForm {

	private int categoryNo;
	private String title;
	private String content;
	private MultipartFile photofile;
}
