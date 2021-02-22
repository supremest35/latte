package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AcornItemComment {

	private int no;
	private int itemNo;
	private int userNo;
	private String content;
	private int likeCnt;
	private Date createdDate;
}