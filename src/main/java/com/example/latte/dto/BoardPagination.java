package com.example.latte.dto;

import lombok.Data;

@Data
public class BoardPagination {

	private int rowsPerPage = 5;		// 한 화면에 표시할 데이터의 개수
	private int pagesPerBlock = 10;		// 한 화면에 표시할 페이지번호의 개수
	private int pageNo;					// 현재 페이지 번호
	private int blockNo;				// 현재 블록 번호
	private int totalRows;				// 총 데이터 개수
	private int totalPages;				// 총 페이지 개수
	private int totalBlocks;			// 총 블록 개수
	private int beginPage; 				// 블록 시작 페이지 번호
	private int endPage;				// 블록 끝 페이지 번호
   
	public BoardPagination(int pageNo, int totalRows) {
		this.pageNo = pageNo;
		this.totalRows = totalRows;
		init();
	}
   
	public BoardPagination(int pageNo, int totalRows, int rowsPerPage) {
		this.pageNo = pageNo;
		this.totalRows = totalRows;
		this.rowsPerPage = rowsPerPage;
		init();
	}

	public BoardPagination(int pageNo, int totalRows, int rowsPerPage, int pagesPerBlock) {
		this.pageNo = pageNo;
		this.totalRows = totalRows;
		this.rowsPerPage = rowsPerPage;
		this.pagesPerBlock = pagesPerBlock;
		init();
	}
   
	private void init() {
		
		this.totalPages = (int) (Math.ceil((double) totalRows/rowsPerPage));
		this.totalBlocks = (int) (Math.ceil((double) totalPages/pagesPerBlock));

		if (pageNo <= 0 || pageNo > totalPages) {
			pageNo = 1;
		}

		blockNo = (int) (Math.ceil((double) pageNo/pagesPerBlock));
		beginPage = (blockNo - 1)*pagesPerBlock + 1;
		endPage = blockNo*pagesPerBlock;

		if (blockNo == totalBlocks) {
			endPage = totalPages;
		}

	}
}
