package com.example.latte.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.DiaryDao;
import com.example.latte.dao.FolderDao;
import com.example.latte.dao.KeywordDao;
import com.example.latte.dao.MiniHomeBoardDao;
import com.example.latte.dao.MiniHomeDao;
import com.example.latte.dao.ProfileDao;
import com.example.latte.dao.QnaDao;
import com.example.latte.dao.UserDao;
import com.example.latte.dao.VisitorNoteDao;
import com.example.latte.dao.WelcomeNoteDao;
import com.example.latte.dto.MiniHomePagination;
import com.example.latte.dto.VisitorNoteDto;
import com.example.latte.vo.Diary;
import com.example.latte.vo.Folder;
import com.example.latte.vo.Keyword;
import com.example.latte.vo.MiniHome;
import com.example.latte.vo.MiniHomeBoard;
import com.example.latte.vo.Profile;
import com.example.latte.vo.Qna;
import com.example.latte.vo.User;
import com.example.latte.vo.VisitorNote;
import com.example.latte.vo.WelcomeNote;

@Service
public class MiniHomeServiceImpl implements MiniHomeService{

	@Autowired
	MiniHomeDao miniHomeDao;

	@Autowired
	WelcomeNoteDao welcomeNoteDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	ProfileDao profileDao;
	
	@Autowired
	QnaDao qnaDao;
	
	@Autowired
	KeywordDao keywordDao;
	
	@Autowired
	DiaryDao diaryDao;
	
	@Autowired
	FolderDao folderDao;
	
	@Autowired
	VisitorNoteDao visitorNoteDao;
	
	@Autowired
	MiniHomeBoardDao miniHomeBoardDao;
	
	@Override
	public Map<String, Object> getMiniHomeInfoByOption(Map<String, Object> opt) {
		MiniHome miniHome = miniHomeDao.getMiniHomeByOption(opt);
		User hostUser = userDao.getUserByNo(miniHome.getUserNo());
		/*
		Map<String, Object> selectFriendsOpt = new HashMap<String, Object>();
		친구 리스트 불러와서 저장하기
		selectFriendsOpt.put("userNo", value)
		List<Relationship> friends = userDao.getMyFriendListByOpt(opt);
		*/
		Map<String, Object> hostUserInfo = new HashMap<String, Object>();
		hostUserInfo.put("no", hostUser.getNo());
		hostUserInfo.put("id", hostUser.getId());
		hostUserInfo.put("name", hostUser.getName());
		hostUserInfo.put("nickName", hostUser.getNickName());
		hostUserInfo.put("tel", hostUser.getTel());
		hostUserInfo.put("email", hostUser.getId());
		hostUserInfo.put("birthday", hostUser.getBirthday());
		
		// 나중에는 미니홈피 주인 일촌목록, 보유아이템(노래) 조회해서 저장하기 
		Map<String, Object> miniHomeInfo = new HashMap<String, Object>();
		miniHomeInfo.put("miniHome", miniHome);
		miniHomeInfo.put("hostUser", hostUserInfo);
		
		return miniHomeInfo;
	}

	@Override
	public Profile getProfileByMiniHomeNo(int miniHomeNo) {
		return profileDao.getProfileByMiniHomeNo(miniHomeNo);
	}

	@Override
	public List<Keyword> getKeywordsByMiniHomeNo(int miniHomeNo) {
		return keywordDao.getKeywordsByProfileNo(miniHomeNo);
	}

	@Override
	public List<Qna> getQnasByMiniHomeNo(int miniHomeNo) {
		return qnaDao.getQnasByMiniHomeNo(miniHomeNo);
	}

	@Override
	public WelcomeNote getWelcomeNoteByMiniHomeNo(int miniHomeNo) {
		return welcomeNoteDao.getWelcomeNoteByMiniHomeNo(miniHomeNo);
	}

	@Override
	public MiniHome getMiniHomeByNo(int miniHomeNo) {
		return miniHomeDao.getMiniHomeByNo(miniHomeNo);
	}

	@Override
	public MiniHome getMiniHomeByUserNo(int userNo) {
		return miniHomeDao.getMiniHomeByUserNo(userNo);
	}

	@Override
	public List<Diary> getDiariesByOption(Map<String, Object> opt) {
		return diaryDao.getDiariesByOption(opt);
	}

