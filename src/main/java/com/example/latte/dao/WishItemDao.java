package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.dto.WishItemDto;
import com.example.latte.vo.WishItem;

@Mapper
@Transactional
public interface WishItemDao {

	WishItem getWishItemByNo(int wishNo);
	WishItem getWishItemByAcornNoAndUserNo(int acornNo, int userNo);
	
	List<WishItemDto> getWishItemDtosByUserNo(int userNo);
	
	void deleteWishItem(int wishNo);
	void deleteWishItemByUserNoAndAcornNo(int userNo, int acornNo);
	void insertWishItem(WishItem wishItem);
}
