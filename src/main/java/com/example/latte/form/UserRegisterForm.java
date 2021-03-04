package com.example.latte.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserRegisterForm {

	private String name;
	private String password;
	private String id;
	private String nickName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	private String tel;
	private String address;
	private String addressDetail;
	private int postCode;
	private int deptNo;
	private String position;
}
