package com.example.latte.web.controller.rest;



import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.latte.dao.MiniHomeDao;
import com.example.latte.form.DiaryEventForm;
import com.example.latte.service.MiniHomeService;
import com.example.latte.service.UserService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.Board;
import com.example.latte.vo.Diary;
import com.example.latte.vo.Folder;
import com.example.latte.vo.MiniHomeBoard;
import com.example.latte.vo.Profile;
import com.example.latte.vo.Qna;
import com.example.latte.vo.User;
import com.example.latte.vo.VisitorNote;
import com.example.latte.vo.WelcomeNote;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;

@CrossOrigin("*")
@RestController("apiMiniHomeController")
@RequestMapping("/minihome/api")
public class MiniHomeController {

	@Value("${directory.miniHome.photofile}")
	String photoDirectory;

	@Value("${directory.miniHome.extrafile}")
	String extraDirectory;
	
	@Autowired
	MiniHomeService miniHomeService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/diary/eventList/{start}&{end}&{miniHomeNo}")
	public List<DiaryEventForm> getDiaryEvents(@PathVariable("start") Date start, @PathVariable("end") Date end, @PathVariable("miniHomeNo") int miniHomeNo) {
		List<DiaryEventForm> diaryEventForms = new ArrayList<DiaryEventForm>();
		 
		Map<String, Object> opt = new HashMap<String, Object>();
		 opt.put("miniHomeNo", miniHomeNo); 
		 opt.put("start", start); 
		 opt.put("end", end);
		List<Diary> diaries = miniHomeService.getDiariesByOption(opt); 
		for (Diary diary : diaries) { 
			DiaryEventForm diaryEventForm = new DiaryEventForm();
			diaryEventForm.setId(diary.getNo());
			diaryEventForm.setTitle(diary.getTitle());
			diaryEventForm.setStart(diary.getCreatedDate());

			diaryEventForms.add(diaryEventForm); 
		}
		return diaryEventForms;
	}

	@GetMapping("/diary/{diaryNo}")
	public Diary getDiary(@PathVariable("diaryNo") int diaryNo) {
		return miniHomeService.getDiaryByNo(diaryNo);
	}

	@GetMapping("/folder/{parentFolderNo}")
	public List<Folder> getChildFolders(@PathVariable("parentFolderNo") int parentFolderNo) {
		return miniHomeService.getChildFoldersByParentFolderNo(parentFolderNo);
	}

	@GetMapping("/boards/{folderNo}&{pageNo}")
	public List<MiniHomeBoard> getBoards(@PathVariable("folderNo") int folderNo, @PathVariable("pageNo") int pageNo) {
		// 처음에는 16개가 보여지기때문에 무한스크롤이 시작하면 17번째부터 보여줘야됨(8개씩)
		int begin = (pageNo - 1)*4 + 13;
		int end = pageNo*4 + 12;
		
		Map<String, Object> opt = new HashMap<String, Object>();
		opt.put("folderNo", folderNo);
		opt.put("begin", begin);
		opt.put("end", end);
		return (List) miniHomeService.getBoardsByOption(opt).get("boards");
	}

	@GetMapping("/home/{miniHomeNo}&{pageNo}")
	public List<MiniHomeBoard> home(@PathVariable("miniHomeNo") int miniHomeNo, @PathVariable("pageNo") int pageNo) {
		// 처음에는 16개가 보여지기때문에 무한스크롤이 시작하면 17번째부터 보여줘야됨(8개씩)
		int begin = (pageNo - 1)*4 + 13;
		int end = pageNo*4 + 12;
		
		Map<String, Object> opt = new HashMap<String, Object>();
		opt.put("miniHomeNo", miniHomeNo);
		opt.put("begin", begin);
		opt.put("end", end);
		
		return miniHomeService.getAllBoardsByOption(opt);
	}
	
	@PostMapping("/insertIntro.do")
	public void insertIntro(@RequestParam("photoFile") MultipartFile photoFile, @RequestParam("content") String content, @RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		Profile profile = new Profile(); 
		profile.setMiniHomeNo(miniHomeNo);
		profile.setContent(content); 
		
		if (!photoFile.isEmpty()) { 
			String filename = System.currentTimeMillis() + photoFile.getOriginalFilename();
			FileCopyUtils.copy(photoFile.getInputStream(), new FileOutputStream(new File(photoDirectory, filename))); 
			profile.setPhotoFilename(filename); 
		}
		 
		miniHomeService.insertProfile(profile);
		
	}

