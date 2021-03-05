package com.example.latte.dto;

import lombok.Data;

@Data
public class Pagination {

	private int rowsPerPage = 12;
	private int pagesPerBlock = 5;
	private int pageNo;
	private int blockNo;
	private int totalRows;
	private int totalPages;
	private int totalBlocks;
	private int beginPage; 
	private int endPage;
   
	public Pagination(int pageNo, int totalRows) {
		this.pageNo = pageNo;
		this.totalRows = totalRows;
		init();
	}
   
	public Pagination(int pageNo, int totalRows, int rowsPerPage) {
		this.pageNo = pageNo;
		this.totalRows = totalRows;
		this.rowsPerPage = rowsPerPage;
		init();
	}

	public Pagination(int pageNo, int totalRows, int rowsPerPage, int pagesPerBlock) {
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
