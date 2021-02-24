package com.example.latte.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.FolderDao;
import com.example.latte.dao.KeywordDao;
import com.example.latte.dao.MiniHomeDao;
import com.example.latte.dao.ProfileDao;
import com.example.latte.dao.QnaDao;
import com.example.latte.dao.UserDao;
import com.example.latte.dao.VisitorNoteDao;
import com.example.latte.dao.WelcomeNoteDao;
import com.example.latte.vo.Folder;
import com.example.latte.vo.Keyword;
import com.example.latte.vo.MiniHome;
import com.example.latte.vo.Profile;
import com.example.latte.vo.Qna;
import com.example.latte.vo.Relationship;
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
	FolderDao folderDao;
	
	@Autowired
	VisitorNoteDao visitorNoteDao;
	
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
	public Map<String, List<Folder>> getfoldersByMiniHomeNoAndCategoryNo(int miniHomeNo, int categoryNo) {
		Map<Integer, List<Folder>> folders = new HashMap<Integer, List<Folder>>();
		
		List<Folder> parentFolders = folderDao.getParentFoldersByMiniHomeNoAndCategoryNo(miniHomeNo, categoryNo);
		if (parentFolders.size() != 0) {
			folders.put(parentFolders.get(0).getParentNo(), parentFolders);
			for (Folder parentFolder : parentFolders) {
				List<Folder> childFolders = folderDao.getParentFoldersByMiniHomeNoAndCategoryNo(miniHomeNo, categoryNo);
			}
		}
		
		return null;
	}

	@Override
	public VisitorNote getVisitorNoteByMiniHomeNoAndIndex(int miniHomeNo, int index) {
		return visitorNoteDao.getVisitorNoteByMiniHomeNoAndIndex(miniHomeNo, index);
	}

	@Override
	public WelcomeNote getWelcomeNoteByMiniHomeNo(int miniHomeNo) {
		return welcomeNoteDao.getWelcomeNoteByMiniHomeNo(miniHomeNo);
	}

	

}
