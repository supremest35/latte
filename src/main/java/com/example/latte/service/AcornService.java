package com.example.latte.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.AcornItem;
import com.example.latte.vo.MarketCategory;

@Transactional
public interface AcornService {

	/**
	 * 모든 도토리상품정보를 반환한다.
	 * @return 전체 상품목록
	 */
	List<AcornItem> getAllAcornList();
	
	/**
	 * 카테고리 번호에 대한 카테고리 정보를 제공한다.
	 * @param categoryNo 카테고리 번호
	 * @return 카테고리 정보
	 */
	MarketCategory getCategory(int categoryNo);
	
	/**
	 * 상위 카테고리 번호에 대한 카테고리 정보를 제공한다.
	 * @param uppCatNo 상위 카테고리 번호
	 * @return 하위 카테고리 목록
	 */
	List<MarketCategory> getCategories(int uppCatNo);
	
	/**
	 * 지정된 검색조건에 해당하는 도토리상품목록 및 페이징정보를 반환한다.
	 * @param condition 검색조건
	 * @return 도토리상품목록과 페이징 정보를 포함하고 있는 Map객체
	 */
	Map<String, Object> getAcorns(Map<String, Object> condition);
	
	/**
	 * 지정된 상품번호의 도토리상품정보를 제공한다.
	 * @param acornNo 도토리상품번호
	 * @return 도토리상품정보
	 */
	AcornItem getAcornDetail(int acornNo);
	
	/**
	 * 새로운 도토리상품을 DB에 등록한다.
	 * @param product 등록할 도토리상품정보
	 */
	void addNewAcorn(AcornItem product);
}