	@Override
	public Diary getDiaryByNo(int diaryNo) {
		return diaryDao.getDiaryByNo(diaryNo);
	}

	@Override
	public Diary getLatestDiaryByMiniHomeNo(int miniHomeNo) {
		return diaryDao.getLatestDiaryByMiniHomeNo(miniHomeNo);
	}

	@Override
	public List<Folder> getParentFoldersByOption(Map<String, Object> opt) {
		// 각 게시판의 최상위 폴더
		Folder rootFolder = folderDao.getRootFolderByOpt(opt);
		opt.put("parentFolderNo", rootFolder.getNo());
		// 각 게시판의 상위폴더들 반환
		return folderDao.getFoldersByOpt(opt);
		
	}

	@Override
	public List<Folder> getChildFoldersByParentFolderNo(int parentFolderNo) {
		return folderDao.getChildFoldersByParentFoderNo(parentFolderNo);
	}

	@Override
	public Map<String, Object> getBoardsByOption(Map<String, Object> opt) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<MiniHomeBoard> boards = new ArrayList<MiniHomeBoard>();
				
		boards = miniHomeBoardDao.getBoardsByOption(opt);
		
		if (opt.get("pageNo") != null) {
			int totalRows = miniHomeBoardDao.getTotalBoardsByOption(opt);
			if (totalRows == 0) {
				return resultMap;
			}
			MiniHomePagination pagination = new MiniHomePagination((Integer) opt.get("pageNo"), totalRows);
			resultMap.put("pagination", pagination);
			MiniHome miniHome = miniHomeDao.getMiniHomeByNo(boards.get(1).getMiniHomeNo());
			User user = userDao.getUserByNo(miniHome.getUserNo());
			resultMap.put("userName", user.getName());
		}
		
		resultMap.put("boards", boards);
		
		return resultMap;
	}

	@Override
	public MiniHomeBoard getBoardByNo(int boardNo) {
		return miniHomeBoardDao.getBoardByNo(boardNo);
	}

	@Override
	public Folder getFolderByNo(int folderNo) {
		return folderDao.getFolderByNo(folderNo);
	}

	@Override
	public Map<String, Object> getVisitorNotesByOption(Map<String, Object> opt) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<VisitorNoteDto> visitorNotes = new ArrayList<VisitorNoteDto>();
				
		visitorNotes = visitorNoteDao.getVisitorNotesByOption(opt);
		
		int totalRows = visitorNoteDao.getTotalVisitorNotesByMiniHomeNo((Integer) opt.get("miniHomeNo"));
		MiniHomePagination pagination = new MiniHomePagination((Integer) opt.get("pageNo"), totalRows);
		resultMap.put("pagination", pagination);
		resultMap.put("visitorNotes", visitorNotes);
		
		return resultMap;
	}

	@Override
	public List<MiniHomeBoard> getAllBoardsByOption(Map<String, Object> opt) {
		return miniHomeBoardDao.getBoardsByOption(opt);
	}

	@Override
	public void insertProfile(Profile profile) {
		profileDao.insertProfile(profile);
	}

	@Override
	public void modifyProfile(Profile profile) {
		profileDao.modifyProfile(profile);
	}

	@Override
	public void deleteProfile(int no) {
		profileDao.deleteProfile(no);
	}

	@Override
	public void insertKeywords(int miniHomeNo, String[] keywords) {
		Keyword keyword = new Keyword();
		keyword.setMiniHomeNo(miniHomeNo);

		for (String content : keywords) {
			keyword.setContent(content);
			keywordDao.insertKeyword(keyword);
		}
		
	}

	@Override
	public void deleteKeywordsByMiniHomeNo(int miniHomeNo) {
		keywordDao.deleteKeyword(miniHomeNo);
	}

	@Override
	public void insertQnas(List<Qna> qnas) {
		for (Qna qna : qnas) {
			qnaDao.insertQna(qna);
		}
	}

	@Override
	public void deleteQnaByMiniHomeNo(int miniHomeNo) {
		qnaDao.deleteQna(miniHomeNo);
	}

	@Override
	public void insertDiary(Diary diary) {
		diaryDao.insertDiary(diary);
	}

	@Override
	public void deleteDiary(int no) {
		Diary diary = diaryDao.getDiaryByNo(no);
		System.out.println(diary);
		diary.setDeleted("Y");
		diaryDao.updateDiary(diary);
	}

}
