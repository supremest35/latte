package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.dto.WishItemDto;
import com.example.latte.vo.WishItem;

@Mapper
@Transactional
public interface WishItemDao {

	void insertWishItem(WishItem wishItem);
	
	WishItem getWishItemByNo(int wishNo);
	WishItem getWishItemByAcornNoAndUserNo(@Param("userNo") int userNo, @Param("acornNo") int acornNo);
	List<WishItemDto> getWishItemDtosByUserNo(int userNo);
	
	void updateWishItem(WishItem wishItem);
	void deleteWishItem(int itemNo);
}
