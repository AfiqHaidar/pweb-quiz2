package com.afiq.tclibrary.spring2.repository;

import com.afiq.tclibrary.spring2.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookRepositoryImpl implements BookRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int save(Book book) {
        return jdbcTemplate.update("insert into public.books(title, description, genre_id) values (?,?,?)",
                new Object[] {book.getTitle(), book.getDescription(), book.getGenreId()});
    }

    @Override
    public List<Book> findAll() {
        return jdbcTemplate.query("select * from public.books", BeanPropertyRowMapper.newInstance(Book.class));
    }

    @Override
    public List<Book> findAllPagination(int offset, int limit) {
        String query = "select * from public.books limit " + limit + " offset " + offset;
        return jdbcTemplate.query(query, BeanPropertyRowMapper.newInstance(Book.class));
    }

    @Override
    public int deleteById(Long id) {
        return jdbcTemplate.update("delete from public.books where id=?", id);
    }
}
