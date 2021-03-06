package com.example.latte.dao;

import java.util.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

@Mapper
@Transactional
public interface ShoppingManageDao {
	
	List<Object> retrieveUpperCategory(Map<String, Object> param);
	List<Object> retrieveMidCategory(Map<String, Object> param);
	List<Object> retrieveLowCategory(Map<String, Object> param);
	
	List<Object> retrieveProductByColor(Map<String, Object> param);
}
