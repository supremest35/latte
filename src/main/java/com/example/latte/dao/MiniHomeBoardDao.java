package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.MiniHomeBoard;

@Mapper
@Transactional
public interface MiniHomeBoardDao {
	
	List<MiniHomeBoard> getBoardsByFolderNo(int folderNo);
}
