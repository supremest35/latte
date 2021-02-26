package com.example.latte.service;

import java.util.List;
import java.util.Map;

import com.example.latte.vo.Diary;
import com.example.latte.vo.Folder;
import com.example.latte.vo.Keyword;
import com.example.latte.vo.MiniHome;
import com.example.latte.vo.MiniHomeBoard;
import com.example.latte.vo.Profile;
import com.example.latte.vo.Qna;
import com.example.latte.vo.WelcomeNote;

public interface MiniHomeService {
	
	MiniHome getMiniHomeByNo(int miniHomeNo);

	MiniHome getMiniHomeByUserNo(int userNo);
	
	Profile getProfileByMiniHomeNo(int miniHomeNo);

	WelcomeNote getWelcomeNoteByMiniHomeNo(int miniHomeNo);
	
	Diary getDiaryByNo(int diaryNo);

	Diary getLatestDiaryByMiniHomeNo(int miniHomeNo);
	
	List<Diary> getDiariesByOption(Map<String, Object> opt);

	List<Keyword> getKeywordsByProfileNo(int profileNo);

	List<Qna> getQnasByProfileNo(int profileNo);

	Map<String, Object> getMiniHomeInfoByOption(Map<String, Object> opt);
	
	List<Folder> getParentFoldersByOption(Map<String, Object> opt);

	List<Folder> getChildFoldersByParentFolderNo(int parentFolderNo);
	
	List<MiniHomeBoard> getBoardsByFolderNo(int folderNo);
	
}
