package com.example.latte.service;

import java.util.List;
import java.util.Map;

import com.example.latte.vo.Folder;
import com.example.latte.vo.Keyword;
import com.example.latte.vo.Profile;
import com.example.latte.vo.Qna;
import com.example.latte.vo.VisitorNote;

public interface MiniHomeService {

	Profile getProfileByMiniHomeNo(int miniHomeNo);

	List<Keyword> getKeywordsByProfileNo(int profileNo);

	List<Qna> getQnasByProfileNo(int profileNo);
	
	Map<String, Object> getMiniHomeInfo(int userNo);
	
	Map<String, List<Folder>> getfoldersByMiniHomeNoAndCategoryNo(int miniHomeNo, int categoryNo);
	
	VisitorNote getVisitorNoteByMiniHomeNoAndIndex(int miniHomeNo, int index);
}
