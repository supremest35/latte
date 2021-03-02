package com.example.latte.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

@Mapper
@Transactional
public interface ShoppingManageService {
	
	List<Object> retireveUpperCategory(Map<String, Object> param);
	List<Object> retireveMidCategory  (Map<String, Object> param);
	List<Object> retireveLowCategory  (Map<String, Object> param);

}
