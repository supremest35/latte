package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WishItem {

	private int no;
	private int acornNo;
	private int userNo;
	private int amount;
	private Date createdDate;
}
