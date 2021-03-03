package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class UserItem {

	private int no;
	private int userNo;
	private int acornNo;
	private String acornName;
	private Date createdDate;
}
