package com.example.latte.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.latte.dto.WishItemDto;
import com.example.latte.vo.WishItem;

@Service
public class WishServiceImpl implements WishService {

	@Override
	public List<WishItemDto> getWishItemsList(int userNo) {
		return null;
	}
	
	@Override
	public void deleteWishItems(List<Integer> wishNoList, int userNo) {
		
	}
	@Override
	public void insertOrIncreaseAmount(WishItem cartItem) {
		
	}
	@Override
	public void updateWishItem(WishItem wishItem) {
		
	}
}
