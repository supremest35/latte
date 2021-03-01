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
	public WishItem getWishItemByAcornNoAndUserNo(int acornNo, int userNo) {
		return wishItemDao.getWishItemByAcornNoAndUserNo(acornNo, userNo);
	}
	@Override
	public WishItem getWishItemByNo(int wishNo) {
		return wishItemDao.getWishItemByNo(wishNo);
	}
	
	@Override
	public void deleteWishItem(int wishNo) {
		wishItemDao.deleteWishItem(wishNo);
	}
	@Override
	public void deleteWishItemByUserNoAndAcornNo(int userNo, int acornNo) {
		wishItemDao.deleteWishItemByUserNoAndAcornNo(userNo, acornNo);
	}
	@Override
	public void insertWishItem(WishItem wishItem) {
		wishItemDao.insertWishItem(wishItem);
	}
}
