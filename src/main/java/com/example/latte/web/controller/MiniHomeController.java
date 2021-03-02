package com.example.latte.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.latte.service.MiniHomeService;
import com.example.latte.service.UserService;
import com.example.latte.util.SessionUtils;
import com.example.latte.vo.Board;
import com.example.latte.vo.Folder;
import com.example.latte.vo.Keyword;
import com.example.latte.vo.MiniHome;
import com.example.latte.vo.MiniHomeBoard;
import com.example.latte.vo.Profile;
import com.example.latte.vo.Qna;
import com.example.latte.vo.User;
import com.example.latte.vo.WelcomeNote;

@Controller
public class MiniHomeController {

	@Autowired
	MiniHomeService miniHomeService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/minihome.do")
	public String minihome(@RequestParam(name="miniHomeNo", required = false, defaultValue = "-1") int miniHomeNo, Model model) {
		
		MiniHome miniHome = null;
		User hostUser = null;
		
		if (miniHomeNo != -1) {
			miniHome = miniHomeService.getMiniHomeByNo(miniHomeNo);
			hostUser = userService.getUserByNo(miniHome.getUserNo());
		} else {
			hostUser = (User) SessionUtils.getAttribute("LOGINED_USER");
			miniHome = miniHomeService.getMiniHomeByUserNo(hostUser.getNo());
			
		}
		
		Map<String, Object> hostUserInfo = new HashMap<String, Object>();
		hostUserInfo.put("no", hostUser.getNo());
		hostUserInfo.put("id", hostUser.getId());
		hostUserInfo.put("name", hostUser.getName());
		hostUserInfo.put("nickName", hostUser.getNickName());
		
		model.addAttribute("miniHome", miniHome);
		model.addAttribute("hostUser", hostUserInfo);
		return "minihome/minihome";
	}

	@RequestMapping("/sideSection.do")
	public String sideSection(@RequestParam("sectionId") String sectionId, @RequestParam("miniHomeNo") int miniHomeNo, Model model) {
		
		if ("#home-section".equals(sectionId) || "#visitor-section".equals(sectionId)) {
			WelcomeNote welcomeNote = miniHomeService.getWelcomeNoteByMiniHomeNo(miniHomeNo);
			welcomeNote.setPhotoFilename("/resources/images/miniHome/" + welcomeNote.getPhotoFilename());
			model.addAttribute("welcomeNote", welcomeNote);
		} else if ("#photo-section".equals(sectionId)) {
			Map<String, Object> opt = new HashMap<String, Object>();
			opt.put("miniHomeNo", miniHomeNo);
			opt.put("categoryNo", 100);
			model.addAttribute("folders", miniHomeService.getParentFoldersByOption(opt));
		} else if ("#video-section".equals(sectionId)) {
			Map<String, Object> opt = new HashMap<String, Object>();
			opt.put("miniHomeNo", miniHomeNo);
			opt.put("categoryNo", 200);
			model.addAttribute("folders", miniHomeService.getParentFoldersByOption(opt));
		} else if ("#board-section".equals(sectionId)) {
			Map<String, Object> opt = new HashMap<String, Object>();
			opt.put("miniHomeNo", miniHomeNo);
			opt.put("categoryNo", 300);
			model.addAttribute("folders", miniHomeService.getParentFoldersByOption(opt));
		}
		
		return "minihome/sideSection";
	}

