package com.example.latte.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.WishItemDao;
import com.example.latte.dto.WishItemDto;
import com.example.latte.vo.WishItem;

@Service
public class WishServiceImpl implements WishService {

	@Autowired
	WishItemDao wishItemDao;
	
	@Override
	public List<WishItemDto> getWishItemsList(int userNo) {
		return wishItemDao.getWishItemDtosByUserNo(userNo);
	}
	
	@Override
	public void deleteWishItems(List<Integer> wishNoList, int userNo) {
		
	}
	@Override
	public void insertOrIncreaseAmount(WishItem wishItem) {
		WishItem savedWishItem = wishItemDao.getWishItemByAcornNoAndUserNo(wishItem.getUserNo(), wishItem.getAcornNo());
		
		if (savedWishItem != null) {
			savedWishItem.setAmount(savedWishItem.getAmount() + wishItem.getAmount());
			wishItemDao.updateWishItem(savedWishItem);
		} else {
			wishItemDao.insertWishItem(wishItem);
		}
	}
	@Override
	public void updateWishItem(WishItem wishItem) {
		
	}
}
