package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AcornItem {

	private int no;
	private int categoryNo;
	private int categoryMidNo;
	private String name;
	private int price;
	private int stock;
	private String status;
	private int likeCnt;
	private int commentCnt;
	private int sellCnt;
	private Date createdDate;
}
