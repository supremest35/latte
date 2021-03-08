package com.example.latte.service;

import java.util.List;
import java.util.Map;

import com.example.latte.dto.VisitorNoteDto;
import com.example.latte.vo.Diary;
import com.example.latte.vo.Folder;
import com.example.latte.vo.Keyword;
import com.example.latte.vo.MiniHome;
import com.example.latte.vo.MiniHomeBoard;
import com.example.latte.vo.Profile;
import com.example.latte.vo.Qna;
import com.example.latte.vo.VisitorNote;
import com.example.latte.vo.WelcomeNote;

public interface MiniHomeService {
	
	void increaseHitCnt(MiniHome miniHome);
	
	void insertProfile(Profile profile);

	void modifyProfile(Profile profile);
	
	void deleteProfile(int no);
	
	void insertKeywords(int miniHomeNo, String[] keywords);
	
	void deleteKeywordsByMiniHomeNo(int miniHomeNo);
	
	void insertQnas(List<Qna> qnas);
	
	void deleteQnaByMiniHomeNo(int miniHomeNo);
	
	void insertDiary(Diary diary);
	
	void deleteDiary(int no);
	
	void modifyDiary(Diary diary);
	
	void insertMinihomeBoard(MiniHomeBoard miniHomeBoard);
	
	void modifyMiniHomeBoard(MiniHomeBoard miniHomeBoard);
	
	void deleteMiniHomeBoard(int no);
	
	void deleteBoards(int[] boardNoList);
	
	void insertVisitorNote(VisitorNote visitorNote);
	
	MiniHome getMiniHomeByNo(int miniHomeNo);

	MiniHome getMiniHomeByUserNo(int userNo);
	
	Profile getProfileByMiniHomeNo(int miniHomeNo);

	WelcomeNote getWelcomeNoteByMiniHomeNo(int miniHomeNo);
	
	Diary getDiaryByNo(int diaryNo);

	Diary getLatestDiaryByMiniHomeNo(int miniHomeNo);
	
	Folder getRootFolderByOption(Map<String, Object> opt);
	
	Folder getFolderByNo(int folderNo);

	MiniHomeBoard getBoardByNo(int boardNo);
	
	List<MiniHomeBoard> getAllBoardsByOption(Map<String, Object> opt);
	
	List<Diary> getDiariesByOption(Map<String, Object> opt);

	List<Keyword> getKeywordsByMiniHomeNo(int miniHomeNo);

	List<Qna> getQnasByMiniHomeNo(int miniHomeNo);

	Map<String, Object> getMiniHomeInfoByOption(Map<String, Object> opt);
	
	List<Folder> getParentFoldersByOption(Map<String, Object> opt);

	List<Folder> getChildFoldersByParentFolderNo(int parentFolderNo);
	
	Map<String, Object> getBoardsByOption(Map<String, Object> opt);
	
	Map<String, Object> getVisitorNotesByOption(Map<String, Object> opt);
}
