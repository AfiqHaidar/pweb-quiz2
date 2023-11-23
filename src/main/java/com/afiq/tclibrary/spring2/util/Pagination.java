package com.afiq.tclibrary.spring2.util;

import java.util.ArrayList;
import java.util.List;

public class Pagination {
    private List<Integer> pageNumbers;
    private int currentPage;
    private int totalPages;

    public Pagination(List<Integer> pageNumbers, int currentPage, int totalPages) {
        this.pageNumbers = pageNumbers;
        this.currentPage = currentPage;
        this.totalPages = totalPages;
    }

    public Pagination (int totalItems, int offset, int limit, int currentPage) {
        // Calculate total number of pages
        int totalPages = (totalItems + limit - 1) / limit;

        // Ensure current page is within valid range
        currentPage = Math.max(1, Math.min(currentPage, totalPages));

        // Calculate start and end page numbers in the pagination bar
        int paginationRange = 5;  // You can adjust this to set the number of pages in the pagination bar
        int startPage = Math.max(1, currentPage - paginationRange / 2);
        int endPage = Math.min(totalPages, startPage + paginationRange - 1);

        // Generate a list of page numbers
        List<Integer> pageNumbers = new ArrayList<>();
        for (int i = startPage; i <= endPage; i++) {
            pageNumbers.add(i);
        }

        this.pageNumbers = pageNumbers;
        this.currentPage = currentPage;
        this.totalPages = totalPages;
    }

    public List<Integer> getPageNumbers() {
        return pageNumbers;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public int getTotalPages() {
        return totalPages;
    }


}


