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
        return jdbcTemplate.update("insert into library.books(title, description, genre_id) values (?,?,?)",
                new Object[] {book.getTitle(), book.getDescription(), book.getGenreId()});
    }

    @Override
    public Book findById(int id) {
        String query = "select * from library.books where id=" + id;
        return jdbcTemplate.queryForObject(query, BeanPropertyRowMapper.newInstance(Book.class));
    }


    @Override
    public int update(Book book) {
        return jdbcTemplate.update("update library.books set title=?, description=?, genre_id=? where id=?",
                new Object[] {book.getTitle(), book.getDescription(), book.getGenreId(), book.getGenreId()});
    }

    @Override
    public List<Book> findAll() {
        return jdbcTemplate.query("select * from library.books", BeanPropertyRowMapper.newInstance(Book.class));
    }

    @Override
    public List<Book> findAllPagination(int offset, int limit) {
        String query = "select * from library.books order by id asc limit " + limit + " offset " + offset;
        return jdbcTemplate.query(query, BeanPropertyRowMapper.newInstance(Book.class));
    }

    @Override
    public int deleteById(Long id) {
        return jdbcTemplate.update("delete from library.books where id=?", id);
    }
}