	@PostMapping("/modifyIntro.do")
	public void modifyIntro(@RequestParam("content") String content, @RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		Profile profile = new Profile();
		profile.setMiniHomeNo(miniHomeNo);
		profile.setContent(content);
		
		miniHomeService.modifyProfile(profile);
	}
	
	@PostMapping("/deleteIntro.do")
	public void deleteIntro(@RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		Profile profile = miniHomeService.getProfileByMiniHomeNo(miniHomeNo);
		miniHomeService.deleteProfile(profile.getNo());
	}
	
	@PostMapping("/insertKeyword.do")
	public void insertKeyword(@RequestParam("content") String content, @RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		String[] keywords = content.substring(1).split("#");
		
		miniHomeService.insertKeywords(miniHomeNo, keywords);
		
	}

	@PostMapping("/deleteKeyword.do")
	public void deleteKeyword(@RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		miniHomeService.deleteKeywordsByMiniHomeNo(miniHomeNo);
	}

	@PostMapping("/insertQna.do")
	public void insertQna(@RequestParam String[] questions, @RequestParam String[] answers, @RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		int qnaLength = questions.length;
		List<Qna> qnas = new ArrayList<Qna>();
		for (int index = 0; index < qnaLength; index++) {
			Qna qna = new Qna();
			qna.setMiniHomeNo(miniHomeNo);
			qna.setQuestion(questions[index]);
			qna.setAnswer(answers[index]);
			qnas.add(qna);
		}
		miniHomeService.insertQnas(qnas);
	}
	@PostMapping("/deleteQna.do")
	public void deleteQna(@RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		miniHomeService.deleteQnaByMiniHomeNo(miniHomeNo);
	}

	@PostMapping("/insertDiary.do")
	public void insertDiary(@RequestParam String title, @RequestParam String content, @RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		Diary diary = new Diary();
		diary.setMiniHomeNo(miniHomeNo);
		diary.setTitle(title);
		diary.setContent(content);
		
		miniHomeService.insertDiary(diary);
		
	}

	@PostMapping("/modifyDiary.do")
	public void modifyDiary(@RequestParam String title, @RequestParam String content, @RequestParam("diaryNo") Integer diaryNo, @RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		Diary diary = new Diary();
		diary.setNo(diaryNo);
		diary.setMiniHomeNo(miniHomeNo);
		diary.setTitle(title);
		diary.setContent(content);
		
		miniHomeService.modifyDiary(diary);
		
	}

	@GetMapping("/deleteDiary/{diaryNo}")
	public void deleteDiary(@PathVariable("diaryNo") int diaryNo) throws FileNotFoundException, IOException {
		miniHomeService.deleteDiary(diaryNo);
	}
	
	@PostMapping("/insertVisualContent.do")
	public int insertVisualContent(@RequestParam("photoFile") MultipartFile photoFile, @RequestParam("content") String content, @RequestParam("title") String title, @RequestParam("folderNo") int folderNo, @RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		MiniHomeBoard miniHomeBoard = new MiniHomeBoard();

		miniHomeBoard.setFolderNo(folderNo);
		miniHomeBoard.setMiniHomeNo(miniHomeNo);
		miniHomeBoard.setTitle(title);
		miniHomeBoard.setContent(content);

		int categoryNo = -1;
		if (!photoFile.isEmpty()) { 
			String filename = System.currentTimeMillis() + photoFile.getOriginalFilename();
			Folder folder = miniHomeService.getFolderByNo(folderNo);
			categoryNo = folder.getCategoryNo();
			if (folder.getCategoryNo() == 200) {
				FileCopyUtils.copy(photoFile.getInputStream(), new FileOutputStream(new File(extraDirectory, filename))); 
				miniHomeBoard.setExtraFilename(filename); 
			} else {
				FileCopyUtils.copy(photoFile.getInputStream(), new FileOutputStream(new File(photoDirectory, filename))); 
				miniHomeBoard.setImgFilename(filename); 
			}
		}
		
		miniHomeService.insertMinihomeBoard(miniHomeBoard);
		return categoryNo;
	}
	
	@PostMapping("/modifyVisualContent.do")
	public void modifyVisualContent(@RequestParam String title, @RequestParam String content, @RequestParam("boardNo") Integer boardNo, @RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		MiniHomeBoard miniHomeBoard = new MiniHomeBoard();
		miniHomeBoard.setNo(boardNo);
		miniHomeBoard.setTitle(title);
		miniHomeBoard.setContent(content);
		
		miniHomeService.modifyMiniHomeBoard(miniHomeBoard);
	}
	
