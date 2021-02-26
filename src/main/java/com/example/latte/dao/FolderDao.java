package com.example.latte.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Folder;

@Mapper
@Transactional
public interface FolderDao {
	
	Folder getRootFolderByOpt(Map<String, Object> opt);
	List<Folder> getChildFoldersByParentFoderNo(int parentFolderNo);
	List<Folder> getFoldersByOpt(Map<String, Object> opt);
}