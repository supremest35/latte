package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Order {

	private int no;
	private int userNo;
	private String description;
	private String recId;
	private int amount;
	private String status;
	private int totalPrice;
	private String message;
	private Date createdDate;
}
