package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Keyword {
	private int no;
	private int profileNo;
	private String content;
	private Date createdDate;
}
