package com.example.latte.service;

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
import com.example.latte.vo.Diary;
import com.example.latte.vo.Folder;
import com.example.latte.vo.Keyword;
import com.example.latte.vo.MiniHome;
import com.example.latte.vo.MiniHomeBoard;
import com.example.latte.vo.Profile;
import com.example.latte.vo.Qna;
import com.example.latte.vo.User;
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
	public List<Keyword> getKeywordsByProfileNo(int profileNo) {
		return keywordDao.getKeywordsByProfileNo(profileNo);
	}

	@Override
	public List<Qna> getQnasByProfileNo(int profileNo) {
		return qnaDao.getQnasByProfileNo(profileNo);
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
	public List<MiniHomeBoard> getBoardsByOption(Map<String, Object> opt) {
		return miniHomeBoardDao.getBoardsByOption(opt);
	}

	@Override
	public MiniHomeBoard getBoardByNo(int boardNo) {
		return miniHomeBoardDao.getBoardByNo(boardNo);
	}

	@Override
	public Folder getFolderByNo(int folderNo) {
		return folderDao.getFolderByNo(folderNo);
	}

}
