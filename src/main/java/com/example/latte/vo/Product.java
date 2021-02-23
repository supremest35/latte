package com.example.latte.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Product {

	private int no;
	private int categoryNo;
	private int colorNo;
	private int mallNo;
	private String brandName;
	private String name;
	private int price;
	private int salePrice;
	private double discountRate;
	private String information;
	private String freeDelivery;
	private String url;
	private String deleted;
	private int hitCnt;
	private Date createdDate;
	private String photoFilename;
}
