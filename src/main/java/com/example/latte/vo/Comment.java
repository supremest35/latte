package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Comment {

	private int no;
	private int boardNo;
	private int userNo;
	private String content;
	private int commentlikeCnt;
	private Date createdDate;
	
}
