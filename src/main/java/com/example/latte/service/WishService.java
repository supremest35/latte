package com.example.latte.service;

import java.util.List;

import com.example.latte.dto.WishItemDto;
import com.example.latte.vo.WishItem;

public interface WishService {

	List<WishItemDto> getWishItemsList(int userNo);
	
	void deleteWishItems(List<Integer> wishNoList, int userNo);
	void insertOrIncreaseAmount(WishItem cartItem);
	void updateWishItem(WishItem wishItem);
}
