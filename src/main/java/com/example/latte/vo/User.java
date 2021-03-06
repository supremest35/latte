package com.example.latte.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class User {

	private int no;
	private String name;
	private String password;
	private String id;
	private String photo;
	private String nickName;
	private Date birthday;
	private String tel;
	private String address;
	private String addressDetail;
	private int postCode;
	private String available;
	private int deptNo;
	private String position;
	private int acornCnt;
	private int friendCnt;
	private Date createdDate;
	
	public String getTotalName() {
		return this.name +" ("+this.nickName+")";
	}
}
