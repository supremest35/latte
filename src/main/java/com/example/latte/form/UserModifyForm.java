package com.example.latte.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserModifyForm {

	private String nickName;
	private String tel;
}
