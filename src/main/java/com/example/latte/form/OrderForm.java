package com.example.latte.form;

import java.util.List;

import lombok.Data;

@Data
public class OrderForm {

	private List<Integer> acornNo;
	private List<Integer> salePrice;
	private List<Integer> amount;
	private int recNo;
	private String message;
	private int totalPrice;
}
