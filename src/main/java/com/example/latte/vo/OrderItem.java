package com.example.latte.vo;

import lombok.Data;

@Data
public class OrderItem {

	private int no;
	private int orderNo;
	private int acornNo;
	private int amount;
	private int price;
}