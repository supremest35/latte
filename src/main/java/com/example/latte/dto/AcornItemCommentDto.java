package com.example.latte.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AcornItemCommentDto {

	private int no;
	private int userNo;
	private String userId;
	private String userPhoto;
	private String content;
	private int likeCnt;
	private String liked;
	private Date createdDate;
}
