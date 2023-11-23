package com.afiq.tclibrary.spring2.repository;

import com.afiq.tclibrary.spring2.model.Book;
import com.afiq.tclibrary.spring2.model.Genre;

import java.util.List;

public interface GenreRepository {

    List<Genre> findAll();

    int save(Genre book);

    int deleteById(Long id);
}