	@RequestMapping("/mainSection.do")
	public String mainSection(@RequestParam(name="contentId", required=false) String contentId, @RequestParam("miniHomeNo") int miniHomeNo, 
			@RequestParam(name="folderNo", required=false, defaultValue="-1") int folderNo, @RequestParam(name="boardNo", required=false, defaultValue="-1") int boardNo, 
			@RequestParam(name="pageNo", required=false, defaultValue="1") int pageNo, @RequestParam(name="rows", required=false, defaultValue="5") int rows, Model model) {
		if ("#profile-intro".equals(contentId)) {
			System.out.println(1);
			Profile profile = miniHomeService.getProfileByMiniHomeNo(miniHomeNo);
			profile.setPhotoFilename("/resources/images/miniHome/" + profile.getPhotoFilename());
			model.addAttribute("profile", profile);
		
		} else if ("#profile-keyword".equals(contentId)) {
			List<Keyword> keywords = miniHomeService.getKeywordsByProfileNo(miniHomeNo);
			model.addAttribute("keywords", keywords);

		} else if ("#profile-qna".equals(contentId)) {
			List<Qna> qnas = miniHomeService.getQnasByProfileNo(miniHomeNo);
			model.addAttribute("qnas", qnas);

		} else if ("#profile-basicInfo".equals(contentId)) {
			MiniHome miniHome = miniHomeService.getMiniHomeByNo(miniHomeNo);
			User hostUser = userService.getUserByNo(miniHome.getUserNo());
			
			Map<String, Object> hostUserInfo = new HashMap<String, Object>();
			hostUserInfo.put("no", hostUser.getNo());
			hostUserInfo.put("id", hostUser.getId());
			hostUserInfo.put("name", hostUser.getName());
			hostUserInfo.put("nickName", hostUser.getNickName());
			hostUserInfo.put("birthday", hostUser.getBirthday());
			hostUserInfo.put("tel", hostUser.getTel());
			hostUserInfo.put("address", hostUser.getAddress());
			model.addAttribute("hostUser", hostUserInfo);

		} else if ("#diary-section".equals(contentId)) {
			model.addAttribute("diary", miniHomeService.getLatestDiaryByMiniHomeNo(miniHomeNo));

		} else if ("#visualContents-section".equals(contentId)) {
			Map<String, Object> opt = new HashMap<String, Object>();
			opt.put("folderNo", folderNo);
			
			Map<String, Object> resultMap = miniHomeService.getBoardsByOption(opt);
			List<MiniHomeBoard> boards = (List) resultMap.get("boards");
			int boardsSize = boards.size();
			for (int i = 0; i < boardsSize; i++) {
				boards.get(i).setImgFilename("/resources/images/" + boards.get(i).getImgFilename());
			}
			
			model.addAttribute("boards", boards);
		
		} else if ("#board-section".equals(contentId)) {
			Map<String, Object> opt = new HashMap<String, Object>();
			opt.put("folderNo", folderNo);
			opt.put("rows", rows);
			opt.put("pageNo", pageNo);
			opt.put("begin", (pageNo - 1)*rows + 1);
			opt.put("end", pageNo*rows);
			
			Map<String, Object> resultMap = miniHomeService.getBoardsByOption(opt);
			
			model.addAttribute("boards", resultMap.get("boards"));
			model.addAttribute("userName", resultMap.get("userName"));
			model.addAttribute("pagination", resultMap.get("pagination"));
		
		} else if ("#visual-content-detail".equals(contentId)) {
			MiniHomeBoard board = miniHomeService.getBoardByNo(boardNo);
			User user = userService.getUserByNo(board.getUserNo());
			Folder folder = miniHomeService.getFolderByNo(board.getFolderNo());
			board.setImgFilename("/resources/images/" + board.getImgFilename());
			
			if (folder.getCategoryNo() == 200) {
				board.setExtraFilename("/resources/videos/miniHome/" + board.getExtraFilename());
			}
			model.addAttribute("board", board);
			model.addAttribute("folderCategoryNo", folder.getCategoryNo());
			model.addAttribute("userName", user.getName());
		} else if ("#board-detail".equals(contentId)) {
			MiniHomeBoard board = miniHomeService.getBoardByNo(boardNo);
			User user = userService.getUserByNo(board.getUserNo());
			
			model.addAttribute("board", board);
			model.addAttribute("userName", user.getName());
		} else if ("#visitor-section".equals(contentId)) {
			Map<String, Object> opt = new HashMap<String, Object>();
			opt.put("miniHomeNo", miniHomeNo);
			model.addAttribute("visitorNotes", miniHomeService.getVisitorNotesByOption(opt));
		}
		return "minihome/mainSection";
	}
}
