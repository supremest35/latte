package com.example.latte.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

@Mapper
@Transactional
public interface ShoppingManageService {
	
	List<Object> retrieveUpperCategory(Map<String, Object> param);
	List<Object> retrieveMidCategory  (Map<String, Object> param);
	List<Object> retrieveLowCategory  (Map<String, Object> param);
	
	//상품정보
	List<Object> retrieveProductByColor(Map<String, Object> param);

}
