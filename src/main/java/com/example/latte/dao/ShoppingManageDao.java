package com.example.latte.dao;

import java.util.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

@Mapper
@Transactional
public interface ShoppingManageDao {
	
	List<Object> retireveUpperCategory(Map<String, Object> param);
	List<Object> retireveMidCategory(Map<String, Object> param);
	List<Object> retireveLowCategory(Map<String, Object> param);
}
