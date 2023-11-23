package com.afiq.tclibrary.spring2.repository;

import com.afiq.tclibrary.spring2.model.Book;
import com.afiq.tclibrary.spring2.model.Genre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GenreRepositoryImpl implements GenreRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Genre> findAll() {
        return jdbcTemplate.query("select * from library.genre", BeanPropertyRowMapper.newInstance(Genre.class));
    }

    @Override
    public int save(Genre genre) {
        return jdbcTemplate.update("insert into library.genre(name) values (?)",
                new Object[] {genre.getName()});
    }

    @Override
    public int deleteById(Long id) {
        return jdbcTemplate.update("delete from library.genre where id=?", id);
    }
}
