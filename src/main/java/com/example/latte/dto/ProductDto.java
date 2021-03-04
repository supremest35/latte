package com.example.latte.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDto {

	private int no;
	private int categoryNo;
	private int categoryMidNo;
	private int categoryLowNo;
	private int colorNo;
	private String mallNo;
	private String productBrandName;
	private String productCd;
	private String productName;
	private String minPrice;
	private String maxPrice;
	private int hitCnt;
	private Date createdDate;
}
