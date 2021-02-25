package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Order {

	private int no;
	private int userNo;
	private String description;
	private int recNo;
	private int amount;
	private String status;
	private int totalPrice;
	private int usedAcornAmount;
	private String message;
	private Date createdDate;
}
