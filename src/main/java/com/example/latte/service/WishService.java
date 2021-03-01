package com.example.latte.service;

import java.util.List;

import com.example.latte.dto.WishItemDto;
import com.example.latte.vo.WishItem;

public interface WishService {

	List<WishItemDto> getWishItemsList(int userNo);
	
	WishItem getWishItemByAcornNoAndUserNo(int acornNo, int userNo);
	WishItem getWishItemByNo(int wishNo);
	
	void deleteWishItem(int wishNo);
	void deleteWishItemByUserNoAndAcornNo(int userNo, int acornNo);
	void insertWishItem(WishItem wishItem);
}
