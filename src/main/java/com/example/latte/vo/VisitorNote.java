package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class VisitorNote {

	private int no;
	private int miniHomeNo;
	private int userNo;
	private String content;
	private String secret;
	private String deleted;
	private Date createdDate;
}