	@GetMapping("/deleteVisualContent/{boardNo}")
	public void deleteVisualContent(@PathVariable("boardNo") int boardNo) throws FileNotFoundException, IOException {
		miniHomeService.deleteMiniHomeBoard(boardNo);
	}
	
	@PostMapping("/insertBoard.do")
	public void insertBoard(@RequestParam("file") MultipartFile file, @RequestParam("content") String content, 
			@RequestParam("title") String title, @RequestParam("folderNo") int folderNo, @RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		MiniHomeBoard miniHomeBoard = new MiniHomeBoard();

		miniHomeBoard.setFolderNo(folderNo);
		miniHomeBoard.setMiniHomeNo(miniHomeNo);
		miniHomeBoard.setTitle(title);
		miniHomeBoard.setContent(content);

		if (!file.isEmpty()) { 
			String filename = System.currentTimeMillis() + file.getOriginalFilename();
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(new File(extraDirectory, filename))); 
				miniHomeBoard.setExtraFilename(filename); 
		}
		
		miniHomeService.insertMinihomeBoard(miniHomeBoard);
	}

	@PostMapping("/deleteSelectedBoards.do")
	public void deleteSelectedBoards(@RequestParam("boardNoList") int[] boardNoList) throws FileNotFoundException, IOException {
		miniHomeService.deleteBoards(boardNoList);
	}
	
	@GetMapping("/deleteBoard/{boardNo}")
	public void deleteBoard(@PathVariable("boardNo") int boardNo) throws FileNotFoundException, IOException {
		miniHomeService.deleteMiniHomeBoard(boardNo);
	}

	@PostMapping("/modifyBoard.do")
	public void modifyBoard(@RequestParam String title, @RequestParam String content, @RequestParam("boardNo") Integer boardNo, @RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		MiniHomeBoard miniHomeBoard = new MiniHomeBoard();
		miniHomeBoard.setNo(boardNo);
		miniHomeBoard.setTitle(title);
		miniHomeBoard.setContent(content);
		
		miniHomeService.modifyMiniHomeBoard(miniHomeBoard);
	}

	@PostMapping("/insertVisitorNote.do")
	public void insertVisitorNote(@RequestParam("content") String content, @RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		User loginedUser = (User)SessionUtils.getAttribute("LOGINED_USER");
		
		VisitorNote visitorNote = new VisitorNote();
		visitorNote.setContent(content);
		visitorNote.setMiniHomeNo(miniHomeNo);
		visitorNote.setUserNo(loginedUser.getNo());
		
		miniHomeService.insertVisitorNote(visitorNote);
	}
	
	@PostMapping("/insertWelcomeNote.do")
	public void insertWelcomeNote(@RequestParam("photoFile") MultipartFile photoFile, @RequestParam("content") String content, 
			@RequestParam("miniHomeNo") Integer miniHomeNo) throws FileNotFoundException, IOException {
		
		WelcomeNote welcomeNote = new WelcomeNote();
		welcomeNote.setContent(content);
		welcomeNote.setMiniHomeNo(miniHomeNo);
		
		if (!photoFile.isEmpty()) { 
			String filename = System.currentTimeMillis() + photoFile.getOriginalFilename();
			FileCopyUtils.copy(photoFile.getInputStream(), new FileOutputStream(new File(photoDirectory, filename))); 
			welcomeNote.setPhotoFilename(filename); 
		}
		miniHomeService.insertWelcomeNote(welcomeNote);
	}
	
	@GetMapping("/deleteWelcomeNote/{welcomeNoteNo}")
	public void deleteWelcomeNote(@PathVariable("welcomeNoteNo") int welcomeNoteNo) {
		miniHomeService.deleteWelcomeNote(welcomeNoteNo);
	}
	
	@PostMapping("/insertFolder.do")
	public void insertFolder(@RequestParam("folderName") String folderName, 
			@RequestParam("parentFolderNo") int parentFolderNo) {
		Folder folder = new Folder();
		folder.setParentNo(parentFolderNo);
		folder.setName(folderName);
		
		miniHomeService.insertFolder(folder);
	}

	@GetMapping("/deleteFolder/{folderNo}")
	public void deleteFolder(@PathVariable("folderNo") int folderNo) {
		miniHomeService.deleteFolder(folderNo);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!111");
	}
}
