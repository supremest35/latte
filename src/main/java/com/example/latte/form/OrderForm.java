package com.example.latte.form;

import java.util.List;

import lombok.Data;

@Data
public class OrderForm {

	private List<Integer> acornNo;
	private List<Integer> price;
	private List<Integer> amount;
	private String recId;
	private String message;
	private int totalPrice;
}
