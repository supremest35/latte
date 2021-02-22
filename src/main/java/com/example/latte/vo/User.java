package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class User {

	private int no;
	private String name;
	private String id;
	private String password;
	private String nickName;
	private Date birthday;
	private String tel;
	private String address;
	private int postcode;
	private String available;
	private int deptNo;
	private String position;
	private int acornCnt;
	private int friendCnt;
	private Date createdDate;
}
