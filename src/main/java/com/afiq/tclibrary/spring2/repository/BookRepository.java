package com.afiq.tclibrary.spring2.repository;

import com.afiq.tclibrary.spring2.model.Book;

import java.util.List;

public interface BookRepository {

    List<Book> findAll();

    List<Book> findAllPagination(int offset, int limit);

    Book findById(int id);

    int save(Book book);

    int update(Book book);

    int deleteById(Long id);
}
