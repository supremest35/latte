package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Relationship {

	private int no;
	private int userNo;
	private int friendNo;
	private String userNickName;
	private String friendNickName;
	private String status;
	private Date createdDate;
}
