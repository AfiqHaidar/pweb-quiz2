package com.afiq.tclibrary.spring2.usecase;

import com.afiq.tclibrary.spring2.model.Genre;
import com.afiq.tclibrary.spring2.repository.BookRepository;
import com.afiq.tclibrary.spring2.repository.GenreRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class GenreUsecase {

    Logger logger = LoggerFactory.getLogger(GenreUsecase.class);

    @Autowired
    BookRepository bookRepository;

    @Autowired
    GenreRepository genreRepository;

    public List<Genre> findAllGenres () throws Exception {

        List<Genre> genres = genreRepository.findAll();

        return genres;

    }

    public int save (Genre genre) {
        return genreRepository.save(genre);
    }

    public int deleteById(long id) {
        return genreRepository.deleteById(id);
    }

}
