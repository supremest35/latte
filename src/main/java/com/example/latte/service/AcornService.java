package com.example.latte.service;

import java.util.List;
import java.util.Map;

import com.example.latte.vo.AcornItem;

public interface AcornService {

	List<AcornItem> getAllAcornList();
	
	Map<String, Object> getAcorns(Map<String, Object> condition);
	
	AcornItem getAcornDetail(int acornNo);
	
	void addNewAcorn(AcornItem acorn);
}
