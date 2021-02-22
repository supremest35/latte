package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MiniHome {
	
	private int no;
	private int userNo;
	private int todayCnt;
	private int totalCnt;
	private String address;
	private String secret;
	private Date createdDate;
}
