package com.example.latte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import com.example.latte.vo.Folder;

@Mapper
@Transactional
public interface FolderDao {

	List<Folder> getParentFoldersByMiniHomeNoAndCategoryNo(int miniHomeNo, int categoryNo);
}
