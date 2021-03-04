package com.example.latte.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.AcornHistoryDao;
import com.example.latte.vo.AcornHistory;

@Service
public class AcornHistoryServiceImpl implements AcornHistoryService {

	@Autowired
	AcornHistoryDao acornHistoryDao;
	
	@Override
	public List<AcornHistory> getAcornHistoriesByUserNo(int userNo) {
		return acornHistoryDao.getAcornHistoriesByUserNo(userNo);
	}
	
	@Override
	public void insertAcornHistory(AcornHistory acornHistory) {
		acornHistoryDao.insertAcornHistory(acornHistory);
	}
}
