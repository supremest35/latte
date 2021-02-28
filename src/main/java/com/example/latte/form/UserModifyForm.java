package com.example.latte.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserModifyForm {

	private String name;
	private String password;
	private MultipartFile photoFile;
	private String nickName;
	private String tel;
	private String address;
	private String addressDetail;
	private int postCode;
}
