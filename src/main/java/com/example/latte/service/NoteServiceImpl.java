package com.example.latte.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.latte.dao.NoteDao;
import com.example.latte.dao.RelationshipDao;
import com.example.latte.dao.UserDao;
import com.example.latte.dto.NoteDto;
import com.example.latte.dto.NotePagination;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.Note;
import com.example.latte.vo.NoteCategory;
import com.example.latte.vo.Relationship;
import com.example.latte.vo.User;

@Service
public class NoteServiceImpl  implements NoteService{

	@Autowired
	NoteDao noteDao;
	@Autowired
	UserDao userDao;
	@Autowired
	RelationshipDao relationshipDao;

	
	
	public List<NoteCategory> getAllCategories(){
		return noteDao.getAllNoteCategories();
	};
	
	public NoteCategory getNoteCategoryByNo(int categoryNo) {
		return noteDao.getNoteCategiryByNo(categoryNo);
	};
	
	public String insertNote(Note note) {
		// 수신자,발신자 정보 조회
		User recipient = userDao.getUserByNo(note.getRecipientNo());
		User sender = userDao.getUserByNo(((User)SessionUtils.getAttribute("LOGINED_USER")).getNo());
		
		// 일촌신청일 경우 기존의 요청내역이 존재하는지 확인 후 일촌 테이블에 추가
		if(note.getCategoryNo()==1) {
			Map<String, Integer> nums = new HashMap<>();
			nums.put("userNo", sender.getNo());
			nums.put("friendNo", recipient.getNo());
			// 상대방이 보낸 일촌 신청이 있는지도 조회 option=-1 : 수신자 발신자 번호를 두 사용자 번호와 모두 비교
			nums.put("option",-1);
			Relationship savedRe = relationshipDao.getRelationshipByNums(nums);
			if(savedRe == null) {
				Relationship re = new Relationship();
				re.setUserNo(sender.getNo());
				re.setUserNickName(sender.getNickName());
				re.setFriendNo(recipient.getNo());
				re.setFriendNickName(recipient.getNickName());
				re.setStatus("STANDBY");
				relationshipDao.insertRelationship(re);
			}else {
				return "일촌 신청 내역이 존재합니다.";
			}
		}
		// 일반 쪽지일 경우 새쪽지 추가
		note.setSenderNo(sender.getNo());
		note.setRecDeptNo(recipient.getDeptNo());
		note.setRecDeptNo(recipient.getDeptNo());
		note.setStatus("STANDBY");
		noteDao.insertNote(note);
		
		return "쪽지 보내기가 완료되었습니다.";
	};
	
	public void deleteNoteByNo(int no) {
		noteDao.deleteNoteByNo(no);
	};
	
	public void updateNote(Note note) {
		noteDao.updateNote(note);
	};

	@Override
	public Note getNoteByNo(int noteNo) {
		return noteDao.getNoteByNo(noteNo);
	}
	
	@Override
	public NoteDto getNoteDtoByNo(int noteNo) {
		return noteDao.getNoteDtoByNo(noteNo);
	}
	
	@Override
	public Map<String, Object> getNoteListByOpt(Map<String, Object> opt){
		Map<String, Object> result = new HashMap<>();
		
		// 전체 데이터수 구하기
		int totalRows = noteDao.getNoteListCnt(opt);
		// 페이지네이션 객체 생성 ->페이징에 필요한 데이터
		NotePagination pagination = new NotePagination((Integer)opt.get("pageNo"), totalRows);
		// 옵션에 맞는 데이터 조회
		List<NoteDto> noteDtoList = noteDao.getNoteListByOpt(opt);
		// 얻은 값 반환
		result.put("noteDtos", noteDtoList);
		result.put("pagination", pagination);
		
		return result;
	}
	
	@Override
	public int getUnreadNormalNote(int userNo) {
		return noteDao.getUnreadNormalNote(userNo);
	}
	@Override
	public int getUnreadFriendNote(int userNo) {
		return noteDao.getUnreadFriendNote(userNo);
	}
	
	@Override
	public Relationship findRelationship(Map<String, Integer> nums) {
		return relationshipDao.getRelationshipByNums(nums);
	}
	
	@Override
	public void setRelationship(Relationship re) {
		relationshipDao.insertRelationship(re);
	}
	
	@Override
	public void updateRelationship(Relationship re) {
		relationshipDao.updateRelationship(re);
	}
}
