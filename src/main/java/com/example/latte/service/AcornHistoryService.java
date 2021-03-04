package com.example.latte.service;

import java.util.List;

import com.example.latte.vo.AcornHistory;

public interface AcornHistoryService {

	List<AcornHistory> getAcornHistoriesByUserNo(int userNo);

	void insertAcornHistory(AcornHistory acornHistory);
}
