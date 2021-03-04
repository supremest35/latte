package com.example.latte.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {

	//Product
	private int no;
	private int categoryNo;
	private int categoryMidNo;
	private int categoryLowNo;
	private int colorNo;
	private String productBrandName;
	private String productCd;
	private String productName;
	private String info;
	private String deleted;
	private int hitCnt;
	private Date createdDate;
	private MultipartFile photoFile;
	private String photoFilename;
	
	//ProductDetail
	private String detailBrandName;
	private String detailCd;
	private String detailName;
	private int mallNo;
	private int price;
	private String freeDelivery;
	private String url;
}
