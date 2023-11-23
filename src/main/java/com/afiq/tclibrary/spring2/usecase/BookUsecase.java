package com.afiq.tclibrary.spring2.usecase;

import com.afiq.tclibrary.spring2.model.Book;
import com.afiq.tclibrary.spring2.model.Genre;
import com.afiq.tclibrary.spring2.repository.BookRepository;
import com.afiq.tclibrary.spring2.repository.GenreRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class BookUsecase {

    Logger logger = LoggerFactory.getLogger(BookUsecase.class);

    @Autowired
    BookRepository bookRepository;

    @Autowired
    GenreUsecase genreUsecase;

    public int update(Book book) {
        return bookRepository.update(book);
    }

    public Book findById(int id) {
        return bookRepository.findById(id);
    }

    public List<Book> findAllBooks () throws Exception {

        List<Genre> genres = genreUsecase.findAllGenres();

        List<Book> books = new ArrayList<Book>();

        for (Book book : bookRepository.findAll()) {
            book.setGenreName(getGenreByIdFromList(genres, book.getGenreId()));
            books.add(book);
        }

        return books;

    }

    public List<Book> findAllBooksPagination (int offset, int limit) throws Exception {
        List<Book> books = new ArrayList<Book>();
        List<Genre> genres = genreUsecase.findAllGenres();

        for (Book book : bookRepository.findAllPagination(offset, limit)) {
            book.setGenreName(getGenreByIdFromList(genres, book.getGenreId()));
            books.add(book);
        }

        return books;
    }

    private String getGenreByIdFromList(List<Genre> genres, long targetId) {

        for (Genre g : genres) {
            if (g.getId().equals(targetId)) {
                return g.getName();
            }
        }

        return "genre not found";
    }

}
